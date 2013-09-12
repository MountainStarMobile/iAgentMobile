//
//  InsuranceNewsViewController.m
//  iAgent
//
//  Created by sinss on 13/5/21.
//  Copyright (c) 2013年 Good-idea Consulgint Inc. All rights reserved.
//

#import "InsuranceNewsViewController.h"
#import "DatabaseAccess.h"
#import "HMSegmentedControl.h"
#import "newsCell.h"

#define newCellHeight 118
@interface InsuranceNewsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) NSArray *newsArray;

@end

@implementation InsuranceNewsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.newsArray = [[DatabaseAccess databaseAccessInstance] GetNewsData];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.aTableView setDelegate:self];
    [self.aTableView setDataSource:self];
    HMSegmentedControl *segmentedControl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    
    [segmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    [segmentedControl setSectionTitles:@[@"保險", @"醫療", @"理財"]];
    [segmentedControl setSelectionIndicatorHeight:4.0f];
    [segmentedControl setBackgroundColor:[UIColor clearColor]];
    [segmentedControl setTextColor:[UIColor whiteColor]];
    [segmentedControl setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    [segmentedControl setSelectionIndicatorColor:[UIColor redColor]];
    [segmentedControl setSelectionIndicatorMode:HMSelectionIndicatorFillsSegment];
    [segmentedControl setSegmentEdgeInset:UIEdgeInsetsMake(0, 6, 0, 6)];
    [segmentedControl setSelectedSegmentIndex:0];
    [segmentedControl setTag:0];
    [self.view addSubview:segmentedControl];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    DESTORY(_aTableView);
    DESTORY(_newsArray);
    [super dealloc];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_newsArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    NewsInfo *record = [_newsArray objectAtIndex:row];
    if (record.expand)
    {
        NSInteger lines = [record.content length] / newContentWordUunit;
        if (lines % newContentWordUunit > 0) lines ++;
        return newCellHeight + lines * newLineHeightUnit;
    }
    return newCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"newsCellIdentifier";
    NSInteger row = [indexPath row];
    newsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"newsCell" owner:self options:nil] objectAtIndex:0];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    }
    
    NewsInfo *record = [_newsArray objectAtIndex:row];

    [cell.titleLabel setText:record.title];
    [cell.contentLabel setText:record.content];
    if (record.expand)
    {
        [cell.contentLabel setNumberOfLines:0];
        CGRect frame = [cell.contentLabel frame];
        NSInteger lines = [record.content length] / newContentWordUunit;
        if (lines % newContentWordUunit > 0) lines ++;
        [cell.contentLabel setFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height + lines * newLineHeightUnit)];
        [cell.contentLabel sizeToFit];
    }
    else
    {
        [cell.contentLabel setNumberOfLines:3];
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
    NSInteger row = [indexPath row];
    NewsInfo *record = [self.newsArray objectAtIndex:row];
    record.expand = !record.expand;
    [_aTableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    if (record.expand)
    {
        [_aTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
}

#pragma mark - HMSegment Action
- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl
{
	NSLog(@"Selected index %i (via UIControlEventValueChanged)", segmentedControl.selectedSegmentIndex);
    [_aTableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)uisegmentedControlChangedValue:(UISegmentedControl *)segmentedControl
{
	NSLog(@"Selected index %i", segmentedControl.selectedSegmentIndex);
}

@end
