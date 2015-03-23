//
//  jogoQuizViewController.h
//  Challenge 2
//
//  Created by Amanda Guimaraes Campos on 23/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface jogoQuizViewController : UIViewController


- (IBAction)alternativaABotao:(id)sender;
- (IBAction)alternativaBBotao:(id)sender;
- (IBAction)alternativaCBotao:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *imagemDoenca;
@property (weak, nonatomic) IBOutlet UILabel *pergunta;

@end
