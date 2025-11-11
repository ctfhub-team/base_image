#include <stdio.h>
#include <stdlib.h>
#include <time.h>
/*
gcc -no-pie -fno-stack-protector -z execstack -static -o pwn pwn.c
*/
void backdoor(void) {
    system("/bin/bash");
}


int main(void) {
    setvbuf(stdout, 0LL, 2, 0LL);
    setvbuf(stdin, 0LL, 1, 0LL);
    system("cat /flag");
    char buf[100];
    printf("Welcome to CTFHub Test Pwn. Please input someting:\n");
    gets(buf);
    printf("bye\n");
    return 0;
}

