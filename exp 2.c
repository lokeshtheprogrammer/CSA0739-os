#include <stdio.h>
#include <stdlib.h>

int main() {
    int pages[] = {1, 2, 3, 4, 1, 2, 5, 1, 2, 3, 4, 5}; // Test case
    int n = sizeof(pages) / sizeof(pages[0]);
    int capacity = 3; // Number of page frames
    int frames[capacity];
    int page_faults = 0;
    int oldest_page = 0;

    for (int i = 0; i < n; i++) {
        int page = pages[i];
        int found = 0;

        // Check if page is already in a frame
        for (int j = 0; j < capacity; j++) {
            if (frames[j] == page) {
                found = 1;
                break;
            }
        }

        // If page is not in a frame, replace the oldest page with the new page
        if (!found) {
            frames[oldest_page] = page;
            oldest_page = (oldest_page + 1) % capacity;
            page_faults++;
        }

        // Print the current state of the page frames
        printf("Page %d: ", page);
        for (int j = 0; j < capacity; j++) {
            if (frames[j] == 0) {
                printf("- ");
            } else {
                printf("%d ", frames[j]);
            }
        }
        printf("\n");
    }

    printf("Total page faults: %d\n", page_faults);

    return 0;
}
