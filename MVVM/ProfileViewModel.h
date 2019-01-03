//
//  ProfileViewModel.h
//  MVVM
//
//  Created by Lakshmi Narayanan N on 03/01/19.
//  Copyright © 2019 Lakshmi Narayanan N. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol ProfileViewModelDelegate <NSObject>

- (void)displayUserName:(NSString *)userName;
- (void)displayEmailId:(NSString *)emailId;

@end

NS_ASSUME_NONNULL_BEGIN

@interface ProfileViewModel : NSObject

@property(weak, nonatomic) id<ProfileViewModelDelegate> delegate;

- (void)viewDidLoad;

@end

NS_ASSUME_NONNULL_END
