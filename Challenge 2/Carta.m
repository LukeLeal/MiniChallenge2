//
//  Carta.m
//  Challenge 2
//
//  Created by Andre Lucas Ota on 30/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "Carta.h"

@implementation Carta

@synthesize texto, tag;

-(Carta *)initWithTexto: (NSString *)text andTag: (int)etiqueta{
    
    self = [super init];
    if (self){
        texto = text;
        tag = etiqueta;
    }
    
    return self;
}

@end
