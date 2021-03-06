//
//  LoginViewController.m
//  Parse Chat
//
//  Created by Ruhee Rajwani on 6/27/22.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation LoginViewController
- (IBAction)registerUser:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Missing Information" message:@"You have not entered all the required information for signing up. Please try again" preferredStyle:(UIAlertControllerStyleAlert)];

    // create an OK action
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
        style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                                            // handle response here.
    }];
    // add the OK action to the alert controller
    [alert addAction:okAction];
    
    if ([self.username.text isEqual:@""] || [self.password.text isEqual:@""]){
        [self presentViewController:alert animated:YES completion:^{
            // optional code for what happens after the alert controller has finished presenting
        }];
    }
    // initialize a user object
       PFUser *newUser = [PFUser user];
       
       // set user properties
       newUser.username = self.username.text;
//       newUser.email = self.emailField.text;
       newUser.password = self.password.text;
       
       // call sign up function on the object
       [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
           if (error != nil) {
               NSLog(@"Error: %@", error.localizedDescription);
           } else {
               NSLog(@"User registered successfully");
               
               // manually segue to logged in view
           }
       }];
}
- (IBAction)loginUser:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Missing Information" message:@"You have not entered all the required information for logging in. Please try again" preferredStyle:(UIAlertControllerStyleAlert)];
    
    // create an OK action
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
        style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                                            // handle response here.
    }];
    // add the OK action to the alert controller
    [alert addAction:okAction];
    
    if ([self.username.text isEqual:@""] || [self.password.text isEqual:@""]){
        [self presentViewController:alert animated:YES completion:^{
            // optional code for what happens after the alert controller has finished presenting
        }];
    }
    
    NSString *username = self.username.text;
    NSString *password = self.password.text;
        
        [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
            if (error != nil) {
                NSLog(@"User log in failed: %@", error.localizedDescription);
            } else {
                NSLog(@"User logged in successfully");
                [self performSegueWithIdentifier:@"loginSegue" sender:nil];

                
                // display view controller that needs to shown after successful login
            }
        }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
