#import "DNLoginServiceKit.h"

@implementation DNLoginServiceKit

+ (BOOL)loginItemExists {
    return [self loginItemExistsAtPath:NSBundle.mainBundle.bundlePath];
}

+ (BOOL)loginItemExistsAtPath:(NSString *)path {
    LSSharedFileListRef loginItemList = self.loginItemList;
    return [self loginItemAtPath:path withLoginItemList:loginItemList] != nil;
}

+ (BOOL)addLoginItem {
    return [self addLoginItemAtPath:NSBundle.mainBundle.bundlePath];
}

+ (BOOL)addLoginItemAtPath:(NSString *)path {
    if ([self loginItemExistsAtPath:path]) return NO;
    
    LSSharedFileListRef fileList = LSSharedFileListCreate(nil, kLSSharedFileListSessionLoginItems, nil);
    NSURL *url = [NSURL fileURLWithPath:path];
    LSSharedFileListInsertItemURL(fileList, kLSSharedFileListItemBeforeFirst, nil, nil, (__bridge CFURLRef)url, nil, nil);
    
    return YES;
}

+ (BOOL)removeLoginItem {
    return [self removeLoginItemAtPath:NSBundle.mainBundle.bundlePath];
}

+ (BOOL)removeLoginItemAtPath:(NSString *)path {
    LSSharedFileListRef loginItemList = self.loginItemList;
    LSSharedFileListItemRef loginItem = [self loginItemAtPath:path withLoginItemList:loginItemList];
    
    if (loginItem == nil) return NO;
    
    LSSharedFileListItemRemove(loginItemList, loginItem);
    
    return YES;
}

+ (LSSharedFileListRef)loginItemList {
    return LSSharedFileListCreate(nil, kLSSharedFileListSessionLoginItems, nil);
}

+ (LSSharedFileListItemRef _Nullable)loginItemAtPath:(NSString *)path withLoginItemList:(LSSharedFileListRef)loginItemList {
    if (path.length == 0) return nil;
    
    NSURL *url = [NSURL fileURLWithPath:path];
    NSArray *loginItemListSnapshot = (__bridge NSArray *)(LSSharedFileListCopySnapshot(loginItemList, nil));
    
    for (id loginItem in loginItemListSnapshot) {
        LSSharedFileListItemRef item = (__bridge LSSharedFileListItemRef)(loginItem);
        NSURL *itemURL = (__bridge NSURL *)(LSSharedFileListItemCopyResolvedURL(item, 0, nil));
        if ([itemURL.absoluteString isEqualToString:url.absoluteString]) return item;
    }
    
    return nil;
}

@end
