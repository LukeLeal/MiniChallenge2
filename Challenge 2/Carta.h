//
//  Carta.h
//  Challenge 2
//
//  Created by Andre Lucas Ota on 30/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Carta : NSObject

@property NSString *texto;
@property int tag;

-(Carta *)initWithTexto: (NSString *)text andTag: (int)etiqueta;

@end
