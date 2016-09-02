//
//  CommonTool.h
//  SafekeyboardTest
//
//  Created by wu xinglin on 16/8/9.
//  Copyright © 2016年 wu xinglin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define splitLineTag    819
/* 应用参数 */
// 应用frame的宽度
#define ZXQAppFrameWidth [UIScreen mainScreen].bounds.size.width
// 应用frame的高度
#define ZXQAppFrameHeight [UIScreen mainScreen].bounds.size.height

// 分割线类型
typedef enum{
    SplitTypeAll,
    SplitTypeTop,
    SplitTypeBottom,
} SplitType;


@interface CommonTool : NSObject

#pragma mark UIColor转UIImage
+ (UIImage *)createImageWithColor:(UIColor *)color;
#pragma mark 为view添加分割线
+ (void)addSplitLineWithView:(UIView *)view splitType:(SplitType)splitType;
+ (void)addSplitLineWithView:(UIView *)view orignX:(CGFloat)orignX orignY:(CGFloat)orignY;
#pragma mark 竖的分割线
+ (void)addVerSplitLineWithView:(UIView *)view orignX:(CGFloat)orignX;


@end
