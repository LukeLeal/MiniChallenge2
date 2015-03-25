//
//  DetalheEnciclopediaViewController.m
//  Challenge 2
//
//  Created by Amanda Guimaraes Campos on 23/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "DetalheEnciclopediaViewController.h"
#import "DoencaManager.h"
#import "Doenca.h"

@interface DetalheEnciclopediaViewController ()

@end

@implementation DetalheEnciclopediaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.informacoesDoenca setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    
    //descrição
    DoencaManager *doencaManager = [DoencaManager sharedInstance];
    Doenca *doenca = [doencaManager.doencas objectAtIndex:doencaManager.doencaAtual];
    
    [self.informacoesDoenca setText:doenca.descricao];
    //[self.informacoesDoenca setUserInteractionEnabled:NO];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
