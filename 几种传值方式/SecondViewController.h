//
//  SecondViewController.h
//  几种传值方式
//
//  Created by sz on 16/7/29.
//  Copyright © 2016年 悠然Mac. All rights reserved.
//

#import <UIKit/UIKit.h>



//block
typedef void(^BlockValues)(NSString *);

@protocol SecondViewControllerDelegate <NSObject>

//代理的方法 可以设置必须实现和选择实现
//@optional  使用这个修饰 是一定要实现的
-(void)secondDelegateValue:(NSString *)string;

@end

@interface SecondViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *showLabel;
@property (weak, nonatomic) IBOutlet UILabel *singleton;
@property (weak, nonatomic) IBOutlet UILabel *attribute;
//属性传值这样写吧
@property (nonatomic, copy) NSString *arttributeStr;


//代理的属性  这里使用weak 修饰 是为了防止循环引用
@property (nonatomic, weak) id<SecondViewControllerDelegate> delegate;

//声明block
@property (nonatomic, copy) BlockValues blockValues;


//targetAction 声明方法和执行者
-(void)addTarget:(id)target action:(nonnull SEL)action;

@end
