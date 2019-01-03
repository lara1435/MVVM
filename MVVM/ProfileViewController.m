//
//  ProfileViewController.m
//  MVVM
//
//  Created by Lakshmi Narayanan N on 03/01/19.
//  Copyright © 2019 Lakshmi Narayanan N. All rights reserved.
//

#import "ProfileViewController.h"


@interface ProfileViewController () {
    ProfileViewModel *viewModel;
}

@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailIdLabel;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureViewModal];
}

- (void)configureViewModal {
    viewModel = [[ProfileViewModel alloc] init];
    [viewModel setDelegate:self];
    [viewModel viewDidLoad];
}

- (void)displayEmailId:(NSString *)emailId {
    [[self emailIdLabel] setText:emailId];
}

- (void)displayUserName:(NSString *)userName {
    [[self userNameLabel] setText:userName];
}

@end


