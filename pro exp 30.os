#include <stdio.h>
#include <pthread.h>

void *print_even(void *arg)
{
    int i;
    for (i = 0; i <= 10; i += 2) {
        printf("Even thread: %d\n", i);
    }
    pthread_exit(NULL);
}

void *print_odd(void *arg)
{
    int i;
    for (i = 1; i <= 10; i += 2) {
        printf("Odd thread: %d\n", i);
    }
    pthread_exit(NULL);
}

int main()
{
    pthread_t tid1, tid2;

    // Create two threads
    pthread_create(&tid1, NULL, print_even, NULL);
    pthread_create(&tid2, NULL, print_odd, NULL);

    // Wait for threads to finish
    pthread_join(tid1, NULL);
    pthread_join(tid2, NULL);

    return 0;
}
