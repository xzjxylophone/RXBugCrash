//
//  RXCrashTestViewController.m
//  RXBugCrashDemo
//
//  Created by Rush.D.Xzj on 2019/3/22.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXCrashTestViewController.h"

@interface RXCrashTestViewController ()

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *functionItems;

@end

@implementation RXCrashTestViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.functionItems = @[@"BugTags", @"KSCrash"];
        
    NSString *object = self.functionItems.firstObject;
   
    
    [self performSelector:@selector(gotoExampleVCWithName:) withObject:object afterDelay:1];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.functionItems.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identify = @"abc123";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    cell.textLabel.text = self.functionItems[indexPath.row];
    return cell;
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *tmp = self.functionItems[indexPath.row];
    [self gotoExampleVCWithName:tmp];
}

#pragma mark - Private
- (void)gotoExampleVCWithName:(NSString *)name
{
}


#pragma mark - Crash Test
// Attempted to dereference garbage pointer 0x4b70706d.


@end
