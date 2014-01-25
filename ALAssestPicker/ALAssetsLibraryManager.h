//
//  ALAssestManager.h
//  ALAssestPicker
//
//  Created by Karan Singh on 25/01/14.
//  Copyright (c) 2014 Trancis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface ALAssetsLibraryManager : NSObject


@property(nonatomic,readonly)ALAssetsLibrary *library;

+(ALAssetsLibraryManager *)defaultAssetsLibrary;
@end
