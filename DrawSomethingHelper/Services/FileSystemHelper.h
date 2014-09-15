//
//  FileSystemHelper.h
//  WordSolver
//
//  Created by Daniel_Nagy on 12/09/14.
//  Copyright (c) 2014 NDani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileSystemHelper : NSObject

+ (void)saveResults:(NSDictionary *)results;
+ (NSDictionary *)openResults;
+ (BOOL)isDatabaseExists;

@end
