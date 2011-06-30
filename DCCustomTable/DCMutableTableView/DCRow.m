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
@synthesize command;

- (id) initWithCell:(UITableViewCell *) tableCell command:(NSString *) rowCommand
{
    if ((self = [super init])) {
        self.cell = tableCell;
        self.command = rowCommand;
    }
    
    return self;
}

- (void) dealloc
{
    [cell release];
    [command release];
    [super dealloc];
}

@end
