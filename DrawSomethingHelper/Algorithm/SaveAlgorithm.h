//
//  Algorithm.h
//  WordSolver
//
//  Created by Daniel_Nagy on 12/09/14.
//  Copyright (c) 2014 NDani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseAlgorithm.h"

@interface SaveAlgorithm : BaseAlgorithm

- (instancetype)initWithProcessedWords:(NSDictionary *)processedWords;

- (void)addWord:(NSString *)word;
- (void)addWords:(NSArray *)words;
- (void)startAlgorithm;
- (NSDictionary *)results;

@end
