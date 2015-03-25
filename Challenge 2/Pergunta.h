//
//  Pergunta.h
//  Challenge 2
//
//  Created by Lucas Leal Mendonça on 25/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pergunta : NSObject

@property NSString *pergunta;
@property NSString *correto;
@property NSMutableArray *alternativas;

//-(id) init:(NSString *)p withCorreto: (NSString *)c withAlternativas: (NSArray *)a;
-(id) init:(NSString *)p withAlternativas: (NSArray *)a;

@end
