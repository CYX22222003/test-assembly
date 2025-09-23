#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

void ll_puts(int8_t *s) {
  puts((char *)s);
}

int8_t* ll_strcat(int8_t* s1, int8_t* s2) {
    if (!s1) s1 = (int8_t*)"";
    if (!s2) s2 = (int8_t*)"";

    size_t l1 = strlen((char*)s1);
    size_t l2 = strlen((char*)s2);

    int8_t* buf = (int8_t*)malloc(l1 + l2 + 1); // +1 for null terminator
    if (!buf) return NULL; // malloc failed

    memcpy(buf, s1, l1);
    memcpy(buf + l1, s2, l2);
    buf[l1 + l2] = '\0'; // null terminate

    return buf;
}

int64_t ll_callback(int64_t (*fun)(int64_t, int64_t)) {
  int64_t x = 19L;
  return fun(x, x);
}

int8_t* ll_ltoa(int64_t i) {
  char* buf = (char*)calloc(20, sizeof(char));
  snprintf((char *)buf, 20, "%ld", (long)i);
  return (int8_t *)buf;
}

void *ll_malloc(int64_t n, int64_t size) {
  return calloc(n, size);
}

