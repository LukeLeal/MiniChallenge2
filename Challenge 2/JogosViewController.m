//
//  OpcoesJogosViewController.m
//  Challenge 2
//
//  Created by Amanda Guimaraes Campos on 23/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "JogosViewController.h"

@interface JogosViewController (){
    BOOL volta;
}

@end

@implementation JogosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void) viewWillAppear:(BOOL)animated{
    volta = true;
}

-(void) viewWillDisappear:(BOOL)animated{
    if(volta){
        [UIView animateWithDuration:0.75
                         animations:^{
                             [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                             [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
                         }];
    }
    else{
        [UIView animateWithDuration:0.75
                         animations:^{
                             [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                             [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
                         }];
        
    }
}


#pragma mark - Ações de botões
- (IBAction)memoriaBotao:(id)sender {
}

- (IBAction)quizBotao:(id)sender {
    volta=false;
    QuizViewController *quiz = [[QuizViewController alloc]init];
    [self.navigationController pushViewController:quiz animated:NO];
}

- (IBAction)rouletteBotao:(id)sender {
}
@end
