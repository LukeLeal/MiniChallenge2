//
//  HomeViewController.h
//  Challenge 2
//
//  Created by Lucas Leal Mendonça on 23/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PontuacaoViewController.h"
#import "EnciclopediaViewController.h"
#import "JogosViewController.h"
#import "DeviceModel.h"

@interface HomeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *jogar;
@property (weak, nonatomic) IBOutlet UIButton *pontuacao;
@property (weak, nonatomic) IBOutlet UIButton *enciclopedia;
@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property DeviceModel* deviceModel;

- (IBAction)jogarBotao:(id)sender;
- (IBAction)pontuacaoBotao:(id)sender;
- (IBAction)enciclopediaBotao:(id)sender;

@end
