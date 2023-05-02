#include <stdio.h>

struct process {
    int id;
    int burst_time;
    int waiting_time;
    int turnaround_time;
};

int main() {
    int n, i;
    float avg_waiting_time = 0, avg_turnaround_time = 0;

    printf("Enter the number of processes: ");
    scanf("%d", &n);

    struct process processes[n];
    int current_time = 0;

    // Initialize the processes
    for(i = 0; i < n; i++) {
        processes[i].id = i;
        printf("Enter the burst time of process %d: ", i);
        scanf("%d", &processes[i].burst_time);
        processes[i].waiting_time = 0;
        processes[i].turnaround_time = 0;
    }

    // Execute the processes using the FCFS algorithm
    for(i = 0; i < n; i++) {
        struct process *p = &processes[i];
        p->waiting_time = current_time;
        p->turnaround_time = current_time + p->burst_time;
        avg_waiting_time += p->waiting_time;
        avg_turnaround_time += p->turnaround_time;
        current_time += p->burst_time;
    }

    // Calculate the average waiting time and turnaround time
    avg_waiting_time /= n;
    avg_turnaround_time /= n;

    // Print the results
    printf("\nProcess\t Burst Time\t Waiting Time\t Turnaround Time\n");
    for(i = 0; i < n; i++) {
        struct process p = processes[i];
        printf("%d\t %d\t\t %d\t\t %d\n", p.id, p.burst_time, p.waiting_time, p.turnaround_time);
    }
    printf("\nAverage waiting time: %.2f\n", avg_waiting_time);
    printf("Average turnaround time: %.2f\n", avg_turnaround_time);

    return 0;
}
