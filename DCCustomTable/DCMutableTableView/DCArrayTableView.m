//
//  DCTableArray.m
//  DCCustomTable
//
//  Created by Daniel Chong on 29/6/11.
//  Copyright 2011 Stillpig.com. All rights reserved.
//

#import "DCArrayTableView.h"


@implementation DCArrayTableView

@synthesize arrayOfSections;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return [arrayOfSections count];
}

- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section 
{
    DCSection *theSection = [arrayOfSections objectAtIndex:section];
    return [theSection.arrayOfRows count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    DCSection *theSection = [arrayOfSections objectAtIndex:indexPath.section];
    DCRow *theRow = [theSection.arrayOfRows objectAtIndex:indexPath.row];
    return theRow.cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    DCSection *theSection = [arrayOfSections objectAtIndex:section];
    return theSection.headerString;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    DCSection *theSection = [arrayOfSections objectAtIndex:section];
    return theSection.footerString;
}

- (void)tableView:(UITableView *)table didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    DCSection *theSection = [arrayOfSections objectAtIndex:indexPath.section];
    DCRow *theRow = [theSection.arrayOfRows objectAtIndex:indexPath.row];
    [self performSelector:NSSelectorFromString(theRow.command)];
}

@end
