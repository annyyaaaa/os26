#ifndef M_TIME_H
#define M_TIME_H
#include <time.h>
#include <sys/times.h>
#include <unistd.h>

static inline void fnGetDateTime(char *buffer, int size, int flag1, int flag2){
    time_t t = time(NULL);
    struct tm *tm = localtime(&t);
    strftime(buffer, size, "%Y-%m-%d %H:%M:%S", tm);
}
static inline void fnGetProcTime(int flag1, int flag2){
    struct tms tms;
    times(&tms);
}
#endif
