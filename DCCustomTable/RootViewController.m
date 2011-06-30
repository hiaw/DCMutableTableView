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
}

- (void)openFAQ:(id)sender {
}

- (void)openDonationView:(id)sender {
}

- (void)updateUserNamePassword:(id)sender {
}

- (void)getDropboxSyncOption:(id)sender {
}

- (void)getRemoveAdvertisingOption:(id)sender {
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
//    [super viewDidLoad];
    
    DCSection *syncingSection = [[DCSection alloc] init];
    DCRow *syncingRow = [[DCRow alloc] initWithCell:syncNowCell command:@"syncNow:"];
    [syncingSection.arrayOfRows addObject:syncingRow];
    [syncingRow release];
    
    DCSection *manualSection = [[DCSection alloc] initWithHeader:@"Manual" footer:@"Instruction Manuals for using Bibpad."];
    DCRow *faqRow = [[DCRow alloc] initWithCell:FAQCell command:@"openFAQ:"];
    [manualSection.arrayOfRows addObject:faqRow];
    [faqRow release];
    
    DCSection *donationSection = [[DCSection alloc] initWithHeader:@"Donation" footer:@"If you like Bibpad, feel free to donate."];
    DCRow *donationRow = [[DCRow alloc] initWithCell:DonateCell command:@"openDonationView:"];
    [donationSection.arrayOfRows addObject:donationRow];
    [donationRow release];    
    
    DCSection *dropboxSection = [[DCSection alloc] initWithHeader:@"Dropbox Setting" footer:@"Enter your Dropbox account information to enable wireless syncing."];
    DCRow *dropboxUserRow = [[DCRow alloc] initWithCell:dropboxUserName command:@"updateUserNamePassword:"];
    [dropboxSection.arrayOfRows addObject:dropboxUserRow];
    [dropboxUserRow release]; 
    DCRow *dropboxPassRow = [[DCRow alloc] initWithCell:dropboxPasswordCell command:@"updateUserNamePassword:"];
    [dropboxSection.arrayOfRows addObject:dropboxPassRow];
    [dropboxPassRow release]; 
    
    DCSection *purchaseSection = [[DCSection alloc] initWithHeader:@"Purchase Options" footer:@"Purchase additional options for Bibpad."];
    DCRow *dropSyncRow = [[DCRow alloc] initWithCell:syncOptionCell command:@"getDropboxSyncOption:"];
    [purchaseSection.arrayOfRows addObject:dropSyncRow];
    [dropSyncRow release];
    DCRow *removeAdRow = [[DCRow alloc] initWithCell:removeAdCell command:@"getRemoveAdvertisingOption:"];
    [purchaseSection.arrayOfRows addObject:removeAdRow];
    [removeAdRow release];
    
    self.arrayOfSections = [[NSMutableArray alloc] initWithObjects:syncingSection, manualSection, donationSection, dropboxSection, purchaseSection, nil];
    
    [syncingSection release];
    [manualSection release];
    [donationSection release];
    [dropboxSection release];
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
