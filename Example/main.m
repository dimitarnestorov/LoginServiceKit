@import Cocoa;

#import "AppDelegate.h"

int main(int argc, const char * argv[]) {
    NSApplication *app = NSApplication.sharedApplication;
    AppDelegate *appDelegate = [AppDelegate new];
    app.activationPolicy = NSApplicationActivationPolicyRegular;
    app.delegate = appDelegate;
    [app run];
}
