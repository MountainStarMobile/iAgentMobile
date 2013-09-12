//
//  SalesListViewController.m
//  iAgent
//
//  Created by sinss on 13/5/19.
//  Copyright (c) 2013年 Good-idea Consulgint Inc. All rights reserved.
//

#import "SalesListViewController.h"
#import "SearchTableViewController.h"
#import "NIBadgeView.h"
#import "agentItemCell.h"

#define agentItemWidth 60
#define agentItemCellHeight 80

@interface SalesListViewController ()

- (void)createAgentButtonInScrollView;
- (void)createbarItem;
- (void)searchAgentItemPress:(UIBarButtonItem*)sender;

@end

@implementation SalesListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.aTableView setDelegate:self];
    [self.aTableView setDataSource:self];
    [self createAgentButtonInScrollView];
    [self createbarItem];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [_aScrollView release], _aScrollView = nil;
    [_aTableView release], _aTableView = nil;
    [super dealloc];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return agentItemCellHeight;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *label = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width - 10 , 30)] autorelease];
    [label setTextAlignment:NSTextAlignmentRight];
    [label setTextColor:[UIColor darkGrayColor]];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    [label setText:[NSString stringWithFormat:@"共 888 位"]];
    return label;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"iAgentItemCellIdentifier";
    agentItemCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"agentItemCell" owner:self options:nil] objectAtIndex:0];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    }
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

#pragma mark - create Agent Button
- (void)createAgentButtonInScrollView
{
    NSInteger numbersOfAgents = 20;
    CGFloat startX = 5;
    CGFloat startY = 5;
    CGFloat widthUnit = 63;
    for (int i = 0 ; i < numbersOfAgents ; i++)
    {
        /*
        NIBadgeView *imgItem = [[NIBadgeView alloc] initWithFrame:CGRectMake(startX, startY, 80, 80)];
        
        [imgItem setText:[NSString stringWithFormat:@"agent%i",i+1]];
        
        [self.aScrollView addSubview:imgItem];
         */
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitle:[NSString stringWithFormat:@"Item %i",i+1] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
        [button setFrame:CGRectMake(startX, startY, agentItemWidth, agentItemWidth)];
        [self.aScrollView addSubview:button];
        startX += widthUnit;
    }
    
    [self.aScrollView setContentSize:CGSizeMake(widthUnit * numbersOfAgents, self.aScrollView.frame.size.height)];
}

- (void)createbarItem
{
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchAgentItemPress:)];
    
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:searchItem, nil];
    [searchItem release];
}
- (void)searchAgentItemPress:(UIBarButtonItem*)sender
{
    SearchTableViewController *searchView = [[SearchTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:searchView animated:YES];
    [searchView release];
}


@end
