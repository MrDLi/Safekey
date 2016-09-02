//
//  ZXQSafeKeyboard.m
//  ZXQ
//
//  Created by shaoxiaofeng on 16/8/4.
//  Copyright © 2016年 YangHai. All rights reserved.
//

#import "ZXQSafeKeyboard.h"
#import "UIColor+Hex.h"
#import "CommonTool.h"

@implementation ZXQSafeKeyboard

- (instancetype)init{
    self = [super init];
    if(self){
        _text = @"";
        _lengthLimit = 6;
        
        NSArray *randomArray = [self randomArray];
        
        self.frame = CGRectMake(0, ZXQAppFrameHeight, ZXQAppFrameWidth, ZXQSafeKeyboardHeight);
        
        UIView *buttonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        buttonView.backgroundColor = [UIColor whiteColor];
        [self addSubview:buttonView];
        
        // 数字按钮
        NSInteger i = 0;
        for (NSString *num in randomArray) {
            
            UIButton *numBt = [UIButton buttonWithType:UIButtonTypeCustom];
            if(i == randomArray.count - 1){
                numBt.frame = CGRectMake((ZXQAppFrameWidth/3), (i/3)*(buttonView.frame.size.height/4), ZXQAppFrameWidth/3, buttonView.frame.size.height/4);
            }else{
                numBt.frame = CGRectMake((i%3)*(ZXQAppFrameWidth/3), (i/3)*(buttonView.frame.size.height/4), ZXQAppFrameWidth/3, buttonView.frame.size.height/4);
            }
            
            numBt.tag = num.integerValue;
            [numBt setTitle:num forState:UIControlStateNormal];
            [numBt setTitleColor:[UIColor colorWithHexString:@"0x333333"] forState:UIControlStateNormal];
            [numBt addTarget:self action:@selector(numBtAction:) forControlEvents:UIControlEventTouchUpInside];
            [buttonView addSubview:numBt];
            
            i++;
        }
        
        // 回退按钮
        UIButton *backBt = [UIButton buttonWithType:UIButtonTypeCustom];
        backBt.frame = CGRectMake((ZXQAppFrameWidth/1.5), buttonView.frame.size.height/4*3, ZXQAppFrameWidth/3, buttonView.frame.size.height/4);
        [backBt setBackgroundImage:[CommonTool createImageWithColor:[UIColor colorWithHexString:@"0xf9f9f9"]] forState:UIControlStateNormal];
        [backBt setBackgroundImage:[CommonTool createImageWithColor:[UIColor whiteColor]] forState:UIControlStateHighlighted];
        [backBt addTarget:self action:@selector(backBtAction:) forControlEvents:UIControlEventTouchUpInside];
        [buttonView addSubview:backBt];
        
        // 左下置灰处
        UIView *grayView = [[UIView alloc] initWithFrame:CGRectMake(0, buttonView.frame.size.height/4*3, ZXQAppFrameWidth/3, buttonView.frame.size.height/4)];
        grayView.backgroundColor = [UIColor colorWithHexString:@"0xf9f9f9"];
        [buttonView addSubview:grayView];
        
        // 添加分割线
        [CommonTool addSplitLineWithView:buttonView orignX:0 orignY:buttonView.frame.size.height/4];
        [CommonTool addSplitLineWithView:buttonView orignX:0 orignY:buttonView.frame.size.height/2];
        [CommonTool addSplitLineWithView:buttonView orignX:0 orignY:buttonView.frame.size.height/4*3];
        [CommonTool addVerSplitLineWithView:buttonView orignX:ZXQAppFrameWidth/3];
        [CommonTool addVerSplitLineWithView:buttonView orignX:ZXQAppFrameWidth/1.5];
    }
    
    return self;
}

- (NSArray *)randomArray
{
    //随机数从这里边产生
    NSMutableArray *startArray = [NSMutableArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
    //随机数产生结果
    NSMutableArray *resultArray = [NSMutableArray array];
    
    //随机数个数
    for (int i=0; i<10; i++) {
        int t = arc4random()%startArray.count;
        resultArray[i] = startArray[t];
        startArray[t] = [startArray lastObject];
        [startArray removeLastObject];
    }
    return resultArray;
}

#pragma mark - 数字按钮触发事件
- (void)numBtAction:(UIButton *)sender{
    if(_text.length >= _lengthLimit){
        return;
    }
    
    NSString *inputStr = [NSString stringWithFormat:@"%ld",(long)sender.tag];
    _text = [_text stringByAppendingString:inputStr];
    
    if([_delegate respondsToSelector:@selector(ZXQSafeKeyboardDidChange:)]){
        [_delegate ZXQSafeKeyboardDidChange:_text];
    }
    
    if([_delegate respondsToSelector:@selector(ZXQSafeKeyboardInputString:)]){
        [_delegate ZXQSafeKeyboardInputString:inputStr];
    }
    
    NSLog(@"text=%@",_text);
}

#pragma mark 回退按钮触发事件
- (void)backBtAction:(UIButton *)sender{
    if(_text.length > 0){
       _text = [_text substringToIndex:_text.length - 1];
    }
    
    if([_delegate respondsToSelector:@selector(ZXQSafeKeyboardDidChange:)]){
        [_delegate ZXQSafeKeyboardDidChange:_text];
    }
    
    NSLog(@"text=%@",_text);
}

#pragma mark - 显示
- (void)show{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = CGRectMake(0, ZXQAppFrameHeight - ZXQSafeKeyboardHeight, ZXQAppFrameWidth, ZXQSafeKeyboardHeight);
    }];
}

#pragma mark 关闭
- (void)dismiss{
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = CGRectMake(0, ZXQAppFrameHeight, ZXQAppFrameWidth, ZXQSafeKeyboardHeight);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark 清除
- (void)clear{
    _text = @"";
}

@end
