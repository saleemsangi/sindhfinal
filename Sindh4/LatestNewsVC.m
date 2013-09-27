//
//  LatestNewsVC.m
//  Sindh4
//
//  Created by Saleem Sangi on 9/15/13.
//  Copyright (c) 2013 Ignas. All rights reserved.
//

#import "LatestNewsVC.h"
#import "XML_Parser.h"
#import "NewsList.h"
#import "AppDelegate.h"
#import "LatestNewsDetailVC.h"

@interface LatestNewsVC ()
{
    NSMutableData *responseData;
    AppDelegate *app;
    NewsList *listItem;
}
@end

@implementation LatestNewsVC

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
   /* NSString *UrlString = @"http://dunyanews.tv/news.xml";
    //AsynchronousRequest to grab the data
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:UrlString]];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         if ([data length] > 0 && error == nil){
             //[self receivedData:data];
             NSString *txt = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
                 NSLog(@"txt %@",txt);
             NSXMLParser *XML=[[NSXMLParser alloc]initWithData:data];
             [XML setDelegate:self];
             [XML parse];
             
             XML_Parser *parser = [[XML_Parser alloc] initParser];


         }else if ([data length] == 0 && error == nil){
             //[self emptyReply];
         }else if (error != nil && error.code == NSURLErrorTimedOut){ //used this NSURLErrorTimedOut from foundation error responses
             //[self timedOut];
         }else if (error != nil){
             //[self downloadError:error];
         }
     }];*/
    
//    NSString *UrlString = @"http://dunyanews.tv/news.xml";
//    //AsynchronousRequest to grab the data
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:UrlString]];
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    
//    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
//     {
//         if ([data length] > 0 && error == nil){
//             //[self receivedData:data];
//             
//             NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
//             JSTRRSSParser *rssParser = [[JSTRRSSParser alloc] init];
//             parser.delegate = rssParser;
//             [parser parse];
//             
//             self.articleList = [rssParser getParsedList];
//             [self.tableView reloadData];
//             NSLog(@"%@", [[self.articleList objectAtIndex:1] objectForKey:@"title"]);
//             
//             NSLog(@"%@", [[self.articleList objectAtIndex:1] objectForKey:@"description"]);
//             
//             
//         }else if ([data length] == 0 && error == nil){
//             //[self emptyReply];
//         }else if (error != nil && error.code == NSURLErrorTimedOut){ //used this NSURLErrorTimedOut from foundation error responses
//             //[self timedOut];
//         }else if (error != nil){
//             //[self downloadError:error];
//         }
//     }];
//
}

//- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
//  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
//    attributes:(NSDictionary *)attributeDict {
//    if([elementName isEqualToString:@"channel"]) {
//        app.listArray = [[NSMutableArray alloc] init];
//    }
//    
//    else if([elementName isEqualToString:@"item"]) {
//    }
//    
//    else if([elementName isEqualToString:@"title"]){
//        listItem = [[NewsList alloc] init];
//        listItem.title = elementName;//[attributeDict objectForKey:@"title"];
//        //aAnimal = [[Animal alloc] init];
//        //aAnimal.animalID = elementName;
//    }
//}
//
//- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
//    if(!currentElementValue)
//        currentElementValue = [[NSMutableString alloc] initWithString:string];
//    else
//        [currentElementValue appendString:string];
//}
//
//- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
//  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
//    
//    if([elementName isEqualToString:@"channel"])
//        return;
//    else if([elementName isEqualToString:@"item"]) {
//    }
//    else if([elementName isEqualToString:@"title"]) {
//        [app.listArray addObject:listItem];
//    }
//    else
//        [listItem setValue:currentElementValue forKey:elementName];
//    
//    currentElementValue = nil;
//}


/*
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    
    if ([elementName isEqualToString:@"channel"]) {
        NSLog(@"found channel");
        app.listArray = [[NSMutableArray alloc]init];
    }
    else if([elementName isEqualToString:@"item"]){
        listItem = [[NewsList alloc] init];
        listItem.title = [attributeDict objectForKey:@"title"];
        listItem.description = [attributeDict objectForKey:@"description"];

    }
    
        
    
}


-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    if (!currentElementValue) {
        currentElementValue = [[NSMutableString alloc] initWithString:string];
        
    }
    else
        [currentElementValue appendString:string];
}


-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
    // trim whitespace from left and right and replace commonly encoded html string
    NSString *content = [currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    content = [content stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@""];
    content = [content stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
    content = [content stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    content = [content stringByReplacingOccurrencesOfString:@"&shy;" withString:@"-"];
    content = [content stringByReplacingOccurrencesOfString:@"&raquo;" withString:@">>"];
    content = [content stringByReplacingOccurrencesOfString:@"&middot;" withString:@"-"];
    content = [content stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    content = [content stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    

    
    
    if ([elementName isEqualToString:@"channel"]) {
        return;
    }
    
    if ([elementName isEqualToString:@"item"]) {
        [app.listArray addObject:listItem];
        listItem = nil;
    }
    else{
        NSLog(@"element name = %@", elementName);
        
        [listItem setValue:currentElementValue forKey:elementName];
    }
    
    currentElementValue = nil;
}


- (void)parserDidEndDocument:(NSXMLParser *)parser{
    
    if (parser) {
//        NSLog(@"array count = %i", [app.listArray count]);
//        for (int i = 0; i<[app.listArray count]; i++) {
//            NSString *title = [[app.listArray objectAtIndex:0]valueForKey:@"title"]; //Replace index with the index you want and/or the key.
//            NSLog(@"title  = %@", title);
//            //NSLog(@"array = %@", [app.listArray objectAtIndex:i]);
        [self.tableView reloadData];

    }
}
*/
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70.00;
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSLog(@"count %i",[app.listArray count]);
    return [app.listArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if ([app.listArray count]>0) {
        
        cell.textLabel.text = [[app.listArray objectAtIndex:indexPath.row] objectForKey:@"title"];
        NSString *description=[[app.listArray objectAtIndex:indexPath.row] objectForKey:@"description"];
        NSString *stringWithOutName = [description
                                         stringByReplacingOccurrencesOfString:@"(Dunya News)" withString:@""];
        cell.detailTextLabel.text= stringWithOutName;
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
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    [self performSegueWithIdentifier:@"SegueToDetailNews" sender:self];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"SegueToDetailNews"])
    {
        LatestNewsDetailVC *dest = [segue destinationViewController];
        dest.index = [self.tableView indexPathForSelectedRow].row;
    }
}

@end
