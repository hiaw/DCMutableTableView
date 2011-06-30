//
//  RootViewController.m
//  DCCustomTable
//
//  Created by Daniel Chong on 29/6/11.
//  Copyright 2011 Stillpig.com. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController

#pragma mark - IBActions

- (void)syncNow:(id) sender;
{
    NSLog(@"method name %@", NSStringFromSelector(_cmd));
    
    // Replace row with syncingRow
    DCSection *syncingSection = [self.arrayOfSections objectAtIndex:0];
    [syncingSection.arrayOfRows removeAllObjects];
    
    DCRow *syncingRow = [[DCRow alloc] initWithCell:syncingCell command:@"cancelSync:"];
    [syncingSection.arrayOfRows addObject:syncingRow];
    [syncingRow release];
    
    [self.tableView reloadData];
}

- (void) cancelSync:(id) sender;
{
    NSLog(@"method name %@", NSStringFromSelector(_cmd));
    
    // Replace row with syncNowRow
    DCSection *syncingSection = [self.arrayOfSections objectAtIndex:0];
    [syncingSection.arrayOfRows removeAllObjects];
    
    DCRow *syncNowRow = [[DCRow alloc] initWithCell:syncNowCell command:@"syncNow:"];
    [syncingSection.arrayOfRows addObject:syncNowRow];
    [syncNowRow release];
    
    [self.tableView reloadData];
}

- (void)openFAQ:(id)sender {
    NSLog(@"method name %@", NSStringFromSelector(_cmd));
}

- (void)openDonationView:(id)sender {
    NSLog(@"method name %@", NSStringFromSelector(_cmd));
}

- (void)updateUserNamePassword:(id)sender {
    NSLog(@"method name %@", NSStringFromSelector(_cmd));
}

- (void)getDropboxSyncOption:(id)sender {
    NSLog(@"method name %@", NSStringFromSelector(_cmd));
    
    // Remove the option after it's been purchased.
    DCSection *purchaseSection = [self.arrayOfSections lastObject];
    DCRow *lastRow = [purchaseSection.arrayOfRows objectAtIndex:0];
    if ([lastRow.command compare:@"getDropboxSyncOption:"] == NSOrderedSame) {
        [purchaseSection.arrayOfRows removeObjectAtIndex:0];
        [self.tableView reloadData];
        
        // Add in dropbox options after it's been purchase        
        DCSection *dropboxSection = [[DCSection alloc] initWithHeader:@"Dropbox Setting" footer:@"Enter your Dropbox account information to enable wireless syncing."];
        DCRow *dropboxUserRow = [[DCRow alloc] initWithCell:dropboxUserName command:@"updateUserNamePassword:"];
        [dropboxSection.arrayOfRows addObject:dropboxUserRow];
        [dropboxUserRow release]; 
        DCRow *dropboxPassRow = [[DCRow alloc] initWithCell:dropboxPasswordCell command:@"updateUserNamePassword:"];
        [dropboxSection.arrayOfRows addObject:dropboxPassRow];
        [dropboxPassRow release]; 
        
        [self.arrayOfSections insertObject:dropboxSection atIndex:3];
        
        [dropboxSection release];
        
        // If both options have been purchased. remove section
        if ([purchaseSection.arrayOfRows count] == 0) {
            [self.arrayOfSections removeObject:purchaseSection];
        }
        
        [self.tableView reloadData];
    }
}

- (void)getRemoveAdvertisingOption:(id)sender {
    NSLog(@"method name %@", NSStringFromSelector(_cmd));
    
    // Remove the option after it's been purchased.
    DCSection *purchaseSection = [self.arrayOfSections lastObject];
    DCRow *lastRow = [purchaseSection.arrayOfRows lastObject];
    if ([lastRow.command compare:@"getRemoveAdvertisingOption:"] == NSOrderedSame) {
        [purchaseSection.arrayOfRows removeLastObject];
        
        // If both options have been purchased. remove section
        if ([purchaseSection.arrayOfRows count] == 0) {
            [self.arrayOfSections removeObject:purchaseSection];
        }
        [self.tableView reloadData];
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    DCSection *syncingSection = [[DCSection alloc] init];
    DCRow *syncNowRow = [[DCRow alloc] initWithCell:syncNowCell command:@"syncNow:"];
    [syncingSection.arrayOfRows addObject:syncNowRow];
    [syncNowRow release];
    
    DCSection *manualSection = [[DCSection alloc] initWithHeader:@"Manual" footer:@"Instruction Manuals for using Bibpad."];
    DCRow *faqRow = [[DCRow alloc] initWithCell:FAQCell command:@"openFAQ:"];
    [manualSection.arrayOfRows addObject:faqRow];
    [faqRow release];
    
    DCSection *donationSection = [[DCSection alloc] initWithHeader:@"Donation" footer:@"If you like Bibpad, feel free to donate."];
    DCRow *donationRow = [[DCRow alloc] initWithCell:DonateCell command:@"openDonationView:"];
    [donationSection.arrayOfRows addObject:donationRow];
    [donationRow release];    
 
    
    DCSection *purchaseSection = [[DCSection alloc] initWithHeader:@"Purchase Options" footer:@"Purchase additional options for Bibpad."];
    DCRow *dropSyncRow = [[DCRow alloc] initWithCell:syncOptionCell command:@"getDropboxSyncOption:"];
    [purchaseSection.arrayOfRows addObject:dropSyncRow];
    [dropSyncRow release];
    DCRow *removeAdRow = [[DCRow alloc] initWithCell:removeAdCell command:@"getRemoveAdvertisingOption:"];
    [purchaseSection.arrayOfRows addObject:removeAdRow];
    [removeAdRow release];
    
    self.arrayOfSections = [[NSMutableArray alloc] initWithObjects:syncingSection, manualSection, donationSection, purchaseSection, nil];
    
    [syncingSection release];
    [manualSection release];
    [donationSection release];
    [purchaseSection release];
}

- (void)dealloc
{
    [arrayOfSections release];
    [syncNowCell release];
    [syncingCell release];
    [dropboxUserName release];
    [dropboxPasswordCell release];
    [syncOptionCell release];
    [removeAdCell release];
    [FAQCell release];
    [DonateCell release];
    [super dealloc];
}

@end
