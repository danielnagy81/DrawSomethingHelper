//
//  BaseAlgorithm.h
//  WordSolver
//
//  Created by Daniel_Nagy on 12/09/14.
//  Copyright (c) 2014 NDani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseAlgorithm : NSObject {
    
    NSMutableDictionary *_processedWords;
}
- (instancetype)initWithProcessedWords:(NSDictionary *)processedWords;
- (NSString *)createKeyWithWord:(NSString *)word;
- (NSArray *)createCharacterArrayFromWord:(NSString *)word;
- (NSString *)createStringWithCharacters:(NSArray *)characters;

@end
