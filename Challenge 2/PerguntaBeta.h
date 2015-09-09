//
//  PerguntaBeta.h
//  Challenge 2
//
//  Created by Lucas Leal Mendonça on 02/04/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PerguntaBeta : NSObject

@property (nonatomic, retain) NSString * pergunta;
@property (nonatomic, retain) NSString * correto;
@property (nonatomic, retain) NSArray *alternativas;

-(id) init:(NSString *)p withAlternativas: (NSArray *)a;
@end
