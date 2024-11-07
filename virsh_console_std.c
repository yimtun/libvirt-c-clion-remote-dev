#include <libvirt/libvirt.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <termios.h>
#include <sys/select.h>

int main() {
    virConnectPtr conn;
    virDomainPtr domain;
    virStreamPtr stream;
    const char *uri = "qemu+tcp://10.211.55.8/system";  // Libvirt URI
    const char *vm_name = "default_virtualmachine-sample";  // 虚拟机名称

    // 打开到 libvirt 的连接
    conn = virConnectOpen(uri);
    if (conn == NULL) {
        fprintf(stderr, "Failed to open connection to %s\n", uri);
        return EXIT_FAILURE;
    }

    // 查找虚拟机
    domain = virDomainLookupByName(conn, vm_name);
    if (domain == NULL) {
        fprintf(stderr, "Failed to find domain %s\n", vm_name);
        virConnectClose(conn);
        return EXIT_FAILURE;
    }

    // 创建一个新的非阻塞流
    stream = virStreamNew(conn, VIR_STREAM_NONBLOCK);
    if (stream == NULL) {
        fprintf(stderr, "Failed to create stream\n");
        virDomainFree(domain);
        virConnectClose(conn);
        return EXIT_FAILURE;
    }

    // 打开虚拟机的控制台并将流与其绑定
    int ret = virDomainOpenConsole(domain, NULL, stream, 0);
    if (ret == -1) {
        fprintf(stderr, "Failed to open console: %s\n", virGetLastError());
        virStreamFree(stream);
        virDomainFree(domain);
        virConnectClose(conn);
        return EXIT_FAILURE;
    }

    // 设置终端为原始模式，以便直接读取键盘输入
    struct termios oldt, newt;
    tcgetattr(STDIN_FILENO, &oldt);
    newt = oldt;
    newt.c_lflag &= ~(ICANON | ECHO);  // 设置为原始模式
    tcsetattr(STDIN_FILENO, TCSANOW, &newt);

    fd_set readfds;
    int maxfd = STDIN_FILENO > fileno(stdout) ? STDIN_FILENO : fileno(stdout);
    while (1) {
        FD_ZERO(&readfds);
        FD_SET(STDIN_FILENO, &readfds);   // 监听标准输入
        FD_SET(fileno(stdout), &readfds);  // 监听输出流（虚拟机控制台的输出）

        // 等待输入数据
        select(maxfd + 1, &readfds, NULL, NULL, NULL);

        // 如果有输入数据，发送到虚拟机的控制台
        if (FD_ISSET(STDIN_FILENO, &readfds)) {
            char buf[1024];
            ssize_t len = read(STDIN_FILENO, buf, sizeof(buf));
            if (len > 0) {
                virStreamSend(stream, buf, len);
            }
        }

        // 如果有虚拟机控制台的输出，打印到标准输出
        if (FD_ISSET(fileno(stdout), &readfds)) {
            char buf[1024];
            ssize_t len = virStreamRecv(stream, buf, sizeof(buf));
            if (len > 0) {
                write(fileno(stdout), buf, len);  // 打印到终端
            }
        }
    }

    // 清理资源
    tcsetattr(STDIN_FILENO, TCSANOW, &oldt);  // 恢复终端设置
    virStreamFinish(stream);  // 结束流
    virStreamFree(stream);    // 释放流对象
    virDomainFree(domain);    // 释放虚拟机对象
    virConnectClose(conn);    // 关闭 libvirt 连接

    return EXIT_SUCCESS;
}
// gcc -o virsh_console_std virsh_console_std.c -lvirt
