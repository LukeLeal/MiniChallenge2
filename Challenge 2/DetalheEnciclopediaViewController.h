//
//  DetalheEnciclopediaViewController.h
//  Challenge 2
//
//  Created by Amanda Guimaraes Campos on 23/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetalheEnciclopediaViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *informacoesDoenca;
@property (weak, nonatomic) IBOutlet UIImageView *imagensDoenca;
@property (weak, nonatomic) IBOutlet UIPageControl *scrollImagem;

@end
