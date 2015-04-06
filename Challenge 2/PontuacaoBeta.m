//
//  PotuacaoBeta.m
//  Challenge 2
//
//  Created by Lucas Leal Mendonça on 02/04/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

#import "PontuacaoBeta.h"

@implementation PontuacaoBeta

- (void)setFotoWithUIImage:(UIImage *)newFoto {
    self.foto = UIImagePNGRepresentation(newFoto);
}

- (UIImage *)getFotoAsImage {
    return [UIImage imageWithData:self.foto];
}

@end
