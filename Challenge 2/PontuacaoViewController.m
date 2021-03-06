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

@synthesize tablePontuacao, modoJogo;

#pragma mark - Interface

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO];
    
    UINib *nib = [UINib nibWithNibName:@"PontuacaoTableViewCell" bundle:nil];
    [tablePontuacao registerNib:nib forCellReuseIdentifier:@"PontuacaoCell"];
    
    [tablePontuacao setDelegate:self];
    [tablePontuacao setDataSource:self];
    
    [self setTitle:@"Pontuação"];
    
    PontuacaoManager *pontuacaoManager = [PontuacaoManager sharedInstance];
    pontuacoesQuiz = [[NSMutableArray alloc] init];
    pontuacoesMemoria = [[NSMutableArray alloc] init];
    for (Pontuacao *pontuacao in [pontuacaoManager sortedPontuacoes]) {
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
    PontuacaoTableViewCell *celula = [self.tablePontuacao dequeueReusableCellWithIdentifier:@"PontuacaoCell"];
    switch (modoJogo.selectedSegmentIndex) {
        case 0:
        {
            Pontuacao *pontuacao = [pontuacoesQuiz objectAtIndex:indexPath.row];
            [celula.nome setText:pontuacao.nome];
            [celula.pontos setText:[NSString stringWithFormat:@"%@", pontuacao.pontos]];
            [celula.foto setImage:[pontuacao getFotoAsImage]];
            if (indexPath.row != 0)
                [celula.trophy setHidden:YES];
            break;
        }
        case 1:
        {
            Pontuacao *pontuacao = [pontuacoesMemoria objectAtIndex:indexPath.row];
            [celula.nome setText:pontuacao.nome];
            [celula.pontos setText:[NSString stringWithFormat:@"%@", pontuacao.pontos]];
            [celula.foto setImage:[pontuacao getFotoAsImage]];
            if (indexPath.row != 0)
                [celula.trophy setHidden:YES];
            break;
        }
    }
    return celula;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    //Caso o botão Delete for selecionado...
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        PontuacaoManager *pontuacaoManager = [PontuacaoManager sharedInstance];
        
        //Remove o objeto do Realm.io e da base de dados local para garantir que a tabela se atualize com o número correto de células.
        if (modoJogo.selectedSegmentIndex == 0) {
            [pontuacaoManager removePontuacao:[pontuacoesQuiz objectAtIndex:indexPath.row]];
            [pontuacoesQuiz removeObjectAtIndex:indexPath.row];
        } else if (modoJogo.selectedSegmentIndex == 1) {
            [pontuacaoManager removePontuacao:[pontuacoesMemoria objectAtIndex:indexPath.row]];
            [pontuacoesMemoria removeObjectAtIndex:indexPath.row];
        }
        
        //Remove a célula da tabela e atualiza.
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData];
    }
}

#pragma mark - Segmented Control

- (IBAction)trocaModoJogo:(id)sender {
    [self.tablePontuacao reloadData];
}

@end
