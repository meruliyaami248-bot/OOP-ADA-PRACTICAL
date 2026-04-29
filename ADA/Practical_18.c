#include <stdio.h>
#include <stdlib.h>
#include <utmp.h>
#include <fcntl.h>
#include <unistd.h>
#include <time.h>

int main() {
    struct utmp entry;
    int fd;

    // Open utmp file
    fd = open("/var/run/utmp", O_RDONLY);
    if (fd == -1) {
        perror("Unable to open utmp file");
        return 1;
    }

    printf("USER\t\tTTY\t\tLOGIN TIME\n");
    printf("-------------------------------------------------------------\n");

    // Read utmp entries
    while (read(fd, &entry, sizeof(entry)) == sizeof(entry)) {
        if (entry.ut_type == USER_PROCESS) {
            // Convert login time to readable format
            time_t login_time = entry.ut_tv.tv_sec;
            printf("%-15s %-15s %s",
                   entry.ut_user,
                   entry.ut_line,
                   ctime(&login_time));
        }
    }

    close(fd);
    return 0;
}
