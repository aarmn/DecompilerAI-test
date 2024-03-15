#include <stdio.h>
#include <stdlib.h>

void readFileToString(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Cannot open file %s\n", filename);
        return;
    }
    char ch;
    while ((ch = fgetc(file)) != EOF) {
        putchar(ch);
    }
    fclose(file);
}

int main() {
    const char *filename = "example.txt";
    readFileToString(filename);
    return 0;
}
