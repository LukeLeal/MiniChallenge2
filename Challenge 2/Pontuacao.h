//
//  Pontuacao.h
//  Challenge 2
//
//  Created by Samuel Shin Kim on 23/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>

@interface Pontuacao : NSManagedObject

@property (nonatomic, retain) NSData * foto;
@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSNumber * pontos;
@property (nonatomic, retain) NSString * categoria;

-(NSComparisonResult) compare: (Pontuacao *) outro;


//- (instancetype)initWithNome:(NSString *)newNome andFoto:(UIImage *)newFoto andPontos:(int)newPontos andCategoria:(NSString *)newCategoria;
- (void)setFotoWithUIImage:(UIImage *)newFoto;
- (UIImage *)getFotoAsImage;

@end
