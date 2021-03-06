//
//  ZYCDanmuView.m
//  BarrageView
//
//  Created by 赵永闯 on 2017/8/6.
//  Copyright © 2017年 zhaoyongchuang. All rights reserved.
//

#import "ZYCDanmuView.h"
#import "CALayer+Animate.h"
#import "DMHeartFlyView.h"



static NSMutableArray *danDaos;


@interface ZYCDanmuView ()

@property (strong, nonatomic) IBOutlet UIImageView *userIcon;

@property (strong, nonatomic) IBOutlet UIButton *contentBtn;


@end

@implementation ZYCDanmuView

+ (instancetype)danmuViewWithDanmuM:(id<ZYCDanmuModelDelegate>)danmuM {
    ZYCDanmuView *danmuView = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"ZYCDanmuView" owner:nil options:nil] firstObject];
    
    [danmuView.contentBtn setAttributedTitle:danmuM.attributeContent forState:UIControlStateNormal]
    ;
    
    CGSize size = [danmuM.attributeContent.string sizeWithAttributes:@{
                                                                       NSFontAttributeName: [danmuView.contentBtn.titleLabel font]
                                                                       }];
    
    danmuView.bounds = CGRectMake(0, 0, 80 + size.width, danmuView.bounds.size.height);
    danmuView.danmuM = danmuM;
    
    return danmuView;
}

-(void)didMoveToSuperview {
    [super didMoveToSuperview];
}

- (void)showStars:(CGPoint)point {
    
    CGFloat _heartSize = 36;
    DMHeartFlyView *heart = [[DMHeartFlyView alloc] initWithFrame:CGRectMake(0, 0, _heartSize, _heartSize)];
    [self.superview addSubview:heart];
    heart.center = point;
    [heart animateInView:self.superview];
}

-(void)dealloc {
    NSLog(@"释放");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)danmuStateChange:(NSNotification *)notification {
    if ([notification.object  isEqual: @(YES)]) {
        [self.layer resumeAnimate];
    }else {
        [self.layer pauseAnimate];
    }
}

-(void)awakeFromNib {
    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
    UIImage *backImg = [self.contentBtn backgroundImageForState:UIControlStateNormal];
    UIImage *resultImage = [backImg resizableImageWithCapInsets:UIEdgeInsetsMake(10, 20, 10, 10) resizingMode:UIImageResizingModeTile];
    [self.contentBtn setBackgroundImage:resultImage forState:UIControlStateNormal];
}


@end
