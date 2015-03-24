//
//  DoencaManager.m
//  Challenge 2
//
//  Created by Samuel Shin Kim on 24/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "DoencaManager.h"
#import "Doenca.h"

@implementation DoencaManager

static DoencaManager *singleton;
static bool isFirstAccess = YES;

#pragma mark - Doença

+ (id)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        singleton = [[super allocWithZone:NULL] init];
    });
    return singleton;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.doencas = @[
                         [[Doenca alloc] initWithNome:@"Gripe" andCausa:@"Vírus influenza" andPrevencao:@"Vacina da gripe" andDescricao:@"Também conhecida como influenza, a gripe é uma infecção do sistema respiratório causada pelo vírus influenza. Seus sintomas geralmente aparecem de forma repentina e geralmente envolvem febre, vermelhidão no rosto, dores no corpo e cansaço. A vacina da gripe é a melhor maneira de evitar a gripe e suas complicações. Todos os anos, é necessário receber uma nova dose, já que a sua composição é alterada de acordo com o tipo de vírus mais provável de se disseminar. A vacina da gripe previne aproximadamente 70-90% dos casos de gripe, mas não protege contra outras infecções respiratórias, como o resfriado." andSintomas:@[@"Febre", @"Tosse", @"Dor muscular"] andImagens:@[]],
                         [[Doenca alloc] initWithNome:@"Alzheimer" andCausa:@"Origem genética (hereditária)." andPrevencao:@"manter atividades intelectuais como  a leitura, jogos que exercitam o cérebro, tais como palavras cruzadas, assim como exercer alguma atividade física." andDescricao: @"Doença crônica que atinge, principalmente, a população idosa. Trata-se de uma forma de demência que afeta a memória, as funções cognitivas e a capacidade de realizações de tarefas dos seus portadores. Caracteriza-se por uma perda de neurônios colinérgicos , o que reduz o número de conexões cerebrais." andSintomas: @"Perda de memória, de orientação espacial, de falar e escrita." andImagens:@[]],
                         [[Doenca alloc] initWithNome:@"Apendicite" andCausa: @"Ocorre quando o apêndice vermiforme do intestino fica bloqueado pela acumulação de material alimentar e bactérias." andPrevencao:@"" andDescricao: @"A apendicite é uma inflamação dolorosa e perigosa, se não tratada a tempo. Ela é uma emergência médica, da qual se não for tratada pode causar peritonite (infecção generalizada da cavidade abdominal), uma vez que o apêndice inflamado pode estourar e bloquear o intestino. A peritonite pode ser fatal." andSintomas: @"Dor na barriga, febre moderada, doenças gastrointestinais(diarreia ou prisão de ventre)." andImagens:@[]],
                         [[Doenca alloc] initWithNome:@"Conjuntivite" andCausa:@"Viral, bacteriana, (fungo), (protozoário), alérgica e traumática." andPrevencao:@"Evitar contato com pessoas contaminadas" andDescricao: @"A conjuntivite é uma inflamação da conjuntiva (última membrana mucosa que cobre a superfície interior da pálpebra e a superfície anterior do olho). A conjuntiva na realidade cobre o branco do olho ou esclera." andSintomas: @"Olhos vermelhos, leve ardência, secreção amarelada (cílios colados como consequência)." andImagens:@[]],
                         [[Doenca alloc] initWithNome:@"Malária" andCausa:@"Parasita." andPrevencao:@"Repelentes, mosquiteiros, ingerir vitamina B1." andDescricao: @"A malária é uma doença infecciosa causada por um parasita o Plasmodium. Este último é transmitido aos seres humanos através da picada de um mosquito fêmea, o Anopheles." andSintomas: @"Febre alta, dores musculares, fadiga intensa." andImagens:@[]],
                         [[Doenca alloc]initWithNome:@"Meningite" andCausa:@"Virais e bacterianas." andPrevencao:@"Vacina" andDescricao:@"A meningite é uma inflamação das meninges, ou seja, as membranas que recobrem o cérebro. Esta inflamação que começa nas meninges, pode se espalhar por todo o sistema nervoso e até mesmo resultar em casos de graves complicações por todo o corpo." andSintomas:@"Dor de cabeça, febre alta, rigidez na nuca e às vezes, erupções cutâneas de cor avermelhada." andImagens:@[]],
                         [[Doenca alloc] initWithNome:@"Tétano" andCausa:@"bactéria (tal penetra no corpo humano através de lesões)" andPrevencao:@"Vacina." andDescricao: @"O tétano é uma doença infecciosa causada por uma bactéria (Clostridium Botulinum) da qual produz uma toxina que ataca o sistema imunológico causando uma desordem do sistema nervoso, caraterizada por espasmos musculares e paralisia." andSintomas:@"Contratura da mandíbula (trismo), com uma incapacidade para comer e falar, irritabilidade, inquietação sudorese e taquicardia." andImagens:@[]]
        
                          ];
    }
    return self;
}

@end
