//
//  SearchAlgorithm.m
//  WordSolver
//
//  Created by Daniel_Nagy on 12/09/14.
//  Copyright (c) 2014 NDani. All rights reserved.
//

#import "SearchAlgorithm.h"
#import "SearchResult.h"

@implementation SearchAlgorithm

- (NSArray *)searchWithCharacters:(NSString *)characters withTargetWordLength:(NSInteger)targetLength {
    
    NSMutableArray *searchResults = [[NSMutableArray alloc] init];
    NSArray *matchingKeys = [self keysThatFoundInCharacters:characters withTargetWordLength:targetLength];
    
    for (NSInteger index = 0; index < matchingKeys.count; ++index) {
        SearchResult *searchResult = matchingKeys[index];
        [self loadSearchResults:searchResults withSearchResult:searchResult];
    }
    return searchResults;
}

- (NSArray *)keysThatFoundInCharacters:(NSString *)characters withTargetWordLength:(NSInteger)targetLength {
    
    NSArray *searchKeyNumbers = [self createCharacterArrayFromWord:characters];
    NSArray *sortedSearchKeyNumber = [searchKeyNumbers sortedArrayUsingComparator:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
        return [obj1 compare:obj2];
    }];
    NSArray *keys = [_processedWords allKeys];
    NSMutableArray *foundKeys = [[NSMutableArray alloc] init];
    
    for (NSInteger index = 0; index < keys.count; ++index) {
        NSString *existingKey = keys[index];
        BOOL shouldCheckIdentity = characters.length >= existingKey.length && existingKey.length == targetLength;
        
        if (shouldCheckIdentity) {
            NSArray *existingKeyNumbers = [self createCharacterArrayFromWord:existingKey];
            double identity = [self identityOfSearchKeyNumbers:sortedSearchKeyNumber andExistingKeyNumbers:existingKeyNumbers];
            
            if (identity > 0.0) {
                SearchResult *searchResult = [[SearchResult alloc] initWithKey:existingKey withRank:[NSNumber numberWithDouble:identity]];
                [foundKeys addObject:searchResult];
            }
        }
    }
    NSArray *rankedKeys = [foundKeys sortedArrayUsingComparator:^NSComparisonResult(SearchResult *obj1, SearchResult *obj2) {
        return [obj2.rank compare:obj1.rank];
    }];
    return rankedKeys;
}

- (void)loadSearchResults:(NSMutableArray *)searchResults withSearchResult:(SearchResult *)searchResult {
    
    id currentElement = [_processedWords objectForKey:searchResult.key];
    BOOL isIteratedObjectAnArray = [currentElement isKindOfClass:[NSArray class]];
    
    if (isIteratedObjectAnArray) {
        
        for (NSInteger indexOfArray = 0; indexOfArray < [currentElement count] ; ++indexOfArray) {
            [searchResults addObject:currentElement[indexOfArray]];
        }
    }
    else {
        [searchResults addObject:currentElement];
    }
}

- (double)identityOfSearchKeyNumbers:(NSArray *)searchKeyNumbers andExistingKeyNumbers:(NSArray *)existingKeyNumbers {
    
    NSInteger foundIdenticalCharacters = 0;
    NSInteger startPositionOfNextSearch = 0;
    
    for (NSInteger indexOfExistingKey = 0; indexOfExistingKey < existingKeyNumbers.count; ++indexOfExistingKey) {
        
        for (NSInteger indexOfSearchKey = startPositionOfNextSearch; indexOfSearchKey < searchKeyNumbers.count; ++indexOfSearchKey) {
            
            NSNumber *existingKeysCharacter = existingKeyNumbers[indexOfExistingKey];
            NSNumber *searchKeysCharacter = searchKeyNumbers[indexOfSearchKey];
            BOOL areNumbersIdentical = [existingKeysCharacter isEqualToNumber:searchKeysCharacter];
            
            if (areNumbersIdentical) {
                ++foundIdenticalCharacters;
                startPositionOfNextSearch = indexOfSearchKey + 1;
                break;
            }
        }
    }
    double identity = (double)foundIdenticalCharacters / (double)existingKeyNumbers.count;
    return identity;
}

@end
