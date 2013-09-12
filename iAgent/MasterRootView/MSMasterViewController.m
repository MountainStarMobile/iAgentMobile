//
//  MSMasterViewController.m
//  MSNavigationPaneViewController
//
//  Created by Eric Horacek on 11/20/12.
//  Copyright (c) 2012 Monospace Ltd. All rights reserved.
//
//  This code is distributed under the terms and conditions of the MIT license.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "MSMasterViewController.h"
#import "SalesListViewController.h"
#import "SystemInfoViewController.h"
#import "CustomerServiceViewController.h"
#import "InsuranceNewsViewController.h"


#define color1 [UIColor colorWithRed:0 green:179/255.0 blue:134/255.0 alpha:1]
#define color2 [UIColor colorWithRed:0.251 green:0.502 blue:0.000 alpha:1.000]
#define color3 [UIColor colorWithRed:0.502 green:0.000 blue:0.000 alpha:1.000]
#define color4 [UIColor orangeColor]

typedef NS_ENUM(NSUInteger, MSMasterViewControllerTableViewSectionType) {
    MSMasterViewControllerTableViewSectionTypeColors,
    MSMasterViewControllerTableViewSectionTypeAbout,
    MSMasterViewControllerTableViewSectionTypeCount,
};

@interface MSMasterViewController ()

@property (nonatomic, strong) NSDictionary *iAgentMenuType;
@property (nonatomic, strong) NSDictionary *iAgentMenuTypeTintColor;
@property (nonatomic, strong) NSDictionary *iAgentMenuTypeClasses;
@property (nonatomic, strong) NSArray *tableViewSectionBreaks;

@end

@implementation MSMasterViewController

#pragma mark - UIViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    /*
     模擬測驗
     */
    if (self) {
        self.paneViewControllerType = NSUIntegerMax;
        self.iAgentMenuType = @{
            @(iAgentMenuTypeSalesList) : @"iAgent",
            @(iAgentMenuTypeNews) : @"保險新聞",
            @(iAgentMenuTypeCustomers) : @"會員專區",
            @(iAgentMenuTypeSystemInfo) : @"關於我們",
        };
        self.iAgentMenuTypeClasses = @{
             @(iAgentMenuTypeSalesList) : SalesListViewController.class,
             @(iAgentMenuTypeNews) : InsuranceNewsViewController.class,
             @(iAgentMenuTypeCustomers) : CustomerServiceViewController.class,
             @(iAgentMenuTypeSystemInfo) : SystemInfoViewController.class,
        };
        self.iAgentMenuTypeTintColor = @{
            @(iAgentMenuTypeSalesList) : color3,
            @(iAgentMenuTypeNews) : color3,
            @(iAgentMenuTypeCustomers) : color3,
            @(iAgentMenuTypeSystemInfo) : color3,
        };
        self.tableViewSectionBreaks = @[
            @(MSPaneViewControllerTypeMonospace),
            @(MSPaneViewControllerTypeCount)
        ];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    UIImageView *sbg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sidebarbg"]];
    [sbg setContentMode:UIViewContentModeScaleAspectFill];
    [sbg setFrame:self.tableView.bounds];
    [self.tableView setBackgroundView:sbg];
    self.view.backgroundColor = [UIColor clearColor];
}

#pragma mark - MSMasterViewController

- (iAgentMenuType)paneViewControllerTypeForIndexPath:(NSIndexPath *)indexPath
{
    iAgentMenuType paneViewControllerType;
    
    paneViewControllerType = indexPath.row;

    NSAssert(paneViewControllerType < ExamKingViewTypeCount, @"Invalid Index Path");
    return paneViewControllerType;
}


- (void)transitionToViewController:(iAgentMenuType)paneViewControllerType section:(NSInteger)sec
{
    if (paneViewControllerType == self.paneViewControllerType && sec == self.ExamMasterSection)
    {
        [self.navigationPaneViewController setPaneState:MSDraggableViewStateClosed animated:YES];
        return;
    }
    
    BOOL animateTransition = self.navigationPaneViewController.paneViewController != nil;
    
    Class paneViewControllerClass = self.iAgentMenuTypeClasses[@(paneViewControllerType)];
    NSParameterAssert([paneViewControllerClass isSubclassOfClass:UIViewController.class]);
    UIViewController *paneViewController = (UIViewController *)[[paneViewControllerClass alloc] init];
    paneViewController.navigationItem.title = self.iAgentMenuType[@(paneViewControllerType)];
    paneViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"MSBarButtonIconNavigationPane.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(navigationPaneBarButtonItemTapped:)];
    
    UINavigationController *paneNavigationViewController = [[UINavigationController alloc] initWithRootViewController:paneViewController];
    paneNavigationViewController.navigationBar.tintColor = self.iAgentMenuTypeTintColor[@(paneViewControllerType)];
    paneNavigationViewController.toolbar.tintColor = self.iAgentMenuTypeTintColor[@(paneViewControllerType)];
    
    [self.navigationPaneViewController setPaneViewController:paneNavigationViewController animated:animateTransition completion:nil];
    
    self.paneViewControllerType = paneViewControllerType;
    self.ExamMasterSection = sec;
}

- (void)navigationPaneBarButtonItemTapped:(id)sender;
{
    [self.navigationPaneViewController setPaneState:MSDraggableViewStateOpen animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
        return 0;
    return [self.iAgentMenuType count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIImageView *imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"headerView_bg3.png"]];
    [imageview setFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0,
                                                               self.view.frame.size.width - 10,
                                                               20)];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont fontWithName:kFontBold size:16]];
    [label setTextColor:[UIColor whiteColor]];
    if (section == 0)
    {
        [label setText:@"會員專區"];
    }
    else
    {
        [label setText:@""];
    }
    [imageview addSubview:label];
    return imageview;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ExamKingMasterCellIdentifier = @"ExamKingMasterCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ExamKingMasterCellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ExamKingMasterCellIdentifier];
        UIImageView *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sidebarcell"]];
        [bg setFrame:CGRectMake(0, 0, 199.5, 42.5)];
        [cell setBackgroundView:bg];
        UIImage *img = [UIImage imageNamed:@"item01.png"];
        [cell.imageView setImage:img];
        [cell.textLabel setTextColor:[UIColor lightGrayColor]];
        [cell.textLabel setFont:[UIFont fontWithName:kFontCommon size:16]];
        [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    }
    if ([indexPath section] == 0)
        cell.textLabel.text = [NSString stringWithFormat:@""];
    else if ([indexPath section] == 1)
        cell.textLabel.text = self.iAgentMenuType[@([self paneViewControllerTypeForIndexPath:indexPath])];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger sec = [indexPath section];
    if (sec == 0)
    {
        
    }
    else if (sec == 1)
    {
        [self transitionToViewController:[self paneViewControllerTypeForIndexPath:indexPath] section:sec];
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    
}

@end
