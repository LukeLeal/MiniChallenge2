//
//  Pergunta.m
//  Challenge 2
//
//  Created by Lucas Leal Mendonça on 25/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "Pergunta.h"

@implementation Pergunta

//-(id) init:(NSString *)p withCorreto: (NSString *)c withAlternativas: (NSArray *)a{
-(id) init:(NSString *)p withAlternativas: (NSArray *)a{
    self = [super init];
    
    if(self){
        _pergunta = p;
        _correto = (NSString *)[a objectAtIndex:0];
        _alternativas = [[NSMutableArray alloc] initWithArray: a];
    }
    
    return self;
}

@end
