//
//  ProfileViewModel.m
//  MVVM
//
//  Created by Lakshmi Narayanan N on 03/01/19.
//  Copyright © 2019 Lakshmi Narayanan N. All rights reserved.
//

#import "ProfileViewModel.h"

@implementation ProfileViewModel

- (void)viewDidLoad {
    [self loadProfile];
}

- (void)loadProfile {
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://demo3564417.mockable.io/profile"]];
    [urlRequest setHTTPMethod:@"GET"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                                                    if(httpResponse.statusCode == 200) {
                                                        NSError *parseError = nil;
                                                        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
                                                        NSLog(@"The response is - %@",responseDictionary);
                                                        
                                                        dispatch_async(dispatch_get_main_queue(), ^{
                                                            if([responseDictionary objectForKey:@"name"]) {
                                                                [[self delegate] displayUserName:[responseDictionary objectForKey:@"name"]];
                                                            }
                                                            
                                                            if([responseDictionary objectForKey:@"email"]) {
                                                                [[self delegate] displayEmailId:[responseDictionary objectForKey:@"email"]];
                                                            }
                                                        });
                                                    } else {
                                                        NSLog(@"Error");
                                                    }
                                                }];
    [dataTask resume];
}

@end
