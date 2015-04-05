//
//  Pergunta.m
//  Challenge 2
//
//  Created by Lucas Leal Mendonça on 25/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "Pergunta.h"


@implementation Pergunta

@dynamic pergunta;
@dynamic correto;
@dynamic alternativas;


//-(id) init:(NSString *)p withAlternativas: (NSArray *)a{
//    self = [super init];
//    
//    if(self){
//        self.pergunta = p;
//        self.correto = (NSString *)[a objectAtIndex:0];
//        self.alternativas = [NSSet setWithArray:a];
//    }
//    
//    return self;
//}

-(NSMutableArray *) getAlternativasMA{
    return [NSMutableArray arrayWithArray: [self.alternativas allObjects]];
}

@end
