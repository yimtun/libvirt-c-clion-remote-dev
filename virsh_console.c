#include <libvirt/libvirt.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    virConnectPtr conn;
    virDomainPtr domain;
    virStreamPtr stream;
    const char *uri = "qemu+tcp://10.211.55.8/system";  // Libvirt URI
    const char *vm_name = "default_virtualmachine-sample";      // 虚拟机名称

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

    // 控制台打开成功，执行后续操作
    // 比如进行双向I/O（读取和写入流）

    // 结束流操作并释放资源
    virStreamFinish(stream);  // 结束流
    virStreamFree(stream);    // 释放流对象
    virDomainFree(domain);    // 释放虚拟机对象
    virConnectClose(conn);    // 关闭 libvirt 连接

    return EXIT_SUCCESS;
}
// gcc -o virsh_console virsh_console.c -lvirt
