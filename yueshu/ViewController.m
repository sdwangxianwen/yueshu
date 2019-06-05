//
//  ViewController.m
//  yueshu
//
//  Created by wang on 2019/6/5.
//  Copyright © 2019 wang. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>

@interface ViewController ()
@property (nonatomic, strong)UIView *view1;
@property (nonatomic, strong)UIView *view2;
@property (nonatomic, strong)UIView *view3;
@property (nonatomic, strong)UIView *view4;
@property (nonatomic, strong)UILabel *label1;
@property (nonatomic, strong)UILabel *label2;
@property (nonatomic, strong)UILabel *label3;
@property (nonatomic, strong)UILabel *label4;
@property (nonatomic, strong) NSString *string;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    self.string = @"";
    
}
-(void)setupUI {
    
    _view1 = [[UIView alloc] init];
    [self.view addSubview:_view1];
    _view1.backgroundColor = [UIColor blueColor];
    
    _view2 = [[UIView alloc] init];
    [self.view addSubview:_view2];
    _view2.backgroundColor = [UIColor brownColor];
    
    _view3 = [[UIView alloc] init];
    [self.view addSubview:_view3];
    _view3.backgroundColor = [UIColor blackColor];
    
    _view4 = [[UIView alloc] init];
    [self.view addSubview:_view4];
    _view4.backgroundColor = [UIColor brownColor];
    
    _label1 = [[UILabel alloc] init];
    _label1.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:_label1];
    _label1.text = @"固定不动";
    
    _label2 = [[UILabel alloc] init];
    _label2.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:_label2];
    _label2.text = @"可移动";
    
    _label3 = [[UILabel alloc] init];
    _label3.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:_label3];
    _label3.text = @"可移动";

    
    _label4 = [[UILabel alloc] init];
    _label4.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:_label4];
    _label4.text = @"固定不动";
    
    [_view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(64);
        make.left.offset(30);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    [_view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(64);
        make.left.equalTo(self.view1.mas_right).offset(30);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    [_view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(64);
        make.left.equalTo(self.view2.mas_right).offset(30).priorityHigh();
        make.left.equalTo(self.view1.mas_right).offset(30).priorityLow();
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.offset(200);
    }];
    
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15).priorityHigh();
        make.top.offset(200);
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.label1.mas_right).offset(15);
        make.top.offset(200);
    }];
    //如果这个很长并且影响了其他控件,需要对其进行可压缩处理
    [_label2 setContentCompressionResistancePriority:UILayoutPriorityFittingSizeLevel forAxis:UILayoutConstraintAxisHorizontal];

    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.label2.mas_right).offset(15).priorityHigh();
        make.top.offset(200);
        make.right.equalTo(self.label4.mas_left).offset(-15).priorityLow();
    }];
    
    
}
- (IBAction)remove:(id)sender {
    [self.view2 removeFromSuperview];
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
    
}
- (IBAction)add:(id)sender {
    [self.view addSubview:_view2];
    [_view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(64);
        make.left.equalTo(self.view1.mas_right).offset(30);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    [_view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(64);
        make.left.equalTo(self.view2.mas_right).offset(30).priorityHigh();
        make.left.equalTo(self.view1.mas_right).offset(30).priorityLow();
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}
- (IBAction)zengjia:(id)sender {
    self.string = [NSString stringWithFormat:@"可移动%@",self.string];
    self.label2.text = self.string;
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}
- (IBAction)huifu:(id)sender {
    self.string = @"";
    self.label2.text = @"可移动";
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15).priorityHigh();
        make.top.offset(200);
    }];
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end
