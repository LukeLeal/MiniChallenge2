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

@interface QuizViewController : UIViewController


//- (IBAction)alternativaABotao:(id)sender;
//- (IBAction)alternativaBBotao:(id)sender;
//- (IBAction)alternativaCBotao:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *imagemDoenca;
@property (weak, nonatomic) IBOutlet UILabel *pergunta;

@property (weak, nonatomic) IBOutlet UILabel *tempo;
@property (weak, nonatomic) IBOutlet UILabel *pontos;
@property (weak, nonatomic) IBOutlet UIButton *b1;
@property (weak, nonatomic) IBOutlet UIButton *b2;
@property (weak, nonatomic) IBOutlet UIButton *b3;
@end
