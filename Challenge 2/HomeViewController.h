//
//  HomeViewController.h
//  Challenge 2
//
//  Created by Lucas Leal Mendonça on 23/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *logo;

- (IBAction)jogarBotao:(id)sender;
- (IBAction)pontuacaoBotao:(id)sender;
- (IBAction)enciclopediaBotao:(id)sender;

@end
