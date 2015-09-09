//
//  Alternativa.h
//  Challenge 2
//
//  Created by Lucas Leal Mendonça on 02/04/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Pergunta;

@interface Alternativa : NSManagedObject

@property (nonatomic, retain) NSString * texto;
@property (nonatomic, retain) Pergunta *pergunta;

@end
