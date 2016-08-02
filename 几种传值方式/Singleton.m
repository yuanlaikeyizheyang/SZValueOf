//
//  Singleton.m
//  几种传值方式
//
//  Created by sz on 16/7/29.
//  Copyright © 2016年 悠然Mac. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

Singleton *singleton = nil;
+(instancetype)singleTonShare
{
    //为了保证单例初始化一次和安全
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[Singleton alloc] init];
    });
    return singleton;
}

@end
