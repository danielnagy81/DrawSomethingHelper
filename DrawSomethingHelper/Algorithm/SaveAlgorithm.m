//
//  Algorithm.m
//  WordSolver
//
//  Created by Daniel_Nagy on 12/09/14.
//  Copyright (c) 2014 NDani. All rights reserved.
//

#import "SaveAlgorithm.h"

@implementation SaveAlgorithm {
    
    NSMutableArray *_wordsToProcess;
}

- (instancetype)init {
    return [self initWithProcessedWords:[NSDictionary dictionary]];
}

- (instancetype)initWithProcessedWords:(NSDictionary *)processedWords {
    self = [super initWithProcessedWords:processedWords];
    if (self) {
        _processedWords = [NSMutableDictionary dictionaryWithDictionary:processedWords];
        _wordsToProcess = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addWord:(NSString *)word {
    
    [_wordsToProcess addObject:word];
}

- (void)addWords:(NSArray *)words {

    if (_wordsToProcess.count > 0) {
        
        for (NSInteger index = 0; index < words.count; ++index) {
            [_wordsToProcess addObject:words[index]];
        }
    }
    else {
        _wordsToProcess = [NSMutableArray arrayWithArray:words];
    }
}

- (void)startAlgorithm {
    
    for (NSInteger wordIndex = 0; wordIndex < _wordsToProcess.count; ++wordIndex) {
        NSString *wordToProcess = [_wordsToProcess[wordIndex] lowercaseString];;
        NSString *keyword =[self createKeyWithWord:wordToProcess];
        [self saveWord:wordToProcess toKey:keyword];
    }
}

- (void)saveWord:(NSString *)word toKey:(NSString *)key {
    
    BOOL isKeyAlreadyExists = [_processedWords objectForKey:key] ? YES : NO;
    
    if (isKeyAlreadyExists) {
        [self addWord:word toExistingKey:key];
    }
    else {
        NSMutableArray *words = [[NSMutableArray alloc] initWithObjects:word, nil];
        [_processedWords setObject:words forKey:key];
    }
}

- (void)addWord:(NSString *)word toExistingKey:(NSString *)key {
    
    NSMutableArray *words = [_processedWords objectForKey:key];
    
    if (![words containsObject:word]) {
        [words addObject:word];
        [_processedWords setObject:words forKey:key];
    }
}

- (NSDictionary *)results {
    
    return _processedWords;
}

@end
