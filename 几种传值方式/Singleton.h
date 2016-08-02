//
//  Singleton.h
//  几种传值方式
//
//  Created by sz on 16/7/29.
//  Copyright © 2016年 悠然Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject

@property (nonatomic, copy) NSString *singleTon;

+(instancetype)singleTonShare;

@end
