//
//  CALayer+Animate.h
//  BarrageView
//
//  Created by 赵永闯 on 2017/8/6.
//  Copyright © 2017年 zhaoyongchuang. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (Animate)


// 暂停动画
- (void)pauseAnimate;

// 恢复动画
- (void)resumeAnimate;

@end
