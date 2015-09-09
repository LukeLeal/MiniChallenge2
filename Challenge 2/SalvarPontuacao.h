//
//  SalvarPontuacao.h
//  Challenge 2
//
//  Created by Lucas Leal Mendonça on 26/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SalvarPontuacao : UIViewController <UITextFieldDelegate, UIGestureRecognizerDelegate, UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *categoria;//Quiz ou memória
@property (weak, nonatomic) IBOutlet UILabel *pontos;
@property (weak, nonatomic) IBOutlet UITextField *nome;
@property (weak, nonatomic) IBOutlet UIImageView *foto;

- (IBAction)salvar:(id)sender;
- (IBAction)cancelar:(id)sender;

@end
