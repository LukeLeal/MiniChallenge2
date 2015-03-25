//
//  DoencaManager.h
//  Challenge 2
//
//  Created by Samuel Shin Kim on 24/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DoencaManager : NSObject

@property NSArray *doencas;
-(NSArray *) nomeDoenca;
+(DoencaManager *) sharedInstance;
@end
