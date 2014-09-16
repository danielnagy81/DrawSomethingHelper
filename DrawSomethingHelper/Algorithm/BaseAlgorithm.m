//
//  BaseAlgorithm.m
//  WordSolver
//
//  Created by Daniel_Nagy on 12/09/14.
//  Copyright (c) 2014 NDani. All rights reserved.
//

#import "BaseAlgorithm.h"

@implementation BaseAlgorithm 

- (instancetype)init {
    self = [super init];
    if (self) {
        _processedWords = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (instancetype)initWithProcessedWords:(NSDictionary *)processedWords {
    self = [super init];
    if (self) {
        _processedWords = [NSMutableDictionary dictionaryWithDictionary:processedWords];
    }
    return self;
}

- (NSString *)createKeyWithWord:(NSString *)word {
    
    NSArray *characters = [self createCharacterArrayFromWord:word];
    NSArray *sortedCharacters = [characters sortedArrayUsingComparator:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
        return [obj1 compare:obj2];
    }];
    NSString *keyword = [self createStringWithCharacters:sortedCharacters];
    return keyword;
}

- (NSArray *)createCharacterArrayFromWord:(NSString *)word {
    
    NSString *lowercaseWord = [word lowercaseString];
    NSMutableArray *characters = [[NSMutableArray alloc] initWithCapacity:lowercaseWord.length];
    
    for (NSInteger index = 0; index < lowercaseWord.length; ++index) {
        unichar characterCode = [lowercaseWord characterAtIndex:index];
        NSNumber *numberObjectOfCharacter = [NSNumber numberWithUnsignedShort:characterCode];
        [characters addObject:numberObjectOfCharacter];
    }
    return characters;
}

- (NSString *)createStringWithCharacters:(NSArray *)characters {
    
    NSMutableString *processedString = [[NSMutableString alloc] initWithCapacity:characters.count];
    
    for (NSInteger index = 0; index < characters.count; ++index) {
        NSNumber *numberObject = characters[index];
        unichar characterCode = [numberObject unsignedShortValue];
        NSString *character = [[NSString alloc] initWithCharacters:&characterCode length:1];
        [processedString appendString:character];
    }
    return processedString;
}

@end
