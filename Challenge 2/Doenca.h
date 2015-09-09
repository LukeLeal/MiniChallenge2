//
//  Doenca.h
//  Challenge 2
//
//  Created by Samuel Shin Kim on 24/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "DataManager.h"
#import "Sintoma.h"


@interface Doenca : NSManagedObject

@property (nonatomic, retain) NSString *nome;
@property (nonatomic, retain) NSString *prevencao;
@property (nonatomic, retain) NSString *causa;
@property (nonatomic, retain) NSString *imagem;
@property (nonatomic, retain) NSString *descricao;
@property (nonatomic, retain) NSSet *sintomas;

-(NSComparisonResult)localizedCaseInsensitiveCompare:(Doenca *)outro;
@end

@interface Doenca (CoreDataGeneratedAccessors)

- (void)addSintomasObject:(NSManagedObject *)value;
- (void)removeSintomasObject:(NSManagedObject *)value;
- (void)addSintomas:(NSSet *)values;
- (void)removeSintomas:(NSSet *)values;

@end

