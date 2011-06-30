//
//  DCSection.m
//  DCCustomTable
//
//  Created by Daniel Chong on 29/6/11.
//  Copyright 2011 Stillpig.com. All rights reserved.
//

#import "DCSection.h"


@implementation DCSection

@synthesize arrayOfRows;
@synthesize headerString;
@synthesize footerString;

- (id) init
{
    if ((self = [super init])) {
        self.arrayOfRows = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (id) initWithHeader:(NSString *) header footer:(NSString *) footer
{
    if ((self = [super init])) {
        self.headerString = header;
        self.footerString = footer;
        self.arrayOfRows = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void) dealloc
{
    [arrayOfRows release];
    [headerString release];
    [footerString release];
    [super dealloc];
}

@end
