//
//  ViewController.h
//  几种传值方式
//
//  Created by sz on 16/7/29.
//  Copyright © 2016年 悠然Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *show;

@property (weak, nonatomic) IBOutlet UILabel *delegateShow;
@property (weak, nonatomic) IBOutlet UILabel *blockShow;
@property (weak, nonatomic) IBOutlet UILabel *noticeShow;
@property (weak, nonatomic) IBOutlet UILabel *attributeShow;
@property (weak, nonatomic) IBOutlet UILabel *targetAction;
@property (weak, nonatomic) IBOutlet UILabel *singleton;






@end

