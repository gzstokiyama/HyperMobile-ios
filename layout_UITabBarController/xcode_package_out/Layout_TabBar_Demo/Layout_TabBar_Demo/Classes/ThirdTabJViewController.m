//
//  ThirdTabJViewController.m
//  Layout_TabBar_Demo
//
//  Created by Albert Chu on 13-11-27.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import "ThirdTabJViewController.h"

@interface ThirdTabJViewController ()

@end


@implementation ThirdTabJViewController


- (id)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    //-- 表视图 -------------------------------------------------------------------------------------
    self.testTableView = [[UITableView alloc] initWithFrame:CGRectMake(0.f,
                                                                       0.f,
                                                                       App_Frame_Width,
                                                                       App_Frame_Height)
                                              style:UITableViewStyleGrouped];
    
    
    self.testTableView.dataSource = self;
    self.testTableView.delegate = self;
    [self.view addSubview:self.testTableView];
    
    
    
    self.testTableViewDataSource =
    [[ACJSONKit sharedInstance] readDataFromMainBundleBy:@"ThridTabDataSource_testTableView.json"];
    
    //DLog(@"%@", self.testTableViewDataSource);
    //---------------------------------------------------------------------------------------------;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSArray *sectionsArray = [self.testTableViewDataSource objectForKey:@"sections"];
    NSInteger numberOfSections = [sectionsArray count];
    
    return numberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *sectionsArray = [self.testTableViewDataSource objectForKey:@"sections"];
    NSDictionary *rowsDict = [sectionsArray objectAtIndex:section];
    NSArray *rowsArray = [rowsDict objectForKey:@"rows"];
    NSInteger numberOfRows = [rowsArray count];
    
    return numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = [NSString stringWithFormat:@"testTableViewCellIdentifier"];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    
    if ( nil == cell )
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    
    
    // config the cell
    NSArray *sectionsArray = [self.testTableViewDataSource objectForKey:@"sections"];
    NSDictionary *rowsDict = [sectionsArray objectAtIndex:indexPath.section];
    NSArray *rowsArray = [rowsDict objectForKey:@"rows"];
    NSDictionary *rowDict = [rowsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [rowDict objectForKey:@"title"];
    
    
    return cell;
}

- (NSString *)tableView:(UITableView *)aTableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *sectionsArray = [self.testTableViewDataSource objectForKey:@"sections"];
    NSDictionary *rowsDict = [sectionsArray objectAtIndex:section];
    NSString *titleForHeader = [rowsDict objectForKey:@"header"];
    
    return titleForHeader;
}

#pragma mark - UITableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 通过 字典中 的 key 来判断，是统一高度，还是各个 section 不同高度，还是 各个行不同高度，还是自适应高度
    
    
    return 44.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}


@end
