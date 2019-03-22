//
//  MainViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/8.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "MainViewController.h"
// https://github.com/kstenerud/KSCrash
// https://www.jianshu.com/p/34b98060965b


// https://work.bugtags.com/apps/1628618703765828/sdk/integration


// 崩溃类型
// http://blog.sina.com.cn/s/blog_8d1bc23f0102wfkg.html
// https://www.jianshu.com/p/5f663bc97f90




// 重复定义解决办法
// https://blog.csdn.net/feixiang_song/article/details/69224220



@interface MainViewController ()


@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *functionItems;




@end

@implementation MainViewController


#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    self.view.backgroundColor = [UIColor redColor];
    
    
    
    self.functionItems = @[@"BugTags", @"KSCrash"];
    
    // 数组倒叙
    self.functionItems = [[self.functionItems reverseObjectEnumerator] allObjects];

    NSString *object = self.functionItems.firstObject;
    
#if 1
//    object = @"RVMsgForward";
//    object = @"RVGCD2";
//    object = @"RVWeb";
//    object = @"RXSY";
    
//    object = @"RXAFNetworking";
//    object = @"RVGCD2";
//    object = @"RXLayout";
//    object = @"RXJLRouter";
//    object = @"RXAnimation";
//    object = @"RXShellHome";
#endif
    
    [self performSelector:@selector(gotoExampleVCWithName:) withObject:object afterDelay:1];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



/*
 
 
 
 #pragma mark - View Life Cycle
 
 
 - (void)viewDidLoad {
 [super viewDidLoad];
 // Do any additional setup after loading the view from its nib.
 
 [self initializeUIAndData];
 [self initializeAction];
 }
 
 
 #pragma mark - initialize UI And Data
 - (void)initializeUIAndData
 {
 
 self.view.backgroundColor = [UIColor redColor];
 }
 - (void)initializeAction
 {
 
 }
 
 

 
 
 */

@end
