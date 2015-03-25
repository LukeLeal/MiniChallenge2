//
//  jogoQuizViewController.m
//  Challenge 2
//
//  Created by Amanda Guimaraes Campos on 23/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController (){
    //int hours, minutes, seconds;
    double secondsLeft;
    NSTimer *timer;
    int perguntaAtual;
    NSArray *botoes;
    //NSMutableArray *perguntas;
    QuizManager *qm;
}

@end

@implementation QuizViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _pontos.text = @"Pontuação: 0";
    perguntaAtual = 0;
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
    
    [self proxPerg];
}


-(void) viewWillDisappear:(BOOL)animated{
    [UIView animateWithDuration:0.75
                     animations:^{
                         [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
                     }];
}

-(void)responde: (id)sender{
    UIButton *b = (UIButton *)sender;
    
    if ([[b titleLabel] text] == [(Pergunta *)[[qm perguntas] objectAtIndex:0] correto]) {
        secondsLeft += 2;
        qm.pontuacao += 1;
        _pontos.text = [NSString stringWithFormat:@"Pontos: %d", [qm pontuacao]];
    } else {
        if (secondsLeft - 5 <= 1) {
            secondsLeft = 1;
        } else {
            secondsLeft -= 5;
        }
    }
    qm.perguntaAtual += 1;
    //perguntaAtual++;
    //NSLog(@"\n\n");
    [self proxPerg];
    
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
        [(UIButton *)[botoes objectAtIndex:i] setTitle:[[(Pergunta *)[[qm perguntas] objectAtIndex:[qm perguntaAtual]] alternativas] objectAtIndex:i] forState:UIControlStateNormal];
    }
    
    
    //
    //    [self.view setNeedsDisplay];
    
}

- (void) tempo: (id) sender{
    if(secondsLeft > 0 ){
        secondsLeft -= 0.5;
        //        hours = secondsLeft / 3600;
        //        minutes = (secondsLeft % 3600) / 60;
        int seconds = secondsLeft;
        _tempo.text = [NSString stringWithFormat:@"Segundos: %d", seconds];
    }
    else{
        NSLog(@"Fim do tempo!");
        [timer invalidate];
        //Pontuacao manager
        //Perguntar se quer salvar dados
        //Se sim, cria um pontuação manager, seta pontuação atual e vai pra outra view.
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//- (IBAction)alternativaABotao:(id)sender {
//}
//
//- (IBAction)alternativaBBotao:(id)sender {
//}
//
//- (IBAction)alternativaCBotao:(id)sender {
//}
@end
