#include <stdio.h>

#define FILE_SIZE 100
#define BLOCK_SIZE 1
#define INDEX_SIZE 1
#define BLOCKS_PER_INDEX_BLOCK (INDEX_SIZE / BLOCK_SIZE)

int main() {
    int contiguous_ops_beginning, contiguous_ops_middle, contiguous_ops_end;
    int linked_ops_beginning, linked_ops_middle, linked_ops_end;
    int indexed_ops_beginning, indexed_ops_middle, indexed_ops_end;

    // Contiguous allocation
    contiguous_ops_beginning = FILE_SIZE;
    contiguous_ops_middle = 2 * FILE_SIZE;
    contiguous_ops_end = FILE_SIZE + 1;

    // Linked allocation
    linked_ops_beginning = 1;
    linked_ops_middle = FILE_SIZE / 2 + 1;
    linked_ops_end = FILE_SIZE + 1;

    // Indexed allocation
    indexed_ops_beginning = 2;
    indexed_ops_middle = 2 + (FILE_SIZE / BLOCKS_PER_INDEX_BLOCK) + 1;
    indexed_ops_end = 2 + (FILE_SIZE / BLOCKS_PER_INDEX_BLOCK) + 2;

    printf("Contiguous allocation:\n");
    printf("At beginning: %d disk I/O operations\n", contiguous_ops_beginning);
    printf("In middle: %d disk I/O operations\n", contiguous_ops_middle);
    printf("At end: %d disk I/O operations\n", contiguous_ops_end);

    printf("Linked allocation:\n");
    printf("At beginning: %d disk I/O operations\n", linked_ops_beginning);
    printf("In middle: %d disk I/O operations\n", linked_ops_middle);
    printf("At end: %d disk I/O operations\n", linked_ops_end);

    printf("Indexed allocation:\n");
    printf("At beginning: %d disk I/O operations\n", indexed_ops_beginning);
    printf("In middle: %d disk I/O operations\n", indexed_ops_middle);
    printf("At end: %d disk I/O operations\n", indexed_ops_end);

    return 0;
}
