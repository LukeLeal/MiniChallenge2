//
//  MemoriaViewController.m
//  Challenge 2
//
//  Created by Andre Lucas Ota on 30/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "MemoriaViewController.h"

@interface MemoriaViewController ()

@end

@implementation MemoriaViewController

@synthesize img1, img2, img3, img4;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Memória"];
    
    NSArray *arrayBotoes = [NSArray arrayWithObjects: img1, img2, img3, img4, nil];
    for (UIButton *b in arrayBotoes){
        [b setBackgroundColor:[UIColor redColor]];
        [b.titleLabel setAlpha:0.0f];
    }
}

- (void)viewWillAppear:(BOOL)animated{
}

- (void)viewWillDisappear:(BOOL)animated{
    [UIView animateWithDuration:0.75
                     animations:^{
                         [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
                     }];
}

- (void)viewDidAppear:(BOOL)animated{
}

- (IBAction)botao:(UIButton *)sender {
//    Setar a cor para não dar um efeito de delay durante a troca de cor
    [sender setBackgroundColor:[UIColor blueColor]];
    [UIView transitionWithView:sender duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                           [sender setBackgroundColor:[UIColor blueColor]];
                           [sender setTitleColor:[UIColor whiteColor] forState:normal];
                       } completion:nil];
}
@end
