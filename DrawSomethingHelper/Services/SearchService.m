//
//  SearchService.m
//  WordSolver
//
//  Created by Dani on 13/09/14.
//  Copyright (c) 2014 NDani. All rights reserved.
//

#import "SearchService.h"
#import "SearchResult.h"
#import "SearchAlgorithm.h"
#import "FileSystemHelper.h"

@implementation SearchService

- (void)startServiceWithSearchCharacters:(NSString *)characters withTargetLength:(NSInteger)targetLength withCompletion:(SearchCompletion)completion {
    
    NSDictionary *processedWords = [FileSystemHelper openResults];
    
    if (completion) {
        
        if (processedWords) {
            SearchAlgorithm *searchAlgorithm = [[SearchAlgorithm alloc] initWithProcessedWords:processedWords];
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                NSArray *results = [searchAlgorithm searchWithCharacters:characters withTargetWordLength:targetLength];
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(results);
                });
            });
        }
        else {
            completion(nil);
        }
    }
    else {
        NSLog(@"Error: Implement completion block in the caller of %s", __PRETTY_FUNCTION__);
    }
}

@end
