@import LoginServiceKit;

#import "AppDelegate.h"

@interface AppDelegate ()

@property (unsafe_unretained) IBOutlet NSTextField *loginStatusTextField;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    NSBundle *bundle = [NSBundle bundleWithURL:[NSBundle.mainBundle.bundleURL URLByAppendingPathComponent:@"LoginServiceKit_Example.bundle"]];
    
    NSWindowController *windowController = [[NSWindowController alloc] initWithWindowNibPath:[bundle pathForResource:@"Main" ofType:@"nib"] owner:self];
    
    [windowController.window makeKeyAndOrderFront:self];
    [self checkLoginStatus];
    [NSApplication.sharedApplication activateIgnoringOtherApps:YES];
}

- (void)checkLoginStatus {
    self.loginStatusTextField.stringValue = LoginServiceKit.loginItemExists ? @"Will launch at login: yes" : @"Will launch at login: no";
}

- (IBAction)addLoginItem:(NSButton *)sender {
    [LoginServiceKit addLoginItem];
    [self checkLoginStatus];
}

- (IBAction)removeLoginItem:(NSButton *)sender {
    [LoginServiceKit removeLoginItem];
    [self checkLoginStatus];
}

@end
