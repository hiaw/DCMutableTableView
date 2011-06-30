//
//  DCRow.m
//  DCCustomTable
//
//  Created by Daniel Chong on 29/6/11.
//  Copyright 2011 Stillpig.com. All rights reserved.
//

#import "DCRow.h"


@implementation DCRow

@synthesize cell;
@synthesize selectorMethod;

- (id) initWithCell:(UITableViewCell *) tableCell command:(SEL) rowCommand
{
    if ((self = [super init])) {
        self.cell = tableCell;
        self.selectorMethod = rowCommand;
    }
    
    return self;
}

- (void) dealloc
{
    [cell release];
    [super dealloc];
}

@end
