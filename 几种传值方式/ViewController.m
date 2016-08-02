//
//  ViewController.m
//  几种传值方式
//
//  Created by sz on 16/7/29.
//  Copyright © 2016年 悠然Mac. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "Singleton.h"

typedef enum :NSUInteger{

    DelegateValue = 0,
    BlockValue  ,
    NoticeValue ,       //通知
    Attribute   ,       //属性
    TargetAction,
    SingletonValue,     //单例
    
}ValueOfType;


@interface ViewController ()<SecondViewControllerDelegate>

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //发布通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noticeGetValue:) name:@"noticeValue" object:nil];
}



-(void)noticeGetValue:(NSNotification *)notificarion
{
    self.noticeShow.text = [notificarion valueForKey:@"userInfo"][@"notification"];
}


- (IBAction)pushValue:(UIButton *)sender {
    
    UIButton *button = sender;
    
    ValueOfType valueOfType = button.tag;
    
    switch (valueOfType) {
        case DelegateValue:
            [self delegatePushValue];
            break;
        case BlockValue:
            [self blockPushValue];
            break;
        case NoticeValue:
            [self noticePushValue];
            break;
        case Attribute:
            [self attributePushValue];
            break;
        case TargetAction:
            [self targetActionPushValue];
            break;
        case SingletonValue:
            [self singletonPushValue];
            break;
            
        default:
            break;
    }
    
}

//代理
-(void)delegatePushValue
{
    SecondViewController *secondVc = [SecondViewController new];
    [self.navigationController pushViewController:secondVc animated:YES];
    
    //遵循代理  并去实现代理的方法
    secondVc.delegate = self;
}

//block
-(void)blockPushValue
{
    SecondViewController *secondVc = [SecondViewController new];
    
    __block ViewController *mySelf = self;
    secondVc.blockValues = ^(NSString *blockValue){
        
        mySelf.blockShow.text = blockValue;
        
    };
    
    
    [self.navigationController pushViewController:secondVc animated:YES];
}

//通知
-(void)noticePushValue
{
    
    SecondViewController *secondVc = [SecondViewController new];
    [self.navigationController pushViewController:secondVc animated:YES];
}

//属性
-(void)attributePushValue
{
    //这是我们最最常用的也是最最简单的一个传值方法
    SecondViewController *secondVc = [SecondViewController new];
    secondVc.view.backgroundColor = [UIColor lightGrayColor];
    secondVc.arttributeStr = @"这是属性传值";
    [self.navigationController pushViewController:secondVc animated:YES];
}

//targetAction
-(void)targetActionPushValue
{
    SecondViewController *secondVc = [SecondViewController new];
    
    [secondVc addTarget:self action:@selector(passValue:)];
    
    [self.navigationController pushViewController:secondVc animated:YES];
}

//单例
-(void)singletonPushValue
{
    SecondViewController *secondVc = [SecondViewController new];
    [self.navigationController pushViewController:secondVc animated:YES];
    [Singleton singleTonShare].singleTon = @"这是单例传值";
}



#pragma mark - - 实现代理的方法
-(void)secondDelegateValue:(NSString *)string
{
    self.delegateShow.text = string;
}

-(void)passValue:(NSString *)text
{
    self.targetAction.text = text;
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
