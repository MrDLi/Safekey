//
//  ViewController.m
//  SafekeyboardTest
//
//  Created by wu xinglin on 16/9/2.
//  Copyright © 2016年 wu xinglin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong)ZXQSafeKeyboard *safeKeyboard;
@property (nonatomic, strong)UILabel *textLabel;
@property (nonatomic, strong)UIButton *keyboardButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    
    
    [self initTextlabel];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark 初始化输入框
- (void)initTextlabel
{
    _textLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 200, 50)];
    _textLabel.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_textLabel];
    
    _keyboardButton = [[UIButton alloc] initWithFrame:CGRectMake(_textLabel.frame.origin.x, _textLabel.frame.origin.y + _textLabel.frame.size.height + 20, 20, 20)];
    _keyboardButton.backgroundColor = [UIColor greenColor];
    [_keyboardButton addTarget:self action:@selector(initKeyboard) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_keyboardButton];
    
}

#pragma mark  初始化键盘
- (void)initKeyboard
{
    if (_safeKeyboard) {
        [_safeKeyboard dismiss];
    }
    _safeKeyboard = [[ZXQSafeKeyboard alloc] init];
    _safeKeyboard.delegate = self;
    [_safeKeyboard show];
}

#pragma mark 键盘消失
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_safeKeyboard dismiss];
}


#pragma mark ZXQSafeDelegate
-(void)ZXQSafeKeyboardDidChange:(NSString *)text
{
    NSLog(@"每次change时回回调，text参数为当前存在的字符串");
    _textLabel.text = text;
}
-(void)ZXQSafeKeyboardInputString:(NSString *)str
{
    NSLog(@"每次输入时回调，str参数为输入的值");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
