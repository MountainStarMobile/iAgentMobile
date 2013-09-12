//
//  SearchTableViewController.m
//  iAgent
//
//  Created by sinss on 13/5/21.
//  Copyright (c) 2013年 Good-idea Consulgint Inc. All rights reserved.
//

#import "SearchTableViewController.h"
#import "TemplateSelectViewController.h"
#import "shareFunction.h"
#import "SearchFooterView.h"
#import "inputFieldCell.h"
#import "switchCell.h"

@interface SearchTableViewController () <tempSelectItemProtocol, UITextFieldDelegate, SwitchCellProtocol>

@property (nonatomic, retain) NSMutableString *searchKey;
@property (assign) BOOL locationInd;
@property (nonatomic, retain) NSArray *searchFields;
@property (nonatomic, retain) NSMutableDictionary *searchValues;
@property (nonatomic, retain) NSMutableDictionary *searchIndexes;
@property (nonatomic, retain) NSArray *sourceArray;

- (void)createTableFooterView;

@end

@implementation SearchTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        self.searchKey = [NSMutableString stringWithCapacity:0];
        self.searchFields = [NSArray arrayWithObjects:
                             kCompanyType,
                             kCompanyName,
                             kServiceArea,
                             kJobTitle,
                             kServicePeriod,
                             kEducation,
                             kLicense, nil];
        self.searchValues = [NSMutableDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"不拘",@"不拘",@"不拘",@"不拘",@"不拘",@"不拘",@"不拘",nil] forKeys:_searchFields];
        self.searchIndexes = [NSMutableDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[NSNumber numberWithInteger:0], [NSNumber numberWithInteger:0], [NSNumber numberWithInteger:0], [NSNumber numberWithInteger:0], [NSNumber numberWithInteger:0], [NSNumber numberWithInteger:0], [NSNumber numberWithInteger:0], nil] forKeys:_searchFields];
        self.locationInd = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView setTableFooterView:[[[UIView alloc] initWithFrame:CGRectZero] autorelease]];
    self.title = [NSString stringWithFormat:@"Search"];
    //[self createTableFooterView];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    DESTORY(_searchKey);
    DESTORY(_searchFields);
    DESTORY(_sourceArray);
    DESTORY(_searchValues);
    [super dealloc];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == SearchViewSectionKeyword)
        return 1;
    else if (section == SearchViewSectionFields)
        return [_searchFields count];
    else if (section == SearchViewSectionArea)
        return 1;
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *searchKeyWordCellIdentifier = @"searchKeyWordCellIdentifier";
    static NSString *searchAreaCellIdentifier = @"searchAreaCellIdentifier";
    static NSString *CellIdentifier = @"searchFieldCellIdentifier";
    static NSString *searchButtonCellIdentifier = @"searchButtonCellIdentifier";
    NSInteger sec = [indexPath section];
    NSInteger row = [indexPath row];
    if (sec == SearchViewSectionKeyword)
    {
        inputFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:searchKeyWordCellIdentifier];
        
        if (cell == nil)
        {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"inputFieldCell" owner:self options:nil] objectAtIndex:0];
            [cell setAccessoryType:UITableViewCellAccessoryNone];
            [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
        }
        [cell.inputField setDelegate:self];
        [cell.inputField setText:_searchKey];
        return cell;
    }
    else if (sec == SearchViewSectionFields)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil)
        {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
            [cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
            [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
        }
        NSString *key = [_searchFields objectAtIndex:row];
        [cell.textLabel setText:[[shareFunction shareFunctionInstance] GetSearchFieldNameWithKey:key]];
        [cell.detailTextLabel setText:[_searchValues valueForKey:key]];
        return cell;
    }
    else if (sec == SearchViewSectionArea)
    {
        switchCell *cell = [tableView dequeueReusableCellWithIdentifier:searchAreaCellIdentifier];
        
        if (cell == nil)
        {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"switchCell" owner:self options:nil] objectAtIndex:0];
            [cell setAccessoryType:UITableViewCellAccessoryNone];
            [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
        }
        [cell setDelegate:self];
        [cell.aSwitch setOn:_locationInd];
        [cell.titleLabel setText:@"附近區域"];
        return cell;
    }
    else if (sec == SearchViewSectionSearchButton)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:searchButtonCellIdentifier];
        
        if (cell == nil)
        {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:searchButtonCellIdentifier] autorelease];
            [cell setAccessoryType:UITableViewCellAccessoryNone];
            [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
            [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
            [cell.textLabel setTextColor:[UIColor darkGrayColor]];
            [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18]];
        }
        
        [cell.textLabel setText:[NSString stringWithFormat:@"搜尋"]];
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
    /*
     #define kCompanyType @"companyType.key"
     #define kCompanyName @"companyName.key"
     #define kServiceArea @"serviceArea.key"
     #define kJobTitle @"jobTitle.key"
     #define kServicePeriod @"servicePeriod.key"
     #define kEducation @"education.key"
     #define kLicense @"license.key"
     */
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSInteger sec = [indexPath section];
    NSInteger row = [indexPath row];
    if (sec == SearchViewSectionFields)
    {
        NSString *keyfield = [_searchFields objectAtIndex:row];
        if ([keyfield isEqualToString:kCompanyName])
        {
            self.sourceArray = [NSArray arrayWithObjects:
                           @"不拘",
                           @"三商美邦人壽",
                           @"南山人壽",
                           @"國泰人壽",
                           @"新光人壽",
                           @"中國信託人壽",
                           @"國寶人壽", nil];
        }
        else if ([keyfield isEqualToString:kCompanyType])
        {
            self.sourceArray = [NSArray arrayWithObjects:
                                @"不拘",
                                @"人身壽險",
                                @"證券",
                                @"銀行",
                                @"軟體服務業",
                                @"系統整合",
                                @"物流", nil];
        }
        else if ([keyfield isEqualToString:kServiceArea])
        {
            self.sourceArray = [NSArray arrayWithObjects:
                                @"不拘",
                                @"北北基",
                                @"桃竹苗",
                                @"中彰投",
                                @"台南高雄",
                                @"花東",
                                @"海外", nil];
        }
        else if ([keyfield isEqualToString:kJobTitle])
        {
            self.sourceArray = [NSArray arrayWithObjects:
                                @"不拘",
                                @"業務主任",
                                @"業務襄理",
                                @"業務經理",
                                @"營業處經理",
                                @"業務總監",
                                @"業務副總",
                                @"理財專員",
                                @"執行副總",
                                @"CEO", nil];
        }
        else if ([keyfield isEqualToString:kServicePeriod])
        {
            self.sourceArray = [NSArray arrayWithObjects:
                                @"不拘",
                                @"1~5年",
                                @"6~10年",
                                @"11~15年",
                                @"16~20年",
                                @"21~25年",
                                @"26年以上", nil];
        }
        else if ([keyfield isEqualToString:kEducation])
        {
            self.sourceArray = [NSArray arrayWithObjects:
                                @"不拘",
                                @"國中以下",
                                @"國中",
                                @"高中",
                                @"大專/大學",
                                @"碩士",
                                @"博士", nil];
        }
        else if ([keyfield isEqualToString:kLicense])
        {
            self.sourceArray = [NSArray arrayWithObjects:
                                @"不拘",
                                @"金融證照",
                                @"壽險證照",
                                @"投資型證照",
                                @"外幣證照",
                                @"產險證照", nil];
        }
        TemplateSelectViewController *selectView = [[TemplateSelectViewController alloc] initWithNibName:@"TemplateSelectViewController" bundle:nil];
        [selectView setModalTransitionStyle:UIModalTransitionStylePartialCurl];
        [selectView setSourceArray:_sourceArray];
        [selectView setKeyField:keyfield];
        [selectView setSelectIndex:[_searchIndexes valueForKey:keyfield]];
        [selectView setDelegate:self];
        [self presentViewController:selectView animated:YES completion:nil];
        DESTORY(selectView);
    }
}

#pragma mark - UITextFieldDeleate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *searchKey = [[textField text] stringByReplacingCharactersInRange:range withString:string];
    [self.searchKey setString:searchKey];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - SwitchCell value Change
- (void)switchCell:(switchCell *)cell didSwitchChangeValue:(BOOL)value
{
    _locationInd = value;
}

#pragma mark - tempSelectItem Protocol
- (void)TempSelectItemWithItemIndex:(NSNumber *)index key:(NSString *)aKey
{
    NSInteger row = [_searchFields indexOfObject:aKey];
    [self.searchIndexes setValue:index forKey:aKey];
    [self.searchValues setValue:[_sourceArray objectAtIndex:[index integerValue]] forKey:aKey];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:row inSection:SearchViewSectionFields]] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark create Table header View
- (void)createTableFooterView
{
    SearchFooterView *footerView = [[[NSBundle mainBundle] loadNibNamed:@"searchFooterView" owner:self options:nil] objectAtIndex:0];

    [self.tableView setTableFooterView:footerView];
}

@end
