//
//  AdBannerController.m
//  MH4wiki
//
//  Created by fumiharu on 2013/09/09.
//  Copyright (c) 2013年 FumiharuSugawara. All rights reserved.
//

#import "AdBannerController.h"

@implementation AdBannerController
+(BOOL)is4inch{
    CGSize screenSize = [[self mainScreen]bounds].size;
    return screenSize.width == 320.0 && screenSize.height == 568.0;
}
@end
