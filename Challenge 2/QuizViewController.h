//
//  jogoQuizViewController.h
//  Challenge 2
//
//  Created by Amanda Guimaraes Campos on 23/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuizManager.h"
#import "Pergunta.h"
#import "DeviceModel.h"

@interface QuizViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *clockImg;
@property (weak, nonatomic) IBOutlet UITextView *pergunta;
@property (weak, nonatomic) IBOutlet UILabel *tempo;
@property (weak, nonatomic) IBOutlet UILabel *pontos;
@property (weak, nonatomic) IBOutlet UILabel *sequencia; // sequencia de acertos
@property (weak, nonatomic) IBOutlet UIButton *b1;
@property (weak, nonatomic) IBOutlet UIButton *b2;
@property (weak, nonatomic) IBOutlet UIButton *b3;
@property (weak, nonatomic) IBOutlet UILabel *resultado;

- (IBAction)desistirBotao:(id)sender;

@end
