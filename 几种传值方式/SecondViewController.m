//
//  SecondViewController.m
//  几种传值方式
//
//  Created by sz on 16/7/29.
//  Copyright © 2016年 悠然Mac. All rights reserved.
//

#import "SecondViewController.h"
#import "Singleton.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
{
    id _target;//执行者
    SEL _action;//方法
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    //单例
    self.singleton.text = [Singleton singleTonShare].singleTon;
    
    NSString *noticeStr = @"这是通知传值";
    
    //发布通知
    [[NSNotificationCenter defaultCenter]postNotificationName:@"noticeValue" object:nil userInfo:@{@"notification":noticeStr}];
    
    
    
}

//targetAction
-(void)addTarget:(id)target action:(nonnull SEL)action
{
    //记录传入的执行者和执行方法
    _target = target;
    _action = action;
}

//属性传值
-(void)setArttributeStr:(NSString *)arttributeStr
{
    self.attribute.text = arttributeStr;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    NSString *targetStr = @"这是targetAction方法";
    //让执行者执行方法
    [_target performSelector:_action withObject:targetStr];
}




- (IBAction)delegateBt:(UIButton *)sender {
    
    NSString *delegateStr = @"这是代理传值";
    [_delegate secondDelegateValue:delegateStr];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)blockBt:(UIButton *)sender {
    
    NSString *blockStr = @"这是block传值";
    _blockValues(blockStr);

    [self.navigationController popViewControllerAnimated:YES];
}














- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
