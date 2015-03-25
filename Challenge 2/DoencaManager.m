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
                         [[Doenca alloc] initWithNome:@"Alzheimer" andCausa:@"Origem genética (hereditária)." andPrevencao:@"manter atividades intelectuais como  a leitura, jogos que exercitam o cérebro, tais como palavras cruzadas, assim como exercer alguma atividade física." andDescricao:@"Doença crônica que atinge, principalmente, a população idosa. Trata-se de uma forma de demência que afeta a memória, as funções cognitivas e a capacidade de realizações de tarefas dos seus portadores. Caracteriza-se por uma perda de neurônios colinérgicos , o que reduz o número de conexões cerebrais." andSintomas:@[@"Perda de memória", @"Perda de orientação espacial", @"Perda da capacidade de fala e escrita."] andImagens:@[]],
                         [[Doenca alloc] initWithNome:@"Apendicite" andCausa: @"Ocorre quando o apêndice vermiforme do intestino fica bloqueado pela acumulação de material alimentar e bactérias." andPrevencao:@"" andDescricao: @"A apendicite é uma inflamação dolorosa e perigosa, se não tratada a tempo. Ela é uma emergência médica, da qual se não for tratada pode causar peritonite (infecção generalizada da cavidade abdominal), uma vez que o apêndice inflamado pode estourar e bloquear o intestino. A peritonite pode ser fatal." andSintomas:@[@"Dor de barriga", @"Diarréia", @"Prisão de ventre."] andImagens:@[]],
                         [[Doenca alloc] initWithNome:@"Conjuntivite" andCausa:@"Viral, bacteriana, (fungo), (protozoário), alérgica e traumática." andPrevencao:@"Evitar contato com pessoas contaminadas" andDescricao:@"A conjuntivite é uma inflamação da conjuntiva (última membrana mucosa que cobre a superfície interior da pálpebra e a superfície anterior do olho). A conjuntiva na realidade cobre o branco do olho ou esclera." andSintomas:@[@"Olhos vermelhos", @"Leve ardência nos olhos", @"Secreção amarelada nos olhos."] andImagens:@[]],
                         [[Doenca alloc] initWithNome:@"Malária" andCausa:@"Parasita." andPrevencao:@"Repelentes, mosquiteiros, ingerir vitamina B1." andDescricao:@"A malária é uma doença infecciosa causada por um parasita o Plasmodium. Este último é transmitido aos seres humanos através da picada de um mosquito fêmea, o Anopheles." andSintomas:@[@"Febre alta," @"Dores musculares", @"Fadiga intensa."] andImagens:@[]],
                         [[Doenca alloc]initWithNome:@"Meningite" andCausa:@"Virais e bacterianas." andPrevencao:@"Vacina" andDescricao:@"A meningite é uma inflamação das meninges, ou seja, as membranas que recobrem o cérebro. Esta inflamação que começa nas meninges, pode se espalhar por todo o sistema nervoso e até mesmo resultar em casos de graves complicações por todo o corpo." andSintomas:@[@"Dor de cabeça", @"Febre alta", @"Rigidez na nuca"] andImagens:@[]],
                         [[Doenca alloc] initWithNome:@"Tétano" andCausa:@"bactéria (tal penetra no corpo humano através de lesões)" andPrevencao:@"Vacina." andDescricao: @"O tétano é uma doença infecciosa causada por uma bactéria (Clostridium Botulinum) da qual produz uma toxina que ataca o sistema imunológico causando uma desordem do sistema nervoso, caraterizada por espasmos musculares e paralisia." andSintomas:@[@"Incapacidade de comer e falar", @"Irritabilidade", @"Inquietação sudorese e taquicardia."] andImagens:@[]],
                         [[Doenca alloc] initWithNome:@"Aids" andCausa:@"Vírus HIV" andPrevencao:@"Preservativos" andDescricao:@"A aids é uma doença que ataca o sistema imunológico destruindo os glóbulos brancos e consequentemente diminuindo a capacidade do organismo de se defender contra doenças. Os sintomas podem mudar dependendo do nível de infecção do vírus, variando de simples dores de cabeça a manchas na pele, perda de peso, náuseas e vômitos. O HIV pode ser transmitido pelo sangue, esperma e secreção vaginal, pelo leite materno, ou transfusão de sangue contaminado. O portador do HIV pode transmitir o vírus mesmo sem apresentar os sintomas da Aids, por isso, é importante o uso de preservativo em todas as relações sexuais." andSintomas:@[@"Febre", @"Diarréia", @"Fraqueza"] andImagens:@[]],
                         [[Doenca alloc] initWithNome:@"Catapora" andCausa:@"Vírus varicela-zóster" andPrevencao:@"Vacina tetra viral e vacina contra varicela." andDescricao:@"A catapora, também conhecida como varicela, é causada pelo vírus varicela-zóster e é uma das doenças mais comuns na infância por ser altamente contagiosa para aqueles que nunca tiveram a doença ou não foram vacinados. Normalmente é transmitida através de tosses e espirros ou por meio do contato com o liquido das bolhas e erupções que se manifestam no corpo durante a infecção. A catapora é uma doença transmitida pelo ar e é altamente contagiosa antes mesmo de aparecerem os sintomas característicos, o que torna sua prevenção difícil. No entanto, a vacina tetra viral e a vacina contra varicela fazem parte da rotina de imunização." andSintomas:@[@"Febre", @"Dor de cabeça", @"Bolhas avermelhadas na pele"] andImagens:@[]],
                         [[Doenca alloc] initWithNome:@"Pneumonia" andCausa:@"Infecção ou irritação no espaço alveolar" andPrevencao:@"Vacina e higiene constante" andDescricao:@"Pneumonia é uma infecção que se instala nos pulmões, provocada pela penetração de um agente infeccioso ou irritante (bactérias, vírus, fungos e por reações alérgicas) no espaço alveolar, onde ocorre a troca gasosa. Os agentes infecciosos da pneumonia não costumam ser transmitidos facilmente. As vacinas podem ajudar a prevenir a pneumonia em crianças, idosos ou pessoas com diabetes, asma, enfisema, HIV, câncer ou outras condições com efeitos a longo prazo." andSintomas:@[@"Falta de ar", @"Febre alta", @"Dor no tórax"] andImagens:@[]]
                          ];
    }
    return self;
}

- (NSArray *) nomeDoenca{
    return _doencas;
}

@end
