//
//  PontuacaoViewController.m
//  Challenge 2
//
//  Created by Andre Lucas Ota on 24/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "PontuacaoViewController.h"

@interface PontuacaoViewController ()

@end

@implementation PontuacaoViewController

@synthesize tableView, modoJogo;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"PontuacaoTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"celulaPadrao"];
    
    UIImage *img = [UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"Home.png" ofType:nil]];
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithImage:img style:UIBarButtonItemStylePlain target: self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem=back;
    
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    
    [self setTitle:@"Pontuação"];
}

#pragma mark - Table

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger i = modoJogo.selectedSegmentIndex;
    
    PontuacaoTableViewCell *celula = [self.tableView dequeueReusableCellWithIdentifier:@"celulaPadrao"];
    [celula.nome setText:@"Oi"];
    [celula.pontos setText:@"Oi"];
    [celula.avatar setImage:[UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"img.jpg" ofType:nil]]];
    
//    switch (i) {
//        case 0:
//            [celula.nome setText:];
//            [celula.pontos setText:];
//            [celula.avatar setImage:[UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"img.jpg" ofType:nil]]];
//            break;
//            
//        case 2:
//            [celula.nome setText:];
//            [celula.pontos setText:];
//            [celula.avatar setImage:[UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"img.jpg" ofType:nil]]];
//            break;
//    }
    
    return celula;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 105;
}

- (void) back:(id)sender{
    [UIView animateWithDuration:0.75
                     animations:^{
                         [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
                     }];
    [self.navigationController popViewControllerAnimated:NO];
}

#pragma mark - Segmented Control
- (IBAction)trocaModoJogo:(id)sender {
    [self.tableView reloadData];
}

@end
