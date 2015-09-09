//
//  DeviceModel.m
//  HealthCoach
//
//  Created by Andre Lucas Ota on 08/09/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "DeviceModel.h"

@implementation DeviceModel

NSString* deviceName(){
    struct utsname systemInfo;
    uname(&systemInfo);
    
    return [NSString stringWithCString:systemInfo.machine
                              encoding:NSUTF8StringEncoding];
}


@synthesize model;

-(instancetype)init{
    self = [super init];
    
    model = deviceName();
    
    return self;
}

+(DeviceModel *)instance{
    static DeviceModel *deviceModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        deviceModel = [[self alloc]init];
    });
    return deviceModel;
}

#pragma mark - HomeViewController
- (float)getHomeViewAnimationLogoAmmount{
    float ammount = 0;
    
    if ([model isEqualToString:@"iPhone4,1"]){
        ammount = 40;
    }
    else{
        if([model isEqualToString:@"iPhone5,1"] || [model isEqualToString:@"iPhone5,2"]){
            ammount = 70;
        }
    else{
        if([model isEqualToString:@"iPhone7,2"]){
            ammount = 80;
        }
    }
    }
    
    return ammount;
}

- (float)getHomeViewAnimationLabelAmmount{
    float ammount = 0;
    
    if ([model isEqualToString:@"iPhone4,1"]){
        ammount = -90;
    }
    else{
        if([model isEqualToString:@"iPhone7,2"]){
            ammount = -180;
        }
    }
    
    return ammount;
}

-(float)getQuizViewClockSize{
    float ammount = 0;
    
    if ([model isEqualToString:@"iPhone4,1"]){
        ammount = 40;
    }
    else{
        if([model isEqualToString:@"iPhone7,2"]){
            ammount = 100;
        }
    }
    
    return ammount;
}

-(float)getQuizViewTimerSize{
    float ammount = 0;
    
    if ([model isEqualToString:@"iPhone4,1"]){
        ammount = -90;
    }
    else{
        if([model isEqualToString:@"iPhone7,2"]){
            ammount = -180;
        }
    }
    
    return ammount;
}

@end
