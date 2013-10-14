//
//  xxiivvViewController.h
//  Oquonie
//
//  Created by Devine Lu Linvega on 2013-07-08.
//  Copyright (c) 2013 XXIIVV. All rights reserved.
//

#import "xxiivvViewController.h"

@interface xxiivvViewController (world)

- (void) worldStart;
- (void) roomStart;
- (NSString*) tileParser :(NSString*)tileString :(int)index;

@end