//
//  CommonTool.m
//  SafekeyboardTest
//
//  Created by wu xinglin on 16/8/9.
//  Copyright © 2016年 wu xinglin. All rights reserved.
//

#import "CommonTool.h"
#import "UIColor+Hex.h"

@implementation CommonTool

#pragma mark UIColor转UIImage
+ (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

+ (void)addSplitLineWithView:(UIView *)view orignX:(CGFloat)orignX orignY:(CGFloat)orignY{
    CGFloat lineHeight = 0.7;
    
    UIView *splitLine = [[UIView alloc] initWithFrame:CGRectMake(orignX, orignY, ZXQAppFrameWidth - orignX, lineHeight)];
    splitLine.backgroundColor = [UIColor colorWithHexString:@"0xd6dbec"];
    splitLine.tag = splitLineTag;
    [view addSubview:splitLine];
}

#pragma mark 竖的分割线
+ (void)addVerSplitLineWithView:(UIView *)view orignX:(CGFloat)orignX{
    CGFloat lineWidth = 0.7;
    
    UIView *splitLine = [[UIView alloc] initWithFrame:CGRectMake(orignX, 0, lineWidth, view.frame.size.height)];
    splitLine.backgroundColor = [UIColor colorWithHexString:@"0xd6dbec"];
    [view addSubview:splitLine];
}




@end
