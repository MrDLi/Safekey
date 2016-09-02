//
//  ZXQSafeKeyboard.h
//  ZXQ
//
//  Created by shaoxiaofeng on 16/8/4.
//  Copyright © 2016年 YangHai. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ZXQSafeKeyboardHeight   212
/* 应用参数 */
// 应用frame的宽度
#define ZXQAppFrameWidth [UIScreen mainScreen].bounds.size.width
// 应用frame的高度
#define ZXQAppFrameHeight [UIScreen mainScreen].bounds.size.height


@protocol ZXQSafeKeyboardDelegate <NSObject>

@optional
-(void)ZXQSafeKeyboardDidChange:(NSString *)text;
-(void)ZXQSafeKeyboardInputString:(NSString *)str;
@end

@interface ZXQSafeKeyboard : UIView

@property (nonatomic, strong) NSString *text;
@property (nonatomic, assign) NSInteger lengthLimit;
@property (nonatomic, assign) id <ZXQSafeKeyboardDelegate> delegate;

- (void)show;
- (void)dismiss;
- (void)clear;

@end
