#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main() {
    int pid[4];

    for(int i = 0; i < 4; i++) {
        pid[i] = fork();

        if(pid[i] == 0) {
            switch(i) {
                case 0: // First child
                    printf("First child process with PID %d: ", getpid());
                    for(int j = 1; j <= 10; j++) {
                        if(j % 2 == 1) {
                            printf("%d ", j);
                        }
                    }
                    printf("\n");
                    break;

                case 1: // Second child
                    printf("Second child process with PID %d: ", getpid());
                    for(int j = 1; j <= 10; j++) {
                        if(j % 2 == 0) {
                            printf("%d ", j);
                        }
                    }
                    printf("\n");
                    break;

                case 2: // Third child
                    printf("Third child process with PID %d: ", getpid());
                    for(int j = 1; j <= 10; j++) {
                        if(j % 3 == 0) {
                            printf("%d ", j);
                        }
                    }
                    printf("\n");
                    break;

                case 3: // Fourth child
                    printf("Fourth child process with PID %d: ", getpid());
                    for(int j = 1; j <= 10; j++) {
                        if(j % 5 == 0) {
                            printf("%d ", j);
                        }
                    }
                    printf("\n");
                    break;
            }

            exit(0);
        }
    }

    return 0;
}
