//
//  ZYCDanmuModel.h
//  BarrageView
//
//  Created by 赵永闯 on 2017/8/6.
//  Copyright © 2017年 zhaoyongchuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZYCDanmuModelProtocol.h"

@interface ZYCDanmuModel : NSObject  <ZYCDanmuModelDelegate>

/** 弹幕内容, 可展示富文本 */
@property (nonatomic, strong) NSMutableAttributedString *attributeContent;

/** 开始时间 */
@property (nonatomic, assign) NSTimeInterval beginTime;

/** 存活时间 */
@property (nonatomic, assign) NSTimeInterval liveTime;


@end
