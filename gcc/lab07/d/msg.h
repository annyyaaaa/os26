#define MAXTEXT 72
#define PERM 0666

typedef struct message_data
{
    int client_pid;
    char text[MAXTEXT];
} MessageData;

typedef struct our_msgbuff
{
    long mtype;
    MessageData data;
} Message;
