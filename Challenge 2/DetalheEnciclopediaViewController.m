//
//  DetalheEnciclopediaViewController.m
//  Challenge 2
//
//  Created by Amanda Guimaraes Campos on 23/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "DetalheEnciclopediaViewController.h"
#import "EnciclopediaViewController.h"
#import "DoencaManager.h"
#import "Doenca.h"

@interface DetalheEnciclopediaViewController (){
    BOOL volta;

}

@end

#pragma mark - Interface

@implementation DetalheEnciclopediaViewController
@synthesize causa;

- (void)viewDidLoad {
    [super viewDidLoad];


    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(next:)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeLeft setDelegate:self];
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(previous:)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [swipeRight setDelegate:self];
    [self.view addGestureRecognizer:swipeRight];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    DoencaManager *doencaManager = [DoencaManager sharedInstance];
    Doenca *doenca = [doencaManager.doencas objectAtIndex:doencaManager.doencaAtual];
    
//    for (int i=0; i<12; i++) {
    
        NSString *img = [NSString stringWithFormat:@"%@.png", doenca.nome];
        [_imagemDoenca setImage: [UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource: img ofType:nil]]];
//    }
    
    //titulo
    [self setTitle:doenca.nome];
    //descrição
    [self.informacoesDoenca setText:doenca.descricao];
    [self.informacoesDoenca setFont:[UIFont fontWithName:@"superclarendon" size:15.0f]];
    [self.informacoesDoenca setTextColor:[UIColor whiteColor]];
    [self.informacoesDoenca setTextAlignment:NSTextAlignmentJustified];
    //causa
    [self.causa setText:doenca.causa];
    //prevenção
    [self.prevencao setText:doenca.prevencao];
    //sintomas
    NSArray *q = [[doenca sintomas] allObjects];
    NSString *strSint = @"";//NSString que concatenará os sintomas
    for(int i=0; i<doenca.sintomas.count; i++){
        strSint = [strSint stringByAppendingString: [NSString stringWithFormat:@"%@; ", [(Sintoma *)[q objectAtIndex:i] texto]]];
    }
    [self.sintoma setText: strSint];
    volta=true;
}

- (void) viewWillDisappear:(BOOL)animated{
    [self animacao];
}

#pragma mark - Navegação

- (void)next:(id)sender {
    DoencaManager *doencaManager = [DoencaManager sharedInstance];
    if (doencaManager.doencaAtual == doencaManager.doencas.count-1)
        doencaManager.doencaAtual = 0;
    else
        doencaManager.doencaAtual++;
    NSMutableArray *newViewControllers = [[NSMutableArray alloc] initWithArray:self.navigationController.viewControllers];
    [newViewControllers removeLastObject];
    [newViewControllers addObject:[[DetalheEnciclopediaViewController alloc] init]];
    volta=false;
    [self animacao];
    [self.navigationController setViewControllers:newViewControllers];
}

- (void)previous:(id)sender {
    DoencaManager *doencaManager = [DoencaManager sharedInstance];
    if (doencaManager.doencaAtual == 0)
        doencaManager.doencaAtual = (int)doencaManager.doencas.count-1;
    else
        doencaManager.doencaAtual--;
    NSMutableArray *newViewControllers = [[NSMutableArray alloc] initWithArray:self.navigationController.viewControllers];
    [newViewControllers removeLastObject];
    [newViewControllers addObject:[[DetalheEnciclopediaViewController alloc] init]];
    volta=true;
    [self animacao];
    [self.navigationController setViewControllers:newViewControllers];
}


#pragma mark - Animação

- (void)animacao{
    if (volta){
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

@end
