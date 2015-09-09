//
//  DeviceModel.h
//  HealthCoach
//
//  Created by Andre Lucas Ota on 08/09/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <sys/utsname.h>

@interface DeviceModel : NSObject

@property NSString *model;

+(DeviceModel *)instance;
-(instancetype)init;
- (float)getHomeViewAnimationLabelAmmount;
- (float)getHomeViewAnimationLogoAmmount;
- (float)getQuizViewClockSize;
- (float)getQuizViewTimerSize;

@end
