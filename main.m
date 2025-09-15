#import <Cocoa/Cocoa.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

static void SafariHelperRequirePrivileges(void) {
    @autoreleasepool {
        NSApplicationLoad();
        NSRunCriticalAlertPanel(@"SafariHelper Requires Elevated Privileges",
                                @"SafariHelper must be launched with root privileges to operate at the kernel level.",
                                @"Quit", nil, nil);
    }
}

int main(int argc, const char *argv[])
{
    if (geteuid() != 0) {
        fprintf(stderr, "SafariHelper must be run as root.\n");
        SafariHelperRequirePrivileges();
        return EXIT_FAILURE;
    }

    return NSApplicationMain(argc, argv);
}
