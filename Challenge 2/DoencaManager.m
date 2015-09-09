//
//  DoencaManager.m
//  Challenge 2
//
//  Created by Samuel Shin Kim on 24/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "DoencaManager.h"


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
        _doencas = [NSMutableArray arrayWithArray:[[DataManager sharedInstance] busca:@"Doenca"]];
        [_doencas sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        
    }
    return self;
}

- (NSArray *) nomeDoenca{
    return _doencas;
}

/*
 http://www.abcdasaude.com.br/
 http://www.criasaude.com.br/
 http://www.minhavida.com.br/saude/temas/bronquite
*/
@end
