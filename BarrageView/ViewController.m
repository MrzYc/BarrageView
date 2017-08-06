//
//  ViewController.m
//  BarrageView
//
//  Created by 赵永闯 on 2017/8/6.
//  Copyright © 2017年 zhaoyongchuang. All rights reserved.
//

#import "ViewController.h"
#import "ZYCDanmuView.h"
#import "ZYCDanmuBackView.h"
#import "ZYCDanmuModel.h"

@interface ViewController () <ZYCDanmuBackViewDelegate>

@property (nonatomic, weak) ZYCDanmuBackView *backView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setTitle:@"暂停" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button1.frame = CGRectMake(20, 500, 40, 20);
    [button1 addTarget:self action:@selector(pause:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setTitle:@"继续" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(resume:) forControlEvents:UIControlEventTouchDown];

    button2.frame = CGRectMake(200, 500, 40, 20);
    [self.view addSubview:button2];
}


- (ZYCDanmuBackView *)backView {
    if (!_backView) {
        ZYCDanmuBackView *backView = [[ZYCDanmuBackView alloc] initWithFrame:CGRectMake(10, 20, 300, 300)];
        backView.backgroundColor = [UIColor brownColor];
        backView.delegate = self;
        [self.view addSubview:backView];
        _backView = backView;
    }
    
    
    return _backView;
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    ZYCDanmuModel *dM = [[ZYCDanmuModel alloc] init];
    dM.attributeContent = [[NSMutableAttributedString alloc] initWithString:@"hahaha"];
    dM.beginTime = 1;
    dM.liveTime = 6;
    
    
    ZYCDanmuModel *dM2 = [[ZYCDanmuModel alloc] init];
    dM2.attributeContent = [[NSMutableAttributedString alloc] initWithString:@"h1414324132414324214ehe"];
    dM2.beginTime = 1;
    dM2.liveTime = 4;
    
    [self.backView.danmuMs addObjectsFromArray:@[dM, dM2]];    
}

- (void)pause:(id)sender {
    [self.backView pause];
}

- (void)resume:(id)sender {
    [self.backView resume];
}




/**
 当前时间
 */
- (NSTimeInterval)currentTime
{
    static NSTimeInterval ct = 0;
    ct += 1;
    return ct;
}


- (UIView *)danmuViewWithModel: (id<ZYCDanmuModelDelegate>)model {
    
    //    UILabel *label = [[UILabel alloc] init];
    ZYCDanmuView *danmuView = [ZYCDanmuView danmuViewWithDanmuM:model];
    return danmuView;
}

- (void)danmuBackViewDidSelectDanmu:(UIView *)danmuView atPoint:(CGPoint)point
{    
    NSLog(@"选中了弹幕...在%@点", NSStringFromCGPoint(point));
    if ([danmuView isKindOfClass:[ZYCDanmuView class]]) {
        [(ZYCDanmuView *)danmuView showStars:point];
    }
}


@end
