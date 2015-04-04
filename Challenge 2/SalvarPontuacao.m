//
//  SalvarPontuacao.m
//  Challenge 2
//
//  Created by Lucas Leal Mendonça on 26/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "SalvarPontuacao.h"
#import "PontuacaoViewController.h"
#import "PontuacaoManager.h"

@interface SalvarPontuacao ()

@end

@implementation SalvarPontuacao

#pragma mark - Interface

- (void)viewDidLoad {
    [super viewDidLoad];
    PontuacaoManager *pontuacaoManager = [PontuacaoManager sharedInstance];
//    [self.navigationController setNavigationBarHidden:YES];
    [self.nome setDelegate:self];
    [self.categoria setText:pontuacaoManager.pontuacaoAtual.categoria];
    [self.pontos setText:[NSString stringWithFormat:@"%d", pontuacaoManager.pontuacaoAtual.pontos]];
    
    UITapGestureRecognizer *tapFoto = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(editarFoto:)];
    [tapFoto setDelegate:self];
    [self.foto addGestureRecognizer:tapFoto];
}

- (void)viewWillDisappear:(BOOL)animated{
    [UIView animateWithDuration:0.75
                     animations:^{
                         [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
                     }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.nome resignFirstResponder];
}

#pragma mark - UIImagePicker

- (void)editarFoto:(id)sender {
    UIActionSheet *photoAction = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:nil otherButtonTitles:@"Tirar foto", @"Escolher foto", nil];
    [photoAction showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //Tirar foto
    if (buttonIndex == 0) {
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            UIAlertView *noCameraAlert = [[UIAlertView alloc] initWithTitle:@"Erro" message:@"Nenhuma câmera detectada" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [noCameraAlert show];
        } else
            [self tirarFoto];
        //Escolher foto
    } else if (buttonIndex == 1) {
        [self escolherFoto];
    }
}

- (void)tirarFoto {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    [picker setDelegate:self];
    [picker setAllowsEditing:YES];
    [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)escolherFoto {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    [picker setDelegate:self];
    [picker setAllowsEditing:YES];
    [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [self.foto setImage:info[UIImagePickerControllerEditedImage]];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Persistência de Dados

- (IBAction)salvar:(id)sender {
    if (self.nome.text.length < 3 || self.nome.text.length > 10) {
        UIAlertController *nameTooSmallAlert = [UIAlertController alertControllerWithTitle:@"Aviso" message:@"Insira um nome entre 3 a 10 caracteres" preferredStyle:UIAlertControllerStyleAlert];
        [nameTooSmallAlert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:nameTooSmallAlert animated:NO completion:nil];
    } else {
        
        PontuacaoManager *pontuacaoManager = [PontuacaoManager sharedInstance];
        [pontuacaoManager.pontuacaoAtual setNome:self.nome.text];
        [pontuacaoManager.pontuacaoAtual setFotoWithUIImage:self.foto.image];
        [pontuacaoManager addPontuacao:pontuacaoManager.pontuacaoAtual];
        
        NSMutableArray *newViewControllers = [[NSMutableArray alloc] initWithArray:self.navigationController.viewControllers];
        [newViewControllers removeObjectsInRange:NSMakeRange(1, self.navigationController.viewControllers.count-1)];
        [newViewControllers addObject:[[PontuacaoViewController alloc] init]];
        [self.navigationController setViewControllers:newViewControllers animated:YES];
    }
}

#pragma mark - Navegação

- (IBAction)cancelar:(id)sender {
    //Cria uma AlertController que gerencia o alerta.
    UIAlertController *confirmCancelAlert = [UIAlertController alertControllerWithTitle:@"Cancelar" message:@"Tem certeza?" preferredStyle:UIAlertControllerStyleAlert];
    //Cria uma ação para quando o respectivo botão for pressionado. No caso, o botão "Sim".
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"Sim" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.navigationController popToRootViewControllerAnimated:NO];
    }];
    //Botão "Não", que mantém o usuário na mesma view.
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"Não" style:UIAlertActionStyleDefault handler:nil];
    //Adiciona as ações ao alerta.
    [confirmCancelAlert addAction:yesAction];
    [confirmCancelAlert addAction:noAction];
    //A view controller apresenta o alerta.
    [self presentViewController:confirmCancelAlert animated:NO completion:nil];
}
@end
