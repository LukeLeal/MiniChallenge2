//
//  Carta.m
//  Challenge 2
//
//  Created by Andre Lucas Ota on 30/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "Carta.h"

@implementation Carta

@synthesize texto, cor, tag;

-(Carta *)initWithTexto: (NSString *)text andCor: (UIColor *)color andTag: (NSInteger *)etiqueta{
    
    self = [super init];
    if (self){
        texto = text;
        cor = color;
        tag = etiqueta;
    }
    
    return self;
}

@end
