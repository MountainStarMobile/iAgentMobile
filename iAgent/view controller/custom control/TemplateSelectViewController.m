//
//  TemplateSelectViewController.m
//  iAgent
//
//  Created by Leo Chang on 5/21/13.
//  Copyright (c) 2013 Good-idea Consulgint Inc. All rights reserved.
//

#import "TemplateSelectViewController.h"

@interface TemplateSelectViewController () <UITableViewDataSource , UITableViewDelegate>

@end

@implementation TemplateSelectViewController

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
    [self.aTableView setTableFooterView:[[[UIView alloc] initWithFrame:CGRectZero] autorelease]];
    [self.aTableView setDataSource:self];
    [self.aTableView setDelegate:self];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    _delegate = nil;
    DESTORY(_sourceArray);
    DESTORY(_aTableView);
    DESTORY(_selectIndex);
    DESTORY(_keyField);
    [super dealloc];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_sourceArray count];
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 30)];
    [label setText:[NSString stringWithFormat:@"請選擇"]];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextColor:[UIColor darkGrayColor]];
    
    return label;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"templateSelectCellIdentifier";
    static NSString *CellIdentifier_even = @"templateSelectCellIdentifier_even";
    NSInteger row = [indexPath row];
    
    if (row % 2 == 0)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil)
        {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
            [cell setAccessoryType:UITableViewCellAccessoryNone];
            [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
            [cell.textLabel setBackgroundColor:[UIColor clearColor]];
            [cell.detailTextLabel setBackgroundColor:[UIColor clearColor]];
        }
        
        if (row == [_selectIndex integerValue])
        {
            [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        }
        else
        {
            [cell setAccessoryType:UITableViewCellAccessoryNone];
        }
        
        [cell.textLabel setText:[_sourceArray objectAtIndex:row]];
        
        return cell;
    }
    else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier_even];
        
        if (cell == nil)
        {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier_even] autorelease];
            [cell setAccessoryType:UITableViewCellAccessoryNone];
            [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
            [cell.textLabel setBackgroundColor:[UIColor clearColor]];
            [cell.detailTextLabel setBackgroundColor:[UIColor clearColor]];
            
            UIView *cellView = [[UIView alloc] init];
            [cellView setBackgroundColor:oddCellBackgroundColor];
            [cell setBackgroundView:cellView];
            [cellView release];
        }
        
        if (row == [_selectIndex integerValue])
        {
            [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        }
        else
        {
            [cell setAccessoryType:UITableViewCellAccessoryNone];
        }
        
        [cell.textLabel setText:[_sourceArray objectAtIndex:row]];
        
        return cell;
    }
    return nil;
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
    NSInteger row = [indexPath row];
    [self dismissViewControllerAnimated:YES completion:^{
        [self.delegate TempSelectItemWithItemIndex:[NSNumber numberWithInteger:row] key:_keyField];
    }];
    
}

@end
