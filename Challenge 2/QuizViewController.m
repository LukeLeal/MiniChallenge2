//
//  jogoQuizViewController.m
//  Challenge 2
//
//  Created by Amanda Guimaraes Campos on 23/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "QuizViewController.h"
#import "SalvarPontuacao.h"
#import "PontuacaoManager.h"

@interface QuizViewController (){
    //int hours, minutes, seconds;
    double secondsLeft;
    NSTimer *timer;
    DeviceModel *deviceModel;
    //int perguntaAtual;
    NSArray *botoes;
    //NSMutableArray *perguntas;
    QuizManager *qm;
    //Para voltar ou ir para a próxima view
    BOOL volta;
    BOOL estDesiste;//Se verdade, para o tempo.
    double timeAux;
}

@end

@implementation QuizViewController

@synthesize pontos, sequencia, tempo, clockImg;

#pragma mark - Interface

- (void)viewDidLoad {
    [super viewDidLoad];
    deviceModel = [DeviceModel instance];
    volta=false;
    pontos.text = @"Pontuação: 0";
    sequencia.text = @"Combo: 0";
    [self.navigationController setNavigationBarHidden:YES];
    //perguntaAtual = 0;
    secondsLeft = 30;
    [self countdownTimer];
    qm = [[QuizManager alloc] init];
    
    [_b1 addTarget:self action:@selector(responde:) forControlEvents:UIControlEventTouchUpInside];
    [_b2 addTarget:self action:@selector(responde:) forControlEvents:UIControlEventTouchUpInside];
    [_b3 addTarget:self action:@selector(responde:) forControlEvents:UIControlEventTouchUpInside];
    botoes = @[_b1, _b2, _b3];
    for (UIButton *botao in botoes) {
        [botao setContentEdgeInsets:UIEdgeInsetsMake(0, 5.0f, 0, 5.0f)];
        [botao.layer setBorderWidth:3.0f];
        [botao.layer setBorderColor:[UIColor greenColor].CGColor];
    }
    
    [self proxPerg];
}

-(void) viewDidAppear:(BOOL)animated{
    [self adjustSize];
}

-(void) viewWillDisappear:(BOOL)animated{
    if(volta){
        [UIView animateWithDuration:0.75
                         animations:^{
                             [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                             [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
                         }];
    }
    else{
        [UIView animateWithDuration:0.75
                         animations:^{
                             [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                             [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
                         }];
    }
}

- (void)adjustSize{
//    float newValue = [deviceModel getQuizViewClockSize];
    float newValue = 5;
    [clockImg setFrame:CGRectMake(clockImg.frame.origin.x, clockImg.frame.origin.y, newValue, newValue)];
}

#pragma mark - Jogo

-(void)responde: (id)sender{
    for (int i = 0; i < [botoes count]; i++) {
        [(UIButton *)[botoes objectAtIndex:i] setHidden:YES];
    }
    UIButton *b = (UIButton *)sender;
    if ([[[b titleLabel] text] isEqualToString:[(Pergunta *)[[qm perguntas] objectAtIndex:[qm perguntaAtual]] correto]]) {
        //secondsLeft += 2;
        qm.pontuacao += 100 * [qm seqAcertos];
        qm.seqAcertos++;
        pontos.text = [NSString stringWithFormat:@"Pontuação: %d", [qm pontuacao]];
        _resultado.text = @"ACERTOU!";
    } else {
        qm.seqAcertos = 1;
        if (secondsLeft - 5 <= 1) {
            secondsLeft = 1;
        } else {
            secondsLeft -= 5;
        }
        _resultado.text = @"ERROU!";
    }
    sequencia.text = [NSString stringWithFormat:@"Combo: %d", [qm seqAcertos] - 1];
    qm.perguntaAtual += 1;
    _resultado.hidden = false;
    [self animacaoResposta];
    if ([qm perguntaAtual] < [[qm perguntas] count]){
        [self proxPerg];
    } else {
        secondsLeft = 1;
    }
    
}

-(void) proxPerg {
    _pergunta.text = [(Pergunta *)[[qm perguntas] objectAtIndex:[qm perguntaAtual]] pergunta];
    NSMutableArray *alternativas = [qm embaralha];
    for (int i = 0; i < [botoes count]; i++) {
        //[(UIButton *)[botoes objectAtIndex:i] setHidden:NO];
        [(UIButton *)[botoes objectAtIndex:i] setTitle:[(Alternativa *)[alternativas objectAtIndex:i] texto] forState:UIControlStateNormal];
    }
    
    //
    //    [self.view setNeedsDisplay];
    for (int i = 0; i < [botoes count]; i++) {
        [(UIButton *)[botoes objectAtIndex:i] setHidden:NO];
    }
}

- (void) animacaoResposta {
    timeAux = secondsLeft;
    [UIView beginAnimations:@"fadeInNewView" context:NULL];
    [UIView setAnimationDuration:1.0];
    self.resultado.transform = CGAffineTransformMakeScale(1.8, 1.8);
    self.resultado.alpha = 1.0f;
    [UIView commitAnimations];
    
    [UIView beginAnimations:@"fadeInNewView" context:NULL];
    [UIView setAnimationDuration:1.0];
    self.resultado.transform = CGAffineTransformMakeScale(1,1);
    self.resultado.alpha = 1.0f;
    self.resultado.layer.borderWidth = 3.0;
    self.resultado.layer.borderColor = [UIColor purpleColor].CGColor;
    [UIView commitAnimations];
}

#pragma mark - Tempo (i.e. NSTimer)

- (void) tempo: (id) sender{
    if (!estDesiste) {
        if(secondsLeft > 0 ){
            secondsLeft -= 0.5;
            //        hours = secondsLeft / 3600;
            //        minutes = (secondsLeft % 3600) / 60;
            int seconds = secondsLeft;
            tempo.text = [NSString stringWithFormat:@"%d", seconds];
            if (secondsLeft <= timeAux - 2){
                _resultado.hidden = true;
            }
        }
        else{
            [timer invalidate];
            UIAlertController *timerAlert;
            UIAlertAction *yesAction, *noAction;
            //A opção de salvar a pontuação apenas será mostrada caso o jogador tenha marcado pontos (i.e. pontos > 0).
            if (qm.pontuacao) {
                //Pontuacao manager
                //Perguntar se quer salvar dados
                //Se sim, cria um pontuação manager, seta pontuação atual e vai pra outra view.
                //Cria uma AlertController que gerencia o alerta.
                timerAlert = [UIAlertController alertControllerWithTitle:@"Fim do tempo!" message:[NSString stringWithFormat:@"Pontuação final: %d\nDeseja salvar sua pontuação?", qm.pontuacao] preferredStyle:UIAlertControllerStyleAlert];
                //Cria uma ação para quando o respectivo botão for pressionado. No caso, o botão "Sim".
                yesAction = [UIAlertAction actionWithTitle:@"Sim" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                    PontuacaoManager *pontuacaoManager = [PontuacaoManager sharedInstance];
                    [pontuacaoManager.pontuacaoAtual setPontos:qm.pontuacao];
                    [pontuacaoManager.pontuacaoAtual setCategoria:@"Quiz"];
                    [self.navigationController pushViewController:[[SalvarPontuacao alloc] init] animated:YES];
                }];
                //Botão "Não".
                noAction = [UIAlertAction actionWithTitle:@"Não" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                    volta=true;
                    [self.navigationController popToRootViewControllerAnimated:NO];
                }];
            } else {
                timerAlert = [UIAlertController alertControllerWithTitle:@"Fim do tempo!" message:@"Você não marcou nenhum ponto...\nTentar de novo?" preferredStyle:UIAlertControllerStyleAlert];
                yesAction = [UIAlertAction actionWithTitle:@"Sim" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                    [self viewDidLoad];
                }];
                noAction = [UIAlertAction actionWithTitle:@"Não" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                    [self.navigationController popToRootViewControllerAnimated:NO];
                }];
            }
            //Adiciona as ações ao alerta.
            [timerAlert addAction:yesAction];
            [timerAlert addAction:noAction];
            //A view controller apresenta o alerta.
            [self presentViewController:timerAlert animated:YES completion:nil];
        }
    }
}

-(void)countdownTimer{
    timer = [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(tempo:) userInfo:nil repeats:YES];
}

#pragma mark - Navegação

- (IBAction)desistirBotao:(id)sender {
    estDesiste = YES;
    UIAlertController *confirmGiveUpAlert = [UIAlertController alertControllerWithTitle:@"Desistência" message:@"Tem certeza?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"Sim" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.navigationController popToRootViewControllerAnimated:NO];
    }];
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"Não" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        estDesiste = NO;
    }];
    [confirmGiveUpAlert addAction:yesAction];
    [confirmGiveUpAlert addAction:noAction];
    //Parar o tempo.
    [self presentViewController:confirmGiveUpAlert animated:YES completion:nil];
}

@end
