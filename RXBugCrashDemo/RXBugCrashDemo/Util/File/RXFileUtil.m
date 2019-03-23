//
//  RXFileUtil.m
//  RXBugCrashDemo
//
//  Created by Rush.D.Xzj on 2019/3/22.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXFileUtil.h"
// https://www.cnblogs.com/gujiande/p/9449227.html
@implementation RXFileUtil


+ (void)test {
    
    
    // NSApplicationScriptsDirectory NSTrashDirectory 有available问题
    NSArray *ary1 = @[@(NSApplicationDirectory), @(NSDemoApplicationDirectory), @(NSDeveloperApplicationDirectory),
                     @(NSAdminApplicationDirectory), @(NSLibraryDirectory), @(NSDeveloperDirectory),
                     @(NSUserDirectory), @(NSDocumentationDirectory), @(NSDocumentDirectory),
                     @(NSCoreServiceDirectory), @(NSAutosavedInformationDirectory), @(NSDesktopDirectory),
                     @(NSCachesDirectory), @(NSApplicationSupportDirectory), @(NSDownloadsDirectory),
                     @(NSInputMethodsDirectory), @(NSMoviesDirectory), @(NSMusicDirectory),
                     @(NSPicturesDirectory), @(NSPrinterDescriptionDirectory), @(NSSharedPublicDirectory),
                     @(NSPreferencePanesDirectory), @(NSItemReplacementDirectory), @(NSAllApplicationsDirectory),
                     @(NSAllLibrariesDirectory)];
    
    NSArray *ary2 = @[@"NSApplicationDirectory", @"NSDemoApplicationDirectory", @"NSDeveloperApplicationDirectory",
                     @"NSAdminApplicationDirectory", @"NSLibraryDirectory", @"NSDeveloperDirectory",
                     @"NSUserDirectory", @"NSDocumentationDirectory", @"NSDocumentDirectory",
                     @"NSCoreServiceDirectory", @"NSAutosavedInformationDirectory", @"NSDesktopDirectory",
                     @"NSCachesDirectory", @"NSApplicationSupportDirectory", @"NSDownloadsDirectory",
                     @"NSInputMethodsDirectory", @"NSMoviesDirectory", @"NSMusicDirectory",
                     @"NSPicturesDirectory", @"NSPrinterDescriptionDirectory", @"NSSharedPublicDirectory",
                     @"NSPreferencePanesDirectory", @"NSItemReplacementDirectory", @"NSAllApplicationsDirectory",
                     @"NSAllLibrariesDirectory"];
    
    NSArray *ary3 = @[@(NSUserDomainMask), @(NSLocalDomainMask), @(NSNetworkDomainMask), @(NSSystemDomainMask), @(NSAllDomainsMask)];
    NSArray *ary4 = @[@"NSUserDomainMask", @"NSLocalDomainMask", @"NSNetworkDomainMask", @"NSSystemDomainMask", @"NSAllDomainsMask"];

    for (NSInteger i = 0; i < ary1.count; i++) {
        NSSearchPathDirectory tmp = [ary1[i] integerValue];
        NSMutableDictionary *allDic = [NSMutableDictionary new];
        NSArray *localArray = nil;
        NSArray *systemArray = nil;
        for (NSInteger j = 0; j < ary3.count; j++) {
            NSSearchPathDomainMask mask = [ary3[j] integerValue];
            NSArray *dirArray = NSSearchPathForDirectoriesInDomains(tmp, mask, YES);
            NSString *key = ary4[j];
            allDic[key] = dirArray;
            if (j == 1) {
                localArray = dirArray;
            } else if (j == 3) {
                systemArray = dirArray;
            } else {
                // Do Nothing
            }
        }
        NSLog(@"----------------------------------------");
        BOOL equal = NO;
        if (localArray.count == systemArray.count) {
            equal = YES;
            for (NSInteger k = 0; k < localArray.count; k++) {
                if (![localArray[k] isEqualToString:systemArray[k]]) {
                    equal = NO;
                    break;
                }
            }
        }
        NSLog(@"%@ local and system is %@", ary2[i], equal ? @"YES": @"NO");
        NSLog(@"allDic:%@", allDic);
        
    }
    
}
@end
