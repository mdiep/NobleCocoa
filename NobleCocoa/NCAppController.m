//
//  NCAppController.m
//  NobleCocoa
//
//  Created by Matt Diephouse on 12/27/12.
//  Copyright (c) 2012 Matt Diephouse. All rights reserved.
//

#import "NCAppController.h"


@interface NCAppController ()
@property (assign, nonatomic) IBOutlet NSButton *resetButton;
@property (assign, nonatomic) IBOutlet NSButton *createButton;
@property (assign, nonatomic) IBOutlet NSWindow *window;

@property (copy, nonatomic) NSString *firstName;
@property (copy, nonatomic) NSString *lastName;
@property (copy, nonatomic) NSString *email;
@property (copy, nonatomic) NSString *reEmail;

@property (assign, nonatomic, getter=isProcessing) BOOL processing;

@property (assign, nonatomic, readonly) BOOL formValid;
@property (assign, nonatomic, readonly) BOOL canReset;
@property (assign, nonatomic, readonly) BOOL canCreate;
@property (strong, nonatomic, readonly) NSColor *textColor;
@end

@implementation NCAppController

#pragma mark -
#pragma mark KVO Keypaths

+ (NSSet *) keyPathsForValuesAffectingCanReset
{
    return [NSSet setWithObjects:
            @"firstName",
            @"lastName",
            @"email",
            @"reEmail",
            @"processing",
            nil];
}

+ (NSSet *) keyPathsForValuesAffectingCanCreate
{
    return [NSSet setWithObjects:
            @"formValid",
            @"processing",
            nil];
}

+ (NSSet *) keyPathsForValuesAffectingFormValid
{
    return [NSSet setWithObjects:
            @"firstName",
            @"lastName",
            @"email",
            @"reEmail",
            nil];
}

+ (NSSet *) keyPathsForValuesAffectingTextColor
{
    return [NSSet setWithObjects:
            @"processing",
            nil];
}

#pragma mark -
#pragma mark Calculated Properties

- (BOOL) canReset
{
    NSString *firstName = self.firstName;
    NSString *lastName  = self.lastName;
    NSString *email     = self.email;
    NSString *reEmail   = self.reEmail;
    BOOL hasData = firstName.length > 0 || lastName.length > 0 || email.length > 0 || reEmail.length > 0;
    return hasData && !self.isProcessing;
}

- (BOOL) canCreate
{
    return !self.isProcessing && self.formValid;
}

- (BOOL) formValid
{
    NSString *firstName = self.firstName;
    NSString *lastName  = self.lastName;
    NSString *email     = self.email;
    NSString *reEmail   = self.reEmail;
    return firstName.length > 0 && lastName.length > 0 && email.length > 0 && reEmail.length > 0 && [email isEqual:reEmail];
}

- (NSColor *) textColor
{
    return self.isProcessing ? [NSColor lightGrayColor] : [NSColor textColor];
}

#pragma mark -
#pragma mark Actions

- (IBAction) create:(id)sender
{
    self.processing = YES;
    int64_t delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        self.processing = NO;
    });
}

- (IBAction) reset:(id)sender
{
    self.firstName  = nil;
    self.lastName   = nil;
    self.email      = nil;
    self.reEmail    = nil;
}


@end
