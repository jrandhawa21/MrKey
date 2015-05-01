//
//  RegisterViewController.m
//  Mr.Key New File
//
//  Created by JOHNNY RANDHAWA on 4/24/15.
//  Copyright (c) 2015 JOHNNY RANDHAWA. All rights reserved.
//

#import "RegisterViewController.h"
#import "HomeViewController.h"
#import <Parse/Parse.h>


@interface RegisterViewController ()

@property (nonatomic, weak) IBOutlet UITextField *username;
@property (nonatomic, weak) IBOutlet UITextField *password;
@property (nonatomic, weak) IBOutlet UITextField *email;

@end

@implementation RegisterViewController

- (void)makeAccount{
    PFUser *user = [PFUser user];
    user.username = _username.text;
    user.password = _password.text;
    user.email = _email.text;
    
    // other fields can be set just like with PFObject
//    user[@"phone"] = @"415-392-0202";
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            [self segueToMainViewController];
        } else {
            NSString *errorString = [error userInfo][@"error"];
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
            [alertView show];
            // Show the errorString somewhere and let the user try again.
        }
    }];
}

-(void)parseData
{
    if ([_username.text isEqualToString:@""])
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter a username " delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [alertView show];
        
    }
    else if ([_email.text isEqualToString:@""]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter an email " delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [alertView show];
    }
    else if ([_password.text isEqualToString:@""]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter a password " delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [alertView show];
    }
    else
    {
        [self makeAccount];
    }
    
}

-(void)segueToMainViewController
{
    NSLog(@"Segue");
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    [self.navigationController pushViewController:homeVC animated:YES];
//    [self presentViewController:homeVC animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden = NO;
    UIBarButtonItem *btnShare = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(parseData)];
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:btnShare, nil]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
//    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];

    
}







@end

