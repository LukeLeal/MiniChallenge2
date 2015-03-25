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
    
//    causa.lineBreakMode = NSLineBreakByWordWrapping;
//    causa.numberOfLines = 3;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    
    //
    DoencaManager *doencaManager = [DoencaManager sharedInstance];
    Doenca *doenca = [doencaManager.doencas objectAtIndex:doencaManager.doencaAtual];
    
    //titulo
    [self setTitle:doenca.nome];
    
    //descrição
    [self.informacoesDoenca setText:doenca.descricao];
    
    //[self.informacoesDoenca setUserInteractionEnabled:NO]; //desabilitar edição.
    
    //causa
    [self.causa setText:doenca.causa];
    
    //prevenção
    [self.prevencao setText:doenca.prevencao];
    
    //sintomas
    NSArray *a = doenca.sintomas;
   // NSString *b = @"";
    for(int i=0; i<a.count; i++){
        [self.sintoma setText: [a objectAtIndex:i]];
    }
    
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
