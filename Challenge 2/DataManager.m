//
//  DataManager.m
//  Challenge 2
//
//  Created by Lucas Leal Mendonça on 01/04/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

static DataManager *singleton;
static bool isFirstAccess = YES;

#pragma mark - DataManager

+ (id)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        singleton = [[super allocWithZone:NULL] init];
    });
    return singleton;
}

//Deve ser executado apenas na primeira execução do aplicativo no device.
-(void)iniciaDados{
    //Script de doença
    NSArray *doencas = @[
                         [[DoencaBeta alloc] initWithNome:@"Aids" andCausa:@"Vírus HIV" andPrevencao:@"Preservativos" andDescricao:@"A aids é uma doença que ataca o sistema imunológico destruindo os glóbulos brancos e consequentemente diminuindo a capacidade do organismo de se defender contra doenças. Os sintomas podem mudar dependendo do nível de infecção do vírus, variando de simples dores de cabeça a manchas na pele, perda de peso, náuseas e vômitos. O HIV pode ser transmitido pelo sangue, esperma e secreção vaginal, pelo leite materno, ou transfusão de sangue contaminado. O portador do HIV pode transmitir o vírus mesmo sem apresentar os sintomas da Aids, por isso, é importante o uso de preservativo em todas as relações sexuais." andSintomas:@[@"Febre", @"Diarréia", @"Fraqueza"] andImagem:@"aids.png"],
                         [[DoencaBeta alloc] initWithNome:@"Alzheimer" andCausa:@"Origem genética (hereditária)." andPrevencao:@"manter atividades intelectuais como  a leitura, jogos que exercitam o cérebro, tais como palavras cruzadas, assim como exercer alguma atividade física." andDescricao:@"Doença crônica que atinge, principalmente, a população idosa. Trata-se de uma forma de demência que afeta a memória, as funções cognitivas e a capacidade de realizações de tarefas dos seus portadores. Caracteriza-se por uma perda de neurônios colinérgicos , o que reduz o número de conexões cerebrais." andSintomas:@[@"Perda de memória", @"Perda de orientação espacial", @"Perda da capacidade de fala e escrita."] andImagem:@"alzheimer.png"],
                         [[DoencaBeta alloc] initWithNome:@"Apendicite" andCausa: @"Ocorre quando o apêndice vermiforme do intestino fica bloqueado pela acumulação de material alimentar e bactérias." andPrevencao:@"" andDescricao: @"A apendicite é uma inflamação dolorosa e perigosa, se não tratada a tempo. Ela é uma emergência médica, da qual se não for tratada pode causar peritonite (infecção generalizada da cavidade abdominal), uma vez que o apêndice inflamado pode estourar e bloquear o intestino. A peritonite pode ser fatal." andSintomas:@[@"Dor de barriga", @"Diarréia", @"Prisão de ventre."] andImagem:@"apendicite.png"],
                         [[DoencaBeta alloc] initWithNome:@"Bronquite Crônica" andCausa:@"Consumo de tabáco e poluição do ar" andPrevencao:@"Umidificar quartos e minimizar a exposição à fumaça do tabaco" andDescricao:@"Esta doença é definida quando há presença de tosse com muco (catarro) na maioria dos dias do mês, em 3 meses do ano, por dois anos sucessivos, sem outra doença que explique a tosse. Quase todos os casos da doença ocorrem pelo efeito nocivo do fumo nos pulmões por vários anos, o que determina uma inflamação da mucosa dos brônquios (tubos que espalham o ar dentro dos pulmões). A bronquite crônica pode preceder ou acompanhar o enfisema. Ela afeta pessoas de todas as idades, mas, geralmente, aquelas com mais de 45 anos." andSintomas:@[@"Tosse com presença de muco", @"Ronco ou chiado no peito", @"Fadiga"] andImagem:@""],
                         [[DoencaBeta alloc] initWithNome:@"Catapora" andCausa:@"Vírus varicela-zóster" andPrevencao:@"Vacina tetra viral e vacina contra varicela." andDescricao:@"A catapora, também conhecida como varicela, é causada pelo vírus varicela-zóster e é uma das doenças mais comuns na infância por ser altamente contagiosa para aqueles que nunca tiveram a doença ou não foram vacinados. Normalmente é transmitida através de tosses e espirros ou por meio do contato com o liquido das bolhas e erupções que se manifestam no corpo durante a infecção. A catapora é uma doença transmitida pelo ar e é altamente contagiosa antes mesmo de aparecerem os sintomas característicos, o que torna sua prevenção difícil. No entanto, a vacina tetra viral e a vacina contra varicela fazem parte da rotina de imunização." andSintomas:@[@"Febre", @"Dor de cabeça", @"Bolhas avermelhadas na pele"] andImagem:@"catapora1.png"],
                         [[DoencaBeta alloc] initWithNome:@"Conjuntivite" andCausa:@"Viral, bacteriana, (fungo), (protozoário), alérgica e traumática." andPrevencao:@"Evitar contato com pessoas contaminadas" andDescricao:@"A conjuntivite é uma inflamação da conjuntiva (última membrana mucosa que cobre a superfície interior da pálpebra e a superfície anterior do olho). A conjuntiva na realidade cobre o branco do olho ou esclera." andSintomas:@[@"Olhos vermelhos", @"Leve ardência nos olhos", @"Secreção amarelada nos olhos."] andImagem:@"conjuntivite.png"],
                         [[DoencaBeta alloc] initWithNome:@"Gripe" andCausa:@"Vírus influenza" andPrevencao:@"Vacina da gripe" andDescricao:@"Também conhecida como influenza, a gripe é uma infecção do sistema respiratório causada pelo vírus influenza. Seus sintomas geralmente aparecem de forma repentina e geralmente envolvem febre, vermelhidão no rosto, dores no corpo e cansaço. A vacina da gripe é a melhor maneira de evitar a gripe e suas complicações. Todos os anos, é necessário receber uma nova dose, já que a sua composição é alterada de acordo com o tipo de vírus mais provável de se disseminar. A vacina da gripe previne aproximadamente 70-90% dos casos de gripe, mas não protege contra outras infecções respiratórias, como o resfriado." andSintomas:@[@"Febre", @"Tosse", @"Dor muscular"] andImagem:@"gripe.png"],
                         [[DoencaBeta alloc] initWithNome:@"Hérnia de Disco" andCausa:@"Envelhecimento e desgaste excessivo dos discos vertebrais." andPrevencao:@"Evitar forçar a coluna, realizar aquecimentos e alongamentos antes de esforços com a coluna." andDescricao:@"A hérnia de disco é uma doença causada por lesões dos discos que compõem a coluna vertebral. Estes ficam entre as vértebras, e servem para amortecer choques." andSintomas:@[@"Fraqueza", @"Dificuldade de mobilidade", @"Dor na área afetada", @"Rigidez na área afetada"] andImagem:@""],
                         [[DoencaBeta alloc] initWithNome:@"Hipertensão" andCausa:@"Má alimentação, obesidade, estresse, etc." andPrevencao:@"Alimentação saudável, reduzir consumo de bebidas alcoolicas e ingestão de sal." andDescricao:@"A hipertensão arterial, ou pressão alta, é uma doença assintomática que atinge grande parte das pessoas. No Brasil, estima-se que 30-35% da população acima dos 40 anos sofra dessa doença, de acordo com dados do IBGE. Por definição, a pressão alta caracteriza-se por uma pressão do sangue maior ou igual a 140/90 mmHg ou, 14 por 9. No entanto, de acordo com as orientações européias publicadas em outubro de 2013, acima dos 80 anos fala-se de hipertensão quando a pressão sistólica é superior a 150 mmHg e a diastólica acima de 85 mmHg." andSintomas:@[@"Dores de cabeça", @"Palpitações", @"Tonturas"] andImagem:@""],
                         [[DoencaBeta alloc] initWithNome:@"Malária" andCausa:@"Parasita." andPrevencao:@"Repelentes, mosquiteiros, ingerir vitamina B1." andDescricao:@"A malária é uma doença infecciosa causada por um parasita o Plasmodium. Este último é transmitido aos seres humanos através da picada de um mosquito fêmea, o Anopheles." andSintomas:@[@"Febre alta", @"Dores musculares", @"Fadiga intensa."] andImagem:@"malaria.png"],
                         [[DoencaBeta alloc]initWithNome:@"Meningite" andCausa:@"Virais e bacterianas." andPrevencao:@"Vacina" andDescricao:@"A meningite é uma inflamação das meninges, ou seja, as membranas que recobrem o cérebro. Esta inflamação que começa nas meninges, pode se espalhar por todo o sistema nervoso e até mesmo resultar em casos de graves complicações por todo o corpo." andSintomas:@[@"Dor de cabeça", @"Febre alta", @"Rigidez na nuca"] andImagem:@"meningite.png"],
                         [[DoencaBeta alloc] initWithNome:@"Oestoporose" andCausa:@"Problemas hormonais, deficiência de cálcio e vitamina D, excesso de peso." andPrevencao:@"Reposição hormonal, consumo de cálcio e vitamina D, prática de exercícios físicos." andDescricao:@"A osteoporose é uma doença que reduz a densidade e massa dos ossos, tornando-os frágeis e consequentemente sucessíveis a fraturas. Afeta principalmente as pessoas mais velhas." andSintomas:@[@"Fraturas nos ossos", @"Fragilidade nos ossos"] andImagem:@""],
                         [[DoencaBeta alloc] initWithNome:@"Pneumonia" andCausa:@"Infecção ou irritação no espaço alveolar" andPrevencao:@"Vacina e higiene constante" andDescricao:@"Pneumonia é uma infecção que se instala nos pulmões, provocada pela penetração de um agente infeccioso ou irritante (bactérias, vírus, fungos e por reações alérgicas) no espaço alveolar, onde ocorre a troca gasosa. Os agentes infecciosos da pneumonia não costumam ser transmitidos facilmente. As vacinas podem ajudar a prevenir a pneumonia em crianças, idosos ou pessoas com diabetes, asma, enfisema, HIV, câncer ou outras condições com efeitos a longo prazo." andSintomas:@[@"Falta de ar", @"Febre alta", @"Dor no tórax"] andImagem:@"pneumonia.png"],
                         [[DoencaBeta alloc] initWithNome:@"Tétano" andCausa:@"bactéria (tal penetra no corpo humano através de lesões)" andPrevencao:@"Vacina." andDescricao: @"O tétano é uma doença infecciosa causada por uma bactéria (Clostridium Botulinum) da qual produz uma toxina que ataca o sistema imunológico causando uma desordem do sistema nervoso, caraterizada por espasmos musculares e paralisia." andSintomas:@[@"Incapacidade de comer e falar", @"Irritabilidade", @"Inquietação sudorese e taquicardia."] andImagem:@"tetano.png"],
                         ];
    
    //Vai inserindo cada doença da array no banco
    for (DoencaBeta *d in doencas) {
        Doenca *bd = [NSEntityDescription insertNewObjectForEntityForName:@"Doenca" inManagedObjectContext: self.context];
        bd.nome = [d nome];
        bd.causa = [d causa];
        bd.prevencao = [d prevencao];
        bd.descricao = [d descricao];
                for (int i = 0; i < [[d sintomas] count]; i++) {
                    Sintoma *sintoma = [NSEntityDescription insertNewObjectForEntityForName:@"Sintoma" inManagedObjectContext:self.context];
                    [sintoma setValue: [[d sintomas] objectAtIndex:i] forKey:@"texto"];
                    [[bd mutableSetValueForKey:@"sintomas"] addObject:sintoma];
                }
        //bd.sintomas = [NSSet setWithArray: [d sintomas]];
        bd.imagem = [d imagem];
    }
    
    
//    Script Perguntas
    NSArray *perguntas = @[
       [[PerguntaBeta alloc] init:@"Quais destes são sintomas da pneumonia?" withAlternativas:@[@"Falta de ar e bolhas avermelhadas na pele", @"Ardência nos olhos e rigidez na nuca", @"Febre alta e dor no tórax"]],
       [[PerguntaBeta alloc] init:@"Como a aids ataca o corpo humano?" withAlternativas:@[@"Atacando o sistema imunológico e destruindo os glóbulos brancos", @"Inflamando as meninges, membranas que recobrem o cérebro", @"Infeccionando a cavidade abdominal"]],
       [[PerguntaBeta alloc] init:@"Qual destas é uma medida contra a meningite?" withAlternativas:@[@"Vacina", @"Remoção da apêndice", @"Limpar frequentemente as mãos"]],
       [[PerguntaBeta alloc] init:@"Qual destas doenças pode infectar alguém por uma lesão na pele?" withAlternativas:@[@"Tétano", @"Alzheimer", @"Apendicite"]],
       [[PerguntaBeta alloc] init:@"Qual o nome dos tubos cujo a mucosa inflama quando há um caso de bronquite crônica?" withAlternativas:@[@"Bronquios", @"Bronquiolos", @"Artérias"]],
       [[PerguntaBeta alloc] init:@"Quais dessas são possíveis causas da hipertensão?" withAlternativas:@[@"Estresse e obesidade", @"Obesidade e deficiência de cálcio", @"Lesões no corpo e parasitas"]],
       [[PerguntaBeta alloc] init:@"Qual parte do corpo é afetada quando uma pessoa possui alzhaimer?" withAlternativas:@[@"Cérebro", @"Pulmão", @"Coração"]],
       [[PerguntaBeta alloc] init:@"Qual o principal sintoma da osteoporose?" withAlternativas:@[@"Fragilidade nos ossos", @"Bolhas avermelhadas na pele", @"Prisão de ventre"]],
       [[PerguntaBeta alloc] init:@"A aids é uma doença que afeta qual sistema?" withAlternativas:@[@"Sistema imunológico", @"Sistema muscular", @"Sistema nervoso"]],
                           ];
//    //[[PerguntaBeta alloc] init:@"" withAlternativas:@[@"", @"", @""]];
//    
    //Vai inserindo cada pergunta da array no banco
    for (PerguntaBeta *p in perguntas) {
        Pergunta *bd = [NSEntityDescription insertNewObjectForEntityForName:@"Pergunta" inManagedObjectContext: self.context];
        bd.pergunta = [p pergunta];
        bd.correto = [p correto];
        for (int i = 0; i < [[p alternativas] count]; i++) {
            Alternativa *alternativa = [NSEntityDescription insertNewObjectForEntityForName:@"Alternativa" inManagedObjectContext:self.context];
            [alternativa setValue: [[p alternativas] objectAtIndex:i] forKey:@"texto"];
            [[bd mutableSetValueForKey:@"alternativas"] addObject:alternativa];
        }
    }
}

-(void) inserePontuacao: (PontuacaoBeta *)p{
    Pontuacao *pontuacao = [NSEntityDescription insertNewObjectForEntityForName:@"Pontuacao" inManagedObjectContext: self.context];
    pontuacao.foto = p.foto;
    pontuacao.nome = p.nome;
    //Por algum motivo, deu crash por bad access nisso aqui uma hora. Executei outra vez e tava normal. wtf
    pontuacao.pontos = [NSNumber numberWithInt: p.pontos];
    pontuacao.cod = [NSNumber numberWithInt: [self maiorCod]];
    pontuacao.categoria = p.categoria;
}

-(NSArray *) busca: (NSString *)entidade{
    //"Tratamento" de erro
    NSError *error;
    if (![self.context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    
    //"Realizador da busca"
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    //Define qual entidade será buscada no banco
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:entidade inManagedObjectContext:self.context];
    
    [fetchRequest setEntity:entity];
    //[fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"name == %@", @"Teste Muitos"]];
    
    //Array dos objetos buscados
    NSArray *fetchedObjects = [self.context executeFetchRequest:fetchRequest error:&error];
    return fetchedObjects;
}

-(NSArray *) busca: (NSString *)entidade withPredicado: (NSString *)predicado{
    //"Tratamento" de erro
    NSError *error;
    if (![self.context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    
    //"Realizador da busca"
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    //Define qual entidade será buscada no banco
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:entidade inManagedObjectContext:self.context];
    
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"name == %@", predicado]];
    //[fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"name == %@", @"Teste Muitos"]];
    
    //Array dos objetos buscados
    NSArray *fetchedObjects = [self.context executeFetchRequest:fetchRequest error:&error];
    return fetchedObjects;
}

-(int) maiorCod {
    NSError *error;
    if (![self.context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    
    //"Realizador da busca"
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    //Define qual entidade será buscada no banco
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Pontuacao" inManagedObjectContext:self.context];
    [fetchRequest setEntity:entity];

    fetchRequest.fetchLimit = 1;
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"cod" ascending:NO]];
    Pontuacao *p = [self.context executeFetchRequest:fetchRequest error:nil].lastObject;
    if (!p) {
        return 1;
    } else {
        return [[p cod] intValue] + 1;
    }
    
}

-(void) deleta: (NSString *)entidade withPredicado: (NSNumber *)predicado{
    //Deleta uma entidade de acordo com seu código
    
    NSError *error;
    if (![self.context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:entidade inManagedObjectContext:self.context];
    
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"cod == %d", [predicado intValue]]];
    NSManagedObject *obj = [self.context executeFetchRequest:fetchRequest error:&error].lastObject;
    [self.context deleteObject:obj];
}


@end
