//
//  Pergunta.h
//  Challenge 2
//
//  Created by Lucas Leal Mendonça on 25/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Pergunta : NSManagedObject

@property (nonatomic, retain) NSString * pergunta;
@property (nonatomic, retain) NSString * correto;
@property (nonatomic, retain) NSSet *alternativas;

//-(id) init:(NSString *)p withAlternativas: (NSArray *)a;
-(NSMutableArray *) getAlternativasMA;

@end


@interface Pergunta (CoreDataGeneratedAccessors)

- (void)addAlternativasObject:(NSManagedObject *)value;
- (void)removeAlternativasObject:(NSManagedObject *)value;
- (void)addAlternativas:(NSSet *)values;
- (void)removeAlternativas:(NSSet *)values;

@end