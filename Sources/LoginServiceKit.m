#import <LoginServiceKit/LoginServiceKit.h>
#import <AppKit/AppKit.h>

@implementation LoginServiceKit

+ (BOOL)loginItemExists {
    return [self loginItemExistsAtPath:NSBundle.mainBundle.bundlePath];
}

+ (BOOL)loginItemExistsAtPath:(NSString *)path {
    __block BOOL exists = NO;
    
    [self getLoginItemAtPath:path block:^(LSSharedFileListRef _Nonnull list, LSSharedFileListItemRef _Nonnull item) {
        exists = YES;
    }];
    
    return exists;
}

+ (BOOL)addLoginItem {
    return [self addLoginItemAtPath:NSBundle.mainBundle.bundlePath];
}

+ (BOOL)addLoginItemAtPath:(NSString *)path {
    if ([self loginItemExistsAtPath:path]) return NO;
    
    LSSharedFileListRef fileList = LSSharedFileListCreate(nil, kLSSharedFileListSessionLoginItems, nil);
    NSURL *url = [NSURL fileURLWithPath:path];
    LSSharedFileListInsertItemURL(fileList, kLSSharedFileListItemBeforeFirst, nil, nil, (__bridge CFURLRef)url, nil, nil);
    
    CFRelease(fileList);
    
    return YES;
}

+ (BOOL)removeLoginItem {
    return [self removeLoginItemAtPath:NSBundle.mainBundle.bundlePath];
}

+ (BOOL)removeLoginItemAtPath:(NSString *)path {
    __block bool wasRemoved = NO;
    
    [self getLoginItemAtPath:path block:^(LSSharedFileListRef _Nonnull list, LSSharedFileListItemRef _Nonnull item) {
        OSStatus status = LSSharedFileListItemRemove(list, item);
        if (status == noErr) {
            wasRemoved = YES;
        }
    }];
    
    return wasRemoved;
}

+ (void)getLoginItemAtPath:(NSString * _Nonnull)path block:(void (^)(LSSharedFileListRef _Nonnull, LSSharedFileListItemRef _Nonnull))block {
    LSSharedFileListRef loginItemList = LSSharedFileListCreate(nil, kLSSharedFileListSessionLoginItems, nil);
    
    NSURL *url = [NSURL fileURLWithPath:path];
    CFArrayRef loginItemListSnapshot = LSSharedFileListCopySnapshot(loginItemList, nil);
    
    for (id loginItem in (__bridge NSArray *)loginItemListSnapshot) {
        LSSharedFileListItemRef item = (__bridge LSSharedFileListItemRef)(loginItem);
        CFURLRef itemURL = LSSharedFileListItemCopyResolvedURL(item, 0, nil);
        if ([((__bridge NSURL *)itemURL).absoluteString isEqualToString:url.absoluteString]) {
            block(loginItemList, item);
            CFRelease(itemURL);
            break;
        }
        CFRelease(itemURL);
    }
    
    CFRelease(loginItemListSnapshot);
}

@end
