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

@interface DetalheEnciclopediaViewController ()

@end

@implementation DetalheEnciclopediaViewController
@synthesize causa;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.informacoesDoenca setDelegate:self];
    
    [_imagensDoenca setImage: [UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"img.jpg" ofType:nil]]];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(next:)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeLeft setDelegate:self];
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(previous:)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [swipeRight setDelegate:self];
    [self.view addGestureRecognizer:swipeRight];
    
//    causa.lineBreakMode = NSLineBreakByWordWrapping;
//    causa.numberOfLines = 3;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    DoencaManager *doencaManager = [DoencaManager sharedInstance];
    Doenca *doenca = [doencaManager.doencas objectAtIndex:doencaManager.doencaAtual];
    //titulo
    [self setTitle:doenca.nome];
    //descrição
    [self.informacoesDoenca setText:doenca.descricao];
    //causa
    [self.causa setText:doenca.causa];
    //prevenção
    [self.prevencao setText:doenca.prevencao];
    //sintomas
    for(int i=0; i<doenca.sintomas.count; i++)
        [self.sintoma setText: [doenca.sintomas objectAtIndex:i]];
    
    
}

- (void)next:(id)sender {
    DoencaManager *doencaManager = [DoencaManager sharedInstance];
    if (doencaManager.doencaAtual == doencaManager.doencas.count-1)
        doencaManager.doencaAtual = 0;
    else
        doencaManager.doencaAtual++;
    NSMutableArray *newViewControllers = [[NSMutableArray alloc] initWithArray:self.navigationController.viewControllers];
    [newViewControllers removeLastObject];
    [newViewControllers addObject:[[DetalheEnciclopediaViewController alloc] init]];
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
    [self.navigationController setViewControllers:newViewControllers];
}

@end
