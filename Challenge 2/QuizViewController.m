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
    //int perguntaAtual;
    NSArray *botoes;
    //NSMutableArray *perguntas;
    QuizManager *qm;
    //Para voltar ou ir para a próxima view
    BOOL volta;
}

@end

@implementation QuizViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    volta=false;
    _pontos.text = @"Pontuação: 0";
    _sequencia.text = @"Combo: 0";
    [self.navigationController setNavigationBarHidden:YES];
    //perguntaAtual = 0;
    secondsLeft = 60;
    [self countdownTimer];
    qm = [[QuizManager alloc] init];
    
    
    //    perguntas = [[NSMutableArray alloc] initWithObjects:
    //    [[Pergunta alloc] init:@"P 1" withAlternativas:@[@"Certo", @"bvadvas", @"casfafw"]],
    //    [[Pergunta alloc] init:@"P 2" withAlternativas:@[@"6", @"7", @"8"]],
    //    //[[Pergunta alloc] init:<#(NSString *)#> withCorreto:<#(NSString *)#> withAlternativas:<#(NSArray *)#>]
    //                 nil];
    
    [_b1 addTarget:self action:@selector(responde:) forControlEvents:UIControlEventTouchUpInside];
    [_b2 addTarget:self action:@selector(responde:) forControlEvents:UIControlEventTouchUpInside];
    [_b3 addTarget:self action:@selector(responde:) forControlEvents:UIControlEventTouchUpInside];
    botoes = @[_b1, _b2, _b3];
    for (UIButton *botao in botoes) {
        [botao setContentEdgeInsets:UIEdgeInsetsMake(0, 5.0f, 0, 5.0f)];
        [botao.layer setBorderWidth:1.0f];
    }
    
    [self proxPerg];
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

-(void)responde: (id)sender{
    for (int i = 0; i < [botoes count]; i++) {
        [(UIButton *)[botoes objectAtIndex:i] setHidden:YES];
    }
    UIButton *b = (UIButton *)sender;
    if ([[b titleLabel] text] == [(Pergunta *)[[qm perguntas] objectAtIndex:[qm perguntaAtual]] correto]) {
        //secondsLeft += 2;
        qm.pontuacao += 100 * [qm seqAcertos];
        qm.seqAcertos++;
        _pontos.text = [NSString stringWithFormat:@"Pontuação: %d", [qm pontuacao]];
    } else {
        qm.seqAcertos = 1;
        if (secondsLeft - 5 <= 1) {
            secondsLeft = 1;
        } else {
            secondsLeft -= 5;
        }
    }
    _sequencia.text = [NSString stringWithFormat:@"Combo: %d", [qm seqAcertos] - 1];
    qm.perguntaAtual += 1;
    if ([qm perguntaAtual] < [[qm perguntas] count]){
    //perguntaAtual++;
    //NSLog(@"\n\n");
        [self proxPerg];
    } else {
        secondsLeft = 1;
    }
    
}

-(void) proxPerg {
    _pergunta.text = [(Pergunta *)[[qm perguntas] objectAtIndex:[qm perguntaAtual]] pergunta];
    //NSMutableArray *a = [[NSMutableArray alloc] initWithArray:[(Pergunta *)[perguntas objectAtIndex:0] alternativas]];//Alternativas
    
    //    for (int x = 0; x < [a count]; x++) {
    //        int randInt = (arc4random() % ([a count] - x)) + x;
    //        [a exchangeObjectAtIndex:x withObjectAtIndex:randInt];
    //        //[(UIButton *)[botoes objectAtIndex:x] setTag:0];
    //    }
    
    for (int i = 0; i < [botoes count]; i++) {
        //[(UIButton *)[botoes objectAtIndex:i] setHidden:NO];
        [(UIButton *)[botoes objectAtIndex:i] setTitle:[[(Pergunta *)[[qm perguntas] objectAtIndex:[qm perguntaAtual]] alternativas] objectAtIndex:i] forState:UIControlStateNormal];
    }
    
    
    //
    //    [self.view setNeedsDisplay];
    for (int i = 0; i < [botoes count]; i++) {
        [(UIButton *)[botoes objectAtIndex:i] setHidden:NO];
    }
}

- (void) tempo: (id) sender{
    if(secondsLeft > 0 ){
        secondsLeft -= 0.5;
        //        hours = secondsLeft / 3600;
        //        minutes = (secondsLeft % 3600) / 60;
        int seconds = secondsLeft;
        _tempo.text = [NSString stringWithFormat:@"%d", seconds];
    }
    else{
        [timer invalidate];
        //A opção de salvar a pontuação apenas será mostrada caso o jogador tenha marcado pontos (i.e. pontos > 0).
        if (qm.pontuacao) {
            //Cria uma AlertController que gerencia o alerta.
            UIAlertController *timerAlert = [UIAlertController alertControllerWithTitle:@"Fim do tempo!" message:[NSString stringWithFormat:@"Pontuação final: %d\nDeseja salvar sua pontuação?", qm.pontuacao] preferredStyle:UIAlertControllerStyleAlert];
            //Cria uma ação para quando o respectivo botão for pressionado. No caso, o botão "Sim".
            UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"Sim" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                PontuacaoManager *pontuacaoManager = [PontuacaoManager sharedInstance];
                [pontuacaoManager.pontuacaoAtual setPontos:qm.pontuacao];
                [pontuacaoManager.pontuacaoAtual setCategoria:@"Quiz"];
                [self.navigationController pushViewController:[[SalvarPontuacao alloc] init] animated:YES];
            }];
            //Botão "Não".
            UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"Não" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                volta=true;
                [self.navigationController popToRootViewControllerAnimated:NO];
            }];
            //Adiciona as ações ao alerta.
            [timerAlert addAction:yesAction];
            [timerAlert addAction:noAction];
            //A view controller apresenta o alerta.
            [self presentViewController:timerAlert animated:YES completion:nil];
            //Pontuacao manager
            //Perguntar se quer salvar dados
            //Se sim, cria um pontuação manager, seta pontuação atual e vai pra outra view.
        } else {
            UIAlertController *timerAlert = [UIAlertController alertControllerWithTitle:@"Fim do tempo!" message:@"Você não marcou nenhum ponto...\nTentar de novo?" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"Sim" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [self viewDidLoad];
            }];
            UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"Não" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [self.navigationController popToRootViewControllerAnimated:NO];
            }];
            [timerAlert addAction:yesAction];
            [timerAlert addAction:noAction];
            [self presentViewController:timerAlert animated:YES completion:nil];
        }
    }
}

-(void)countdownTimer{
    
    //hours = minutes = seconds = 0;
    //    if([timer isValid])
    //    {
    //        [timer release];
    //    }
    //    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(tempo:) userInfo:nil repeats:YES];
    //    [pool release];
}

- (IBAction)desistirBotao:(id)sender {
    UIAlertController *confirmGiveUpAlert = [UIAlertController alertControllerWithTitle:@"Desistência" message:@"Tem certeza?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"Sim" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.navigationController popToRootViewControllerAnimated:NO];
    }];
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"Não" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        //Começar a contar o tempo de novo.
    }];
    [confirmGiveUpAlert addAction:yesAction];
    [confirmGiveUpAlert addAction:noAction];
    //Parar o tempo.
    [self presentViewController:confirmGiveUpAlert animated:YES completion:nil];
}

@end
