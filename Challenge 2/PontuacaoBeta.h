//
//  PotuacaoBeta.h
//  Challenge 2
//
//  Created by Lucas Leal Mendonça on 02/04/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PontuacaoBeta : NSObject

@property (nonatomic, retain) NSData * foto;
@property (nonatomic, retain) NSString * nome;
@property int pontos;
@property (nonatomic, retain) NSString * categoria;

- (void)setFotoWithUIImage:(UIImage *)newFoto;
- (UIImage *)getFotoAsImage;

@end
