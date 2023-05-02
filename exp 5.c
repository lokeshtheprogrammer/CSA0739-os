#include <stdio.h>

struct process {
    int id;
    int arrival_time;
    int burst_time;
    int remaining_time;
    int waiting_time;
    int turnaround_time;
};

int main() {
    int n, i, j;
    float avg_waiting_time = 0, avg_turnaround_time = 0;

    printf("Enter the number of processes: ");
    scanf("%d", &n);

    struct process processes[n];
    int remaining_processes = n;
    int current_time = 0;

    // Initialize the processes
    for(i = 0; i < n; i++) {
        processes[i].id = i+1;
        printf("Enter the arrival time and burst time of process P%d: ", i+1);
        scanf("%d %d", &processes[i].arrival_time, &processes[i].burst_time);
        processes[i].remaining_time = processes[i].burst_time;
        processes[i].waiting_time = 0;
        processes[i].turnaround_time = 0;
    }

    // Sort the processes by arrival time
    for(i = 0; i < n-1; i++) {
        for(j = i+1; j < n; j++) {
            if(processes[i].arrival_time > processes[j].arrival_time) {
                struct process temp = processes[i];
                processes[i] = processes[j];
                processes[j] = temp;
            }
        }
    }

    // Execute the processes using the SRPT algorithm
    while(remaining_processes > 0) {
        int shortest_time = -1;
        int shortest_index = -1;
        for(i = 0; i < n; i++) {
            if(processes[i].arrival_time <= current_time && processes[i].remaining_time > 0) {
                if(shortest_time == -1 || processes[i].remaining_time < shortest_time) {
                    shortest_time = processes[i].remaining_time;
                    shortest_index = i;
                }
            }
        }

        if(shortest_index == -1) {
            current_time++;
        } else {
            struct process *p = &processes[shortest_index];
            p->remaining_time--;
            if(p->remaining_time == 0) {
                p->turnaround_time = current_time + 1 - p->arrival_time;
                p->waiting_time = p->turnaround_time - p->burst_time;
                avg_waiting_time += p->waiting_time;
                avg_turnaround_time += p->turnaround_time;
                remaining_processes--;
            }
            current_time++;
        }
    }

    // Calculate the average waiting time and turnaround time
    avg_waiting_time /= n;
    avg_turnaround_time /= n;

    // Print the results
    printf("\nProcess\t Arrival Time\t Burst Time\t Waiting Time\t Turnaround Time\n");
    for(i = 0; i < n; i++) {
        struct process p = processes[i];
        printf("P%d\t %d\t\t %d\t\t %d\t\t %d\n", p.id, p.arrival_time, p.burst_time, p.waiting_time, p.turnaround_time);
    }
    printf("\nAverage waiting time: %.2f\n", avg_waiting_time);
    printf("Average turnaround time: %.2f\n", avg_turnaround_time);

    return 0;
}
