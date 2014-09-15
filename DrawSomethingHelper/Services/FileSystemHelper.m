//
//  FileSystemHelper.m
//  WordSolver
//
//  Created by Daniel_Nagy on 12/09/14.
//  Copyright (c) 2014 NDani. All rights reserved.
//

#import "FileSystemHelper.h"

NSString *const FileName = @"processedWords";
NSString *const FileType = @"plist";

@implementation FileSystemHelper

+ (void)saveResults:(NSDictionary *)results {
    
    NSString *fileName = [FileSystemHelper filePath];
    [results writeToFile:fileName atomically:NO];
}

+ (NSDictionary *)openResults {
    
    BOOL isFileExists = [[NSFileManager defaultManager] fileExistsAtPath:[FileSystemHelper filePath]];
    
    if (!isFileExists) {
        return nil;
    }
    NSDictionary *results = [NSDictionary dictionaryWithContentsOfFile:[FileSystemHelper filePath]];
    return results;
}

+ (NSString *)filePath {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths firstObject];
    NSString *fileName = [NSString stringWithFormat:@"%@/%@.%@", documentsPath, FileName, FileType];
    return fileName;
}

@end
