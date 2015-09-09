//
//  PerguntaBeta.m
//  Challenge 2
//
//  Created by Lucas Leal Mendonça on 02/04/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

#import "PerguntaBeta.h"

@implementation PerguntaBeta

-(id) init:(NSString *)p withAlternativas: (NSArray *)a{
    self = [super init];
    
    if(self){
        self.pergunta = p;
        self.correto = (NSString *)[a objectAtIndex:0];
        self.alternativas = a;
    }
    return self;
}

@end
