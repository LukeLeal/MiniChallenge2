//
//  PontuacaoViewController.m
//  Challenge 2
//
//  Created by Andre Lucas Ota on 24/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "PontuacaoViewController.h"
#import "PontuacaoManager.h"
#import "Pontuacao.h"

@interface PontuacaoViewController () {
    NSMutableArray *pontuacoesQuiz;
    NSMutableArray *pontuacoesMemoria;
}

@end

@implementation PontuacaoViewController

@synthesize tableView, modoJogo;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"PontuacaoTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"PontuacaoCell"];
    
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    
    [self setTitle:@"Pontuação"];
    
    PontuacaoManager *pontuacaoManager = [PontuacaoManager sharedInstance];
    for (Pontuacao *pontuacao in pontuacaoManager.pontuacoes) {
        if ([pontuacao.categoria isEqualToString:@"Quiz"])
            [pontuacoesQuiz addObject:pontuacao];
        else
            [pontuacoesMemoria addObject:pontuacao];
    }
}

-(void) viewWillDisappear:(BOOL)animated{
    [UIView animateWithDuration:0.75
                     animations:^{
                         [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
                     }];
}

#pragma mark - Tabela

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (modoJogo.selectedSegmentIndex == 0)
        return pontuacoesQuiz.count;
    else if (modoJogo.selectedSegmentIndex == 1)
        return pontuacoesMemoria.count;
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PontuacaoManager *pontuacaoManager = [PontuacaoManager sharedInstance];
    PontuacaoTableViewCell *celula = [self.tableView dequeueReusableCellWithIdentifier:@"PontuacaoCell"];
    switch (modoJogo.selectedSegmentIndex) {
        case 0:
        {
            Pontuacao *pontuacao = [pontuacoesQuiz objectAtIndex:indexPath.row];
            [celula.nome setText:pontuacao.nome];
            [celula.pontos setText:[NSString stringWithFormat:@"%d", pontuacao.pontos]];
            [celula.foto setImage:[UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"img.jpg" ofType:nil]]];
            break;
        }
        case 1:
        {
            Pontuacao *pontuacao = [pontuacoesMemoria objectAtIndex:indexPath.row];
            [celula.nome setText:pontuacao.nome];
            [celula.pontos setText:[NSString stringWithFormat:@"%d", pontuacao.pontos]];
            [celula.foto setImage:[UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"img.jpg" ofType:nil]]];
            break;
        }
    }
    return celula;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 105;
}

#pragma mark - Segmented Control
- (IBAction)trocaModoJogo:(id)sender {
    [self.tableView reloadData];
}

@end
