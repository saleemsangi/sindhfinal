//
//  NewsPaperTableVC.m
//  Sindh 3
//
//  Created by Saleem Sangi on 5/27/13.
//  Copyright (c) 2013 Ignas. All rights reserved.
//

#import "NewsPaperTableVC.h"
#import "NewsPaperTableViewCell.h"
#import "NewsPaperDetailVC.h"

@interface NewsPaperTableVC ()
{
    NSArray *arrayNewsPaper;
}
@end

@implementation NewsPaperTableVC
@synthesize tableView = _tableView;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationController.navigationBar.tintColor = [UIColor blackColor];

    arrayNewsPaper = [[NSArray alloc]initWithObjects:
                      @"Awami Awaz, Karachi",
                      // @"Gulful",
                     // @"Halar",
                      @"Halchal",  
                      @"Hilal-e-Pakistan, Hyderabad",
                      @"Ibrat, Hyderabad",
                      @"Kawish, Hyderabad",
                     // @"Khadim-e-Watan",
                      //@"Koshish",
                      @"Mehran, Hyderabad",
                      //@"Nai Zindagi",
                      //@"Parish",
                      //@"Sham",
                      @"Tameer-e-Sindh",
                      @"The Daily Nijat: Sukkur, Karachi",
                      //@"Udhar",
                      nil];
    
    //sindhu
    
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

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [arrayNewsPaper count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomCell";
    NewsPaperTableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[NewsPaperTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    //cell.imageView.image = [UIImage imageNamed:@"kawish.jpg"];

    //cell.textLabel.text=[arrayNewsPaper objectAtIndex:indexPath.row];
    
    cell.testlbl.text = @"ds";
    switch (indexPath.row) {
        case 0:
            cell.imageOfNews.image = [UIImage imageNamed:@"awami awaz.jpg"];
            break;
        case 1:
            cell.imageOfNews.image = [UIImage imageNamed:@"hal chal.jpg"];
            break;
        case 2:
            cell.imageOfNews.image = [UIImage imageNamed:@"Hilal logo.gif"];
            break;
        case 3:
            cell.imageOfNews.image = [UIImage imageNamed:@"ibrat.jpg"];
            break;
        case 4:
            cell.imageOfNews.image = [UIImage imageNamed:@"kawish.jpg"];
            break;
        case 5:
            cell.imageOfNews.image = [UIImage imageNamed:@"Media daily Mehran.jpg"];
            break;
        case 6:
            cell.imageOfNews.image = [UIImage imageNamed:@"Tameer-e-Sindh.jpg"];
            break;
        case 7:
            cell.imageOfNews.image = [UIImage imageNamed:@"dailynijat.jpg"];
            break;
        default:
            break;
    }
    cell.newsTitle.text = [arrayNewsPaper objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
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



#pragma mark - segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"SegueToNewsDetail"])
    {
        // Get reference to the destination view controller
        NewsPaperDetailVC *detailVC = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        NSIndexPath *indexPath = [_tableView indexPathForSelectedRow];
        detailVC.selectedCell = indexPath.row;
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    [self performSegueWithIdentifier:@"SegueToNewsDetail" sender:self];
}

@end
