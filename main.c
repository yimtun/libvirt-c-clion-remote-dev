/* example ex1.c */
/* compile with: gcc -g -Wall ex1.c -o ex -lvirt */
#include <stdio.h>
#include <stdlib.h>
#include <libvirt/libvirt.h>

int main(int argc, char *argv[])
{
    virConnectPtr conn;

    conn = virConnectOpen("qemu+ssh://root@172.16.99.32/system");
    if (conn == NULL) {
        fprintf(stderr, "Failed to open connection to qemu:///system\n");
        return 1;
    }
    printf("xxx");


// list active domains

    int i;
    int numDomains;
    int *activeDomains;

    numDomains = virConnectNumOfDomains(conn);

    activeDomains = malloc(sizeof(int) * numDomains);
    numDomains = virConnectListDomains(conn, activeDomains, numDomains);

    printf("Active domain IDs:\n");
    for (i = 0 ; i < numDomains ; i++) {
        printf("  %d\n", activeDomains[i]);
    }
    free(activeDomains);
//

    virConnectClose(conn);
    return 0;
}