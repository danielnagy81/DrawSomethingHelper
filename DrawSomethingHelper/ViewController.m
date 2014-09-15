//
//  ViewController.m
//  DrawSomethingHelper
//
//  Created by Dani on 15/09/14.
//  Copyright (c) 2014 Dani. All rights reserved.
//

#import "ViewController.h"
#import "SearchService.h"
#import "ResultTableView.h"

NSString *const ResultTableViewStoryboardIdentifier = @"ResultTableView";

@interface ViewController () {
    
    IBOutlet UITextField *_textField;
    __weak IBOutlet UITextField *_characterTextField;
    __weak IBOutlet UIStepper *_stepper;
    
    SearchService *_searchService;
    NSArray *_results;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    
    _searchService = [[SearchService alloc] init];
}

- (IBAction)stepperDidPressed:(UIStepper *)sender {
    
    _textField.text = [NSString stringWithFormat:@"%.f", sender.value];
}

- (IBAction)searchButtonPressed:(id)sender {
    
    [_searchService startServiceWithSearchCharacters:_characterTextField.text withTargetLength:(NSInteger)_stepper.value withCompletion:^(NSArray *results) {
        NSLog(@"Results: %@", results);
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ResultTableView *resultsTableViewController = [storyboard instantiateViewControllerWithIdentifier:ResultTableViewStoryboardIdentifier];
        resultsTableViewController.results = results;
        [self.navigationController pushViewController:resultsTableViewController animated:YES];
    }];
}
@end
