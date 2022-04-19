#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginServiceKit : NSObject

@property (class, readonly) BOOL loginItemExists;

+ (BOOL)loginItemExistsAtPath:(NSString *)path;

+ (BOOL)addLoginItem;
+ (BOOL)addLoginItemAtPath:(NSString *)path;

+ (BOOL)removeLoginItem;
+ (BOOL)removeLoginItemAtPath:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
