//
//  Database.m
//  DrawSomethingHelper
//
//  Created by Dani on 15/09/14.
//  Copyright (c) 2014 Dani. All rights reserved.
//

#import "Database.h"
#import "Data.h"
#import "SaveAlgorithm.h"
#import "FileSystemHelper.h"

@implementation Database

+ (void)createDatabase {
    
    if (![FileSystemHelper isDatabaseExists]) {
        NSArray *data = [Data createData];
        SaveAlgorithm *saveAlgorithm = [[SaveAlgorithm alloc] init];
        [saveAlgorithm addWords:data];
        [saveAlgorithm startAlgorithm];
        NSDictionary *processedWords = [saveAlgorithm results];
        [FileSystemHelper saveResults:processedWords];
    }
}

@end
