@import DNLoginServiceKit;

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *loginStatusTextField;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    [self checkLoginStatus];
}

- (void)checkLoginStatus {
    self.loginStatusTextField.stringValue = DNLoginServiceKit.loginItemExists ? @"Login Status: On" : @"Login Status: Off";
}

- (IBAction)addLoginItem:(NSButton *)sender {
    [DNLoginServiceKit addLoginItem];
    [self checkLoginStatus];
}

- (IBAction)removeLoginItem:(NSButton *)sender {
    [DNLoginServiceKit removeLoginItem];
    [self checkLoginStatus];
}

@end
