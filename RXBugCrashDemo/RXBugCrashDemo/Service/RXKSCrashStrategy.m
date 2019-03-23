//
//  RXKSCrashStrategy.m
//  RXBugCrashDemo
//
//  Created by Rush.D.Xzj on 2019/3/22.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXKSCrashStrategy.h"
#import "KSCrashInstallation.h"
#import "KSCrashInstallationEmail.h"
#import "KSCrashInstallation+Alert.h"
#import "KSCrash.h"
@implementation RXKSCrashStrategy
+ (KSCrashInstallation *) makeEmailInstallation
{
    //开发者邮件地址
    NSString* emailAddress = @"xzjxylophone@126.com";
    KSCrashInstallationEmail* email = [KSCrashInstallationEmail sharedInstance];
    email.recipients = @[emailAddress];
    email.subject = @"Crash Report";
    email.message = @"This is a crash report";
    email.filenameFmt = @"crash-report-%d.txt.gz";
    [email addConditionalAlertWithTitle:@"Crash Detected"
                                message:@"The app crashed last time it was launched. Send a crash report?" yesAnswer:@"Sure!" noAnswer:@"No thanks"];
    // 如下代码是设置发送StyleApple 如果不加的话，会以jason的格式传给开发者。
    [email setReportStyle:KSCrashEmailReportStyleApple useDefaultFilenameFormat:YES];
    return email;
}

+ (void)setup_js {
    KSCrashInstallation* installation = [self makeEmailInstallation];
    
    // 安装异常处理者，越早安装越好
    // 如下将自动记录崩溃信息，但是它不会自动发送报告
    [installation install];
    // 此方法是确认崩溃报告发送后，如何处理旧的崩溃。
    [KSCrash sharedInstance].deleteBehaviorAfterSendAll = KSCDeleteNever;
    // 发送崩溃日志
    [installation sendAllReportsWithCompletion:^(NSArray* reports, BOOL completed, NSError* error) {
        if(completed) {
            NSLog(@"Sent %d reports", (int)[reports count]);
        } else {
            NSLog(@"Failed to send reports: %@", error);
        }
    }];
}
+ (void)setup_github {
    KSCrashInstallationEmail* installation = [KSCrashInstallationEmail sharedInstance];
    installation.recipients = @[@"xzjxylophone@126.com"];
    [installation install];
    [KSCrash sharedInstance].deleteBehaviorAfterSendAll = KSCDeleteNever;
    [installation sendAllReportsWithCompletion:^(NSArray* reports, BOOL completed, NSError* error) {
        if(completed) {
            NSLog(@"Sent %d reports", (int)[reports count]);
        } else {
            NSLog(@"Failed to send reports: %@", error);
        }
    }];
}
+ (void)setup {
    [self setup_github];
}
@end
