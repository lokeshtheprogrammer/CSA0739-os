#include<stdio.h>

// Function to find the waiting time for all processes
void findWaitingTime(int n, int bt[], int wt[], int pri[])
{
    // Priority scheduling
    int p[n], i, j;
    for (i = 0; i < n; i++)
        p[i] = i;

    // Sort processes based on priority
    for (i = 0; i < n - 1; i++)
    {
        int max = i;
        for (j = i + 1; j < n; j++)
        {
            if (pri[p[j]] < pri[p[max]])
                max = j;
        }
        int temp = p[i];
        p[i] = p[max];
        p[max] = temp;
    }

    // Waiting time for first process is 0
    wt[p[0]] = 0;

    // Calculate waiting time
    for (i = 1; i < n; i++)
    {
        wt[p[i]] = 0;
        for (j = 0; j < i; j++)
            wt[p[i]] += bt[p[j]];
    }
}

// Function to calculate turnaround time for all processes
void findTurnAroundTime(int n, int bt[], int wt[], int tat[])
{
    // Calculate turnaround time
    int i;
    for (i = 0; i < n; i++)
        tat[i] = bt[i] + wt[i];
}

// Function to calculate average time
void findAvgTime(int n, int bt[], int pri[])
{
    int wt[n], tat[n], total_wt = 0, total_tat = 0, i;

    // Find waiting time of all processes
    findWaitingTime(n, bt, wt, pri);

    // Find turnaround time of all processes
    findTurnAroundTime(n, bt, wt, tat);

    // Display processes along with all details
    printf("\nProcess  Burst Time  Priority  Waiting Time  Turnaround Time");

    // Calculate total waiting time and total turnaround time
    for (i = 0; i < n; i++)
    {
        total_wt = total_wt + wt[i];
        total_tat = total_tat + tat[i];
        printf("\nP%d\t\t%d\t\t%d\t\t%d\t\t%d", i + 1, bt[i], pri[i], wt[i], tat[i]);
    }

    // Calculate average waiting time and average turnaround time
    float avg_wt = (float)total_wt / (float)n;
    float avg_tat = (float)total_tat / (float)n;

    printf("\n\nAverage Waiting Time = %0.2f", avg_wt);
    printf("\nAverage Turnaround Time = %0.2f\n", avg_tat);
}

// Driver code
int main()
{
    int n = 3; // Number of processes

    int burst_time[] = {30, 5, 12}; // Burst time of the processes

    int priority[] = {2, 1, 3}; // Priority of the processes

    findAvgTime(n, burst_time, priority);

    return 0;
}
