#include <stdio.h>
#include <stdlib.h>

#define MAX_TRACKS 100

int compare(const void *a, const void *b) {
    return *(int *)a - *(int *)b;
}

int main() {
    int tracks[MAX_TRACKS] = {0};
    int num_tracks, track_pos, direction, i, j, current_track, next_track, head_movement;
    float avg_head_movement;

    printf("Enter the number of tracks: ");
    scanf("%d", &num_tracks);

    printf("Enter the track positions: ");
    for (i = 0; i < num_tracks; i++) {
        scanf("%d", &tracks[i]);
    }

    printf("Enter the initial track position: ");
    scanf("%d", &track_pos);

    printf("Enter the direction of movement (0 for left, 1 for right): ");
    scanf("%d", &direction);

    // sort the tracks in ascending order
    qsort(tracks, num_tracks, sizeof(int), compare);

    // find the current track position in the sorted array
    for (i = 0; i < num_tracks; i++) {
        if (tracks[i] >= track_pos) {
            break;
        }
    }
    current_track = i;

    head_movement = 0;
    while (1) {
        // find the next track to visit
        if (direction == 0) { // left
            if (current_track == 0) {
                direction = 1;
                next_track = current_track + 1;
            } else {
                next_track = current_track - 1;
            }
        } else { // right
            if (current_track == num_tracks - 1) {
                direction = 0;
                next_track = current_track - 1;
            } else {
                next_track = current_track + 1;
            }
        }

        // update the head movement
        head_movement += abs(tracks[current_track] - tracks[next_track]);

        // move to the next track
        current_track = next_track;

        // check if all tracks have been visited
        if (current_track == 0 && direction == 0) {
            break;
        }
        if (current_track == num_tracks - 1 && direction == 1) {
            break;
        }
    }

    // compute the average head movement
    avg_head_movement = (float)head_movement / num_tracks;

    printf("Average head movement: %.2f\n", avg_head_movement);

    return 0;
}
