//
//  ALAssestManager.m
//  ALAssestPicker
//
//  Created by Karan Singh on 25/01/14.
//  Copyright (c) 2014 Trancis. All rights reserved.
//

#import "ALAssetsLibraryManager.h"
@interface ALAssetsLibraryManager()
{
    
}
@property(nonatomic,readwrite)ALAssetsLibrary *library;
@end
@implementation ALAssetsLibraryManager
@synthesize library=_library;


+ (id)defaultAssetsLibrary {
    static ALAssetsLibraryManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}
- (id)init {
    if (self = [super init]) {
        _library=[[ALAssetsLibrary alloc] init];
    }
    return self;
}

@end
