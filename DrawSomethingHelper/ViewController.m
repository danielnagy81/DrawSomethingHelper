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
    __weak IBOutlet UIActivityIndicatorView *_loadingIndicator;
    
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
    
    [self changeViewInteractionIfLoading:YES];
    [_searchService startServiceWithSearchCharacters:_characterTextField.text withTargetLength:(NSInteger)_stepper.value withCompletion:^(NSArray *results) {
        [self instantiateSearchViewControllerWithResults:results];
        [self changeViewInteractionIfLoading:NO];
    }];
}

- (void)changeViewInteractionIfLoading:(BOOL)loading {
    
    if (loading) {
        [_loadingIndicator startAnimating];
        _stepper.enabled = NO;
        _characterTextField.enabled = NO;
    }
    else {
        [_loadingIndicator stopAnimating];
        _stepper.enabled = YES;
        _characterTextField.enabled = YES;
    }
}

- (void)instantiateSearchViewControllerWithResults:(NSArray *)results {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ResultTableView *resultsTableViewController = [storyboard instantiateViewControllerWithIdentifier:ResultTableViewStoryboardIdentifier];
    resultsTableViewController.results = results;
    [self.navigationController pushViewController:resultsTableViewController animated:YES];
}
@end
