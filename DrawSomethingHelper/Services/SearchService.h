//
//  SearchService.h
//  WordSolver
//
//  Created by Dani on 13/09/14.
//  Copyright (c) 2014 NDani. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SearchCompletion)(NSArray *results);

@interface SearchService : NSObject

- (void)startServiceWithSearchCharacters:(NSString *)characters withTargetLength:(NSInteger)targetLength withCompletion:(SearchCompletion)completion;

@end
