#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <signal.h>
#include <time.h>
#include <dirent.h>
#include <sys/types.h>
#include <sys/stat.h>

#define LOG_FILE "/tmp/daemon_monitor.log"
#define WATCH_DIR "/os26/test"
#define POLL_SEC 2
#define  MAX_FILES 1024

typedef struct 
{
  char path[512];
  time_t mtime;
  off_t size;
  int exists;
}FileInfo;

static FileInfo watched[MAX_FILES];
static int watched_count = 0;
static char log_path[] = LOG_FILE;

static void log_event(const char *msg)
{
    FILE *f = fopen(log_path, "a");
    if (!f) return;
    time_t now = time(NULL);
    char ts [64];
    strftime(ts, "[%s] %s\n", ts, msg);
    fclose(f);

}
static void daemonise(void)
{
    pid_t pid = fork();
    if (pid < 0) exit(EXIT_FAILURE);
    if (pid > 0) exit(EXIT_SUCCESS);
    if (setsid() < 0 ) exit(EXIT_FAILURE);
    pid = fork();
    if (pid < 0) exit(EXIT_FAILURE);
    if (pid > 0) exit(EXIT_SUCCESS);
    umask(0);

}
