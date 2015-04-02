//
//  MemoriaViewController.h
//  Challenge 2
//
//  Created by Andre Lucas Ota on 30/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Carta.h"
#import "MemoriaManager.h"
#import "DoencaManager.h"
#import "SalvarPontuacao.h"
#import "PontuacaoManager.h"

@interface MemoriaViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *carta1;
@property (weak, nonatomic) IBOutlet UIButton *carta2;
@property (weak, nonatomic) IBOutlet UIButton *carta3;
@property (weak, nonatomic) IBOutlet UIButton *carta4;
@property (weak, nonatomic) IBOutlet UIButton *carta5;
@property (weak, nonatomic) IBOutlet UIButton *carta6;
@property (weak, nonatomic) IBOutlet UIButton *carta7;
@property (weak, nonatomic) IBOutlet UIButton *carta8;
@property (weak, nonatomic) IBOutlet UIButton *carta9;
@property (weak, nonatomic) IBOutlet UIButton *carta10;
@property (weak, nonatomic) IBOutlet UIButton *carta11;
@property (weak, nonatomic) IBOutlet UIButton *carta12;
@property (weak, nonatomic) IBOutlet UILabel *tempo;
@property (weak, nonatomic) IBOutlet UILabel *pontuacao;


- (IBAction)botao:(UIButton *)sender;
- (IBAction)desistirBotao:(id)sender;


@end
