//
//  MemoriaViewController.m
//  Challenge 2
//
//  Created by Andre Lucas Ota on 30/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "MemoriaViewController.h"

@interface MemoriaViewController (){
    double secondsLeft;
    int parCont;
    BOOL volta, interativo, estDesiste;
    MemoriaManager *mm;
    NSMutableArray *selecionados, *arrayBotoes;
    UIImage *imagem;
    NSTimer *timer;
    //int hours, minutes, seconds;
}

@end

@implementation MemoriaViewController

@synthesize carta1,carta2,carta3,carta4,carta5,carta6,carta7,carta8,carta9,carta10,carta11,carta12, tempo, pontuacao;

#pragma mark - Interface
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Memória"];
    [self.navigationController setNavigationBarHidden:YES];
    
    mm = [[MemoriaManager alloc]init];
    selecionados = [[NSMutableArray alloc]init];
    arrayBotoes = [NSMutableArray arrayWithObjects: carta1,carta2,carta3,carta4,carta5,carta6,carta7,carta8,carta9,carta10,carta11,carta12,nil];
    
    imagem = [[UIImage alloc]init];
    NSString *img = @"card_cover.png";
    imagem = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:img ofType:nil]];
    
    parCont=0;
    volta=false;
    [pontuacao setText:@"Pontuação: 0"];
    
    estDesiste = false;
}

-(void)viewWillAppear:(BOOL)animated{
    [self preparaCartas];
    
    secondsLeft = 2;
    [self countdownTimer];
}

- (void)viewWillDisappear:(BOOL)animated{
    [UIView animateWithDuration:0.75
                     animations:^{
                         [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
                     }];
}

#pragma mark - Preparação
-(void)preparaCartas{
    NSArray *cartas = [NSArray arrayWithArray:mm.cartas];
    Carta *carta;
    UIButton *botao;
    
    for (int i=0; i<[arrayBotoes count]; i++) {
        carta = [cartas objectAtIndex:i];
        botao = [arrayBotoes objectAtIndex:i];
        
        [self preparaCarta:carta:botao];
    }
}

- (void)preparaCarta: (Carta *)carta : (UIButton *)botao{
    [botao setTitle:carta.texto forState:normal];
    [botao setBackgroundColor:[UIColor colorWithPatternImage:imagem]];
    [botao setTag:carta.tag];
    [botao setContentEdgeInsets:UIEdgeInsetsMake(0, 6.0f, 0, 6.0f)];
    [botao setTitleColor:[UIColor clearColor] forState:normal];
    
    UILabel *tituloBotao = botao.titleLabel;
    [self ajustesLabel:tituloBotao];

    botao.layer.borderWidth = 3.0;
    botao.layer.borderColor = [UIColor grayColor].CGColor;
}

- (void)ajustesLabel: (UILabel *)label{
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.numberOfLines = 5;
    label.minimumScaleFactor = 1./label.font.pointSize;
    label.adjustsFontSizeToFitWidth = YES;
}

-(UIColor *)corByTag: (int)tag{
    switch (tag) {
        case 0:
            return [UIColor colorWithRed:1 green:0 blue:1 alpha:1.0];
            break;
        case 1:
            return [UIColor colorWithRed:1 green:1 blue:0 alpha:1.0];
            break;
        case 2:
            return [UIColor whiteColor];
            break;
        case 3:
            return [UIColor greenColor];
            break;
        default:
            break;
    }
    return nil;
}

#pragma mark - Ação do botão
- (IBAction)botao:(UIButton *)sender {
    interativo = NO;
    [self interacao];
    [sender setBackgroundColor:[self corByTag:(int)sender.tag]];
    [UIView transitionWithView:sender duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                       } completion:^(BOOL finished){
                           if(finished){
                               [sender setTitleColor:[UIColor blackColor] forState:normal];
                               [self jogo:sender];
                           }
                       }];
}

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

#pragma mark - Jogo
- (void)jogo: (UIButton *)sender{
    if([selecionados count] == 0){
        [self alterarArrays:sender];
        [self interacao];
    }
    
    else{
        if([self verificaTag:sender]){
            [self alterarArrays:sender];
            if ([selecionados count] == 3){
                [self acerto];
            }
            [self interacao];
        }
        else{
            [self alterarArrays:sender];
            [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(retornaCartas) userInfo:nil repeats:NO];
        }
    }
}

- (void) alterarArrays: (UIButton *)sender {
    [selecionados addObject:sender];
    [arrayBotoes removeObject:sender];
    interativo = YES;
}

- (BOOL)verificaTag: (UIButton *)botao{
    UIButton *last = [selecionados lastObject];
    if(botao.tag == last.tag){
        return true;
    }
    else{
        return false;
    }
}

- (void)retornaCartas{
    
    for (UIButton *b in selecionados){
        [self animacaoErro:b];
        [arrayBotoes addObject: b];
    }
    
    [selecionados removeAllObjects];
    [self interacao];
}

- (void)acerto{
    for (UIButton *b in selecionados){
        [self animacaoAcerto:b];
    }
    
    [self alterarPontuacao];
    
    [selecionados removeAllObjects];
}

- (void)interacao{
    for(UIButton *b in arrayBotoes){
        [b setUserInteractionEnabled:interativo];
    }
}

- (void)alterarPontuacao{
    parCont++;
    mm.pontuacao += 10*secondsLeft;
    pontuacao.text = [NSString stringWithFormat:@"Pontuação: %d", mm.pontuacao];
    
    if (parCont == 4) {
        secondsLeft = 0;
    }
    
}

#pragma mark - Tempo (i.e. NSTimer)
-(void)countdownTimer{
    timer = [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(tempo:) userInfo:nil repeats:YES];
}

- (void) tempo: (id) sender{
    if(!estDesiste){
        
        if(secondsLeft > 0 ){
            secondsLeft -= 0.5;
            //        hours = secondsLeft / 3600;
            //        minutes = (secondsLeft % 3600) / 60;
            int seconds = secondsLeft;
            tempo.text = [NSString stringWithFormat:@"%d", seconds];
        }
        else{
            [self acabouTempo];
        }
    }
}

- (void) acabouTempo{
    [timer invalidate];
    UIAlertController *timerAlert;
    
    //A opção de salvar a pontuação apenas será mostrada caso o jogador tenha marcado pontos (i.e. pontos > 0).
    if (mm.pontuacao > 0) {
        //Perguntar se quer salvar dados
        timerAlert = [self fezPontos:timerAlert];
    } else {
        timerAlert = [self naoFezPontos:timerAlert];
    }
    
    //A view controller apresenta o alerta.
    [self presentViewController:timerAlert animated:YES completion:nil];
}

- (UIAlertController *)fezPontos: (UIAlertController *)timerAlert {
    //Se sim, cria um pontuação manager, seta pontuação atual e vai pra outra view.
    //Cria uma AlertController que gerencia o alerta.
    timerAlert = [UIAlertController alertControllerWithTitle:@"Fim do tempo!" message:[NSString stringWithFormat:@"Pontuação final: %d\nDeseja salvar sua pontuação?", mm.pontuacao] preferredStyle:UIAlertControllerStyleAlert];
    //Cria uma ação para quando o respectivo botão for pressionado. No caso, o botão "Sim".
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"Sim" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        PontuacaoManager *pontuacaoManager = [PontuacaoManager sharedInstance];
        [pontuacaoManager.pontuacaoAtual setPontos:mm.pontuacao];
        [pontuacaoManager.pontuacaoAtual setCategoria:@"Memória"];
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
    
    return timerAlert;
}

- (UIAlertController *)naoFezPontos: (UIAlertController *)timerAlert {
    timerAlert = [UIAlertController alertControllerWithTitle:@"Fim do tempo!" message:@"Você não marcou nenhum ponto...\nTentar novamente?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"Sim" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(retornaCartas) userInfo:nil repeats:NO];
        [NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(reload) userInfo:nil repeats:NO];
    }];
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"Não" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        volta=true;
        [self.navigationController popToRootViewControllerAnimated:NO];
    }];
    //Adiciona as ações ao alerta.
    [timerAlert addAction:yesAction];
    [timerAlert addAction:noAction];
    
    return timerAlert;
}

- (void)reload{
    [mm sortearNovamente];
    [self viewWillAppear:NO];
}

#pragma mark - Animações

- (void)animacaoErro: (UIButton *)botao{
    [botao setTitleColor:[UIColor clearColor] forState:normal];
    [botao setBackgroundColor:[UIColor colorWithPatternImage:imagem]];
    
    [UIView transitionWithView:botao duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
                       } completion:nil];
}

- (void)animacaoAcerto: (UIButton *)botao{
    [UIView beginAnimations:@"fadeInNewView" context:NULL];
    [UIView setAnimationDuration:1.0];
    botao.transform = CGAffineTransformMakeScale(1.8, 1.8);
    botao.alpha = 1.0f;
    [UIView commitAnimations];
    
    [UIView beginAnimations:@"fadeInNewView" context:NULL];
    [UIView setAnimationDuration:1.0];
    botao.transform = CGAffineTransformMakeScale(1,1);
    botao.alpha = 1.0f;
    botao.layer.borderWidth = 3.0;
    botao.layer.borderColor = [UIColor purpleColor].CGColor;
    [UIView commitAnimations];
}

@end
