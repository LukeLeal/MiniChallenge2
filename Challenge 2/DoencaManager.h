//
//  DoencaManager.h
//  Challenge 2
//
//  Created by Samuel Shin Kim on 24/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Doenca.h"
#import "DataManager.h"
#import "Sintoma.h"

@interface DoencaManager : NSObject

@property NSMutableArray *doencas;
@property int doencaAtual;

-(NSArray *) nomeDoenca;
+(DoencaManager *) sharedInstance;
@end
