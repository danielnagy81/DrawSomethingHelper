//
//  SearchResult.m
//  WordSolver
//
//  Created by Dani on 13/09/14.
//  Copyright (c) 2014 NDani. All rights reserved.
//

#import "SearchResult.h"

@implementation SearchResult

- (instancetype)initWithKey:(NSString *)key withRank:(NSNumber *)rank {
    self = [super init];
    if (self) {
        _key = key;
        _rank = rank;
    }
    return self;
}

@end
