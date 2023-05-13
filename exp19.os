#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <semaphore.h>

// Define shared memory variable
int shared_data = 10;

// Define semaphores
sem_t sem1, sem2;

// Function for thread 1
void* thread1_func(void* arg) {
    // Wait on semaphore 1
    sem_wait(&sem1);
    
    // Read shared data, double it, and print
    int data = shared_data;
    printf("Thread 1: %d * 2 = %d\n", data, data * 2);
    
    // Signal semaphore 2
    sem_post(&sem2);
    
    pthread_exit(NULL);
}

// Function for thread 2
void* thread2_func(void* arg) {
    // Wait on semaphore 2
    sem_wait(&sem2);
    
    // Read shared data, multiply by 5, and print
    int data = shared_data;
    printf("Thread 2: %d * 5 = %d\n", data, data * 5);
    
    // Signal semaphore 1
    sem_post(&sem1);
    
    pthread_exit(NULL);
}

int main() {
    // Initialize semaphores
    sem_init(&sem1, 0, 1);
    sem_init(&sem2, 0, 0);
    
    // Create threads
    pthread_t thread1, thread2;
    pthread_create(&thread1, NULL, thread1_func, NULL);
    pthread_create(&thread2, NULL, thread2_func, NULL);
    
    // Wait for threads to finish
    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);
    
    // Destroy semaphores
    sem_destroy(&sem1);
    sem_destroy(&sem2);
    
    return 0;
}
