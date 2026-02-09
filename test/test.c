#include <stdio.h>
#include <stdlib.h>

int hellothere();

int hellothere() { return 0; }

int main() {
  FILE *fp;

  fp = fopen("test\\input.txt", "r");
  if (fp == NULL) {
    exit(EXIT_FAILURE);
  }

  char buffer[128];

  while (fgets(buffer, sizeof(buffer), fp) != NULL) {
    printf("Retrieved line of length %s:\n", buffer);
  }

  hellothere();

  fclose(fp);
  exit(0);
}
