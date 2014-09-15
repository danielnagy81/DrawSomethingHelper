//
//  SearchAlgorithm.h
//  WordSolver
//
//  Created by Daniel_Nagy on 12/09/14.
//  Copyright (c) 2014 NDani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseAlgorithm.h"

@interface SearchAlgorithm : BaseAlgorithm

- (NSArray *)searchWithCharacters:(NSString *)characters withTargetWordLength:(NSInteger)targetLength;

@end
