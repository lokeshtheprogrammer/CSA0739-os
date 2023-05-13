#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>

#define BUFFER_SIZE 1024

int main()
{
    char filename[100], buffer[BUFFER_SIZE];
    int file_descriptor, read_bytes, write_bytes;

    // Prompt user to enter the filename
    printf("Enter the filename: ");
    scanf("%s", filename);

    // Open the file for writing with read/write permissions for the user
    file_descriptor = open(filename, O_WRONLY | O_CREAT, 0644);

    // Check if file opened successfully
    if (file_descriptor < 0) {
        perror("Error creating file");
        exit(1);
    }

    // Prompt user to enter the data to be written to the file
    printf("Enter the data to be written to the file:\n");

    // Read data from the user
    fgets(buffer, BUFFER_SIZE, stdin);

    // Write the data to the file
    write_bytes = write(file_descriptor, buffer, strlen(buffer));

    // Close the file
    close(file_descriptor);

    // Open the file for reading
    file_descriptor = open(filename, O_RDONLY);

    // Check if file opened successfully
    if (file_descriptor < 0) {
        perror("Error opening file");
        exit(1);
    }

    // Read the data from the file
    read_bytes = read(file_descriptor, buffer, BUFFER_SIZE);

    // Close the file
    close(file_descriptor);

    // Print the data to the console
    printf("\nData read from the file: %s\n", buffer);

    return 0;
}
