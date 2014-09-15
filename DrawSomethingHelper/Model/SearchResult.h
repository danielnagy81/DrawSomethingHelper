//
//  SearchResult.h
//  WordSolver
//
//  Created by Dani on 13/09/14.
//  Copyright (c) 2014 NDani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchResult : NSObject

@property (nonatomic, copy) NSString *key;
@property (nonatomic) NSNumber *rank;

- (instancetype)initWithKey:(NSString *)key withRank:(NSNumber *)rank;

@end
