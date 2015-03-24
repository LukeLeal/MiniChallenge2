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
                         [[Doenca alloc] initWithNome:<#(NSString *)#> andCausa:<#(NSString *)#> andPrevencao:<#(NSString *)#> andDescricao:<#(NSString *)#> andSintomas:<#(NSArray *)#> andImagens:<#(NSArray *)#>],
                         ];
    }
    return self;
}

@end
