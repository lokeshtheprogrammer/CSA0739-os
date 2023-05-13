#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <semaphore.h>

sem_t S;

void *process(void *arg) {
    int id = (int)arg;
    printf("Process P%d is waiting for S\n", id);
    sem_wait(&S);
    printf("Process P%d has acquired S\n", id);
    printf("Process P%d is releasing S\n", id);
    sem_post(&S);
    pthread_exit(NULL);
}

int main() {
    sem_init(&S, 0, 4); // initialize semaphore with 4 instances
    pthread_t threads[4];
    int ids[4] = {1, 2, 3, 4};
    for (int i = 0; i < 4; i++) {
        pthread_create(&threads[i], NULL, process, &ids[i]);
    }
    for (int i = 0; i < 4; i++) {
        pthread_join(threads[i], NULL);
    }
    sem_destroy(&S);
    return 0;
}
