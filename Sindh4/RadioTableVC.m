//
//  RadioTableVC.m
//  Sindh 3
//
//  Created by Saleem Sangi on 5/28/13.
//  Copyright (c) 2013 Ignas. All rights reserved.
//

#import "RadioTableVC.h"
#import "RadioStations.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AudioToolbox/AudioToolbox.h>

@interface RadioTableVC (){
    BOOL open;
}
@property (nonatomic, strong) NSMutableArray*   tableData;
@property (nonatomic, strong) RadioStations*    selectedObject;
@property (nonatomic, strong) NSArray*          staticData;
- (void) resetData;
- (void) handleCellSingleTap:(UITapGestureRecognizer *)tap;
- (void) stopButtonPressed:(NSNotification *) notification;
-(void)remoteControlEventNotification:(NSNotification *)note;
@end

@implementation RadioTableVC
@synthesize tableData = _tableData;
@synthesize selectedObject = _selectedObject;
@synthesize staticData = _staticData;
@synthesize player = _player;

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

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(stopButtonPressed:)
                                                 name:@"stopBtnPressed"
                                               object:nil];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(remoteControlEventNotification:)
                                                 name:@"RemoteControlEventReceived"
                                               object:nil];
    
    if (!self.player) {
        self.player = [[MPMoviePlayerController alloc] init];
        self.player.view.hidden = YES;
        [self.view addSubview:self.player.view];

    }
    [self resetData];

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
    return [_staticData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    RadioTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    // Configure the cell...
    
    RadioStations* radio = [_tableData objectAtIndex:indexPath.row];
    
    cell.nameLbl.text= radio.name;
    
    NSLog(@"row = %i", indexPath.row);
    
    //self.player = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:radio.url]];

        if (radio.open) {
        cell.seperatorImage.image = [UIImage imageNamed:@"expand_cell_opened"];
        cell.seperatorImage.frame = CGRectMake(10.0f, 75.0f, 756.0f, 38.0f);
        //248
        //149
        //48
        UIColor* blueColor = [UIColor colorWithRed:248/255 green:149/255 blue:78/255 alpha:1.0f];
        cell.stopBtn.backgroundColor = blueColor;

    } else {
        cell.seperatorImage.image = [UIImage imageNamed:@"expand_cell_closed"];
        cell.seperatorImage.frame = CGRectMake(10.0f, 56.0f, 753.0f, 38.0f);

    }
    
    cell.buttonView.hidden = !radio.open;
    
    if ([cell.cellView.gestureRecognizers count] == 0) {
        UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleCellSingleTap:)];
        [(UIGestureRecognizer *)singleTap view].tag = indexPath.row;
        singleTap.numberOfTapsRequired = 1;
        singleTap.numberOfTouchesRequired = 1;
        [cell.cellView addGestureRecognizer:singleTap];
    }
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    RadioStations* object = [_tableData objectAtIndex:indexPath.row];
    
    if (object.open) {
        return 150.0f;
    } else {
        return 100.;
    }}


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
}


- (void) resetData {
    self.tableData = [NSMutableArray array];
    
    self.staticData = [NSArray arrayWithObjects:
                       [NSDictionary dictionaryWithObjectsAndKeys:@"http://208.109.186.29:8201", URL_KEY, @"ChalihaSahib", NAME_KEY, nil],
                       [NSDictionary dictionaryWithObjectsAndKeys:@"http://208.109.186.29:8207", URL_KEY, @"VISHWAS", NAME_KEY, nil],
                       [NSDictionary dictionaryWithObjectsAndKeys:@"http://208.109.186.29:8203", URL_KEY, @"PRIME", NAME_KEY, nil],
                       [NSDictionary dictionaryWithObjectsAndKeys:@"http://208.109.186.29:8209", URL_KEY, @"CLASSIC", NAME_KEY, nil],
                       [NSDictionary dictionaryWithObjectsAndKeys:@"http://208.109.186.29:8211", URL_KEY, @"SINDHUNAGAR", NAME_KEY, nil],
                       [NSDictionary dictionaryWithObjectsAndKeys:@"http://208.109.186.29:8205", URL_KEY, @"HD", NAME_KEY, nil],
                       nil
                       ];

    
    for (NSDictionary* each in _staticData) {
        RadioStations* radio = [RadioStations radioWithDictionaryData:each];
        [_tableData addObject:radio];
    }
}



#pragma mark - Gesture Methods
- (void) handleCellSingleTap:(UITapGestureRecognizer *)tap {
    
    if (UIGestureRecognizerStateEnded == tap.state) {
        UIView* tappedView = (UIView*) tap.view;
        RadioTableViewCell* cell = (RadioTableViewCell *) tappedView.superview.superview;
        UITableView *tableView = (UITableView *)cell.superview;
        NSIndexPath* indexPath = [tableView indexPathForCell:cell];
        
        [self.player stop];
        RadioStations* radio = [_tableData objectAtIndex:indexPath.row];
        [self.player setContentURL:[NSURL URLWithString:radio.url]];
        self.player.movieSourceType = MPMovieSourceTypeStreaming;
        [self.player play];

        NSMutableArray* updatedPaths = [NSMutableArray array];
        self.selectedObject = [_tableData objectAtIndex:indexPath.row];
        
        _selectedObject.open = !_selectedObject.open;
        [updatedPaths addObject:indexPath];
        int i = 0;
        
        for (RadioStations* each in _tableData) {
            if (![each isEqual:_selectedObject] && each.open) {
                [updatedPaths addObject:[NSIndexPath indexPathForRow:i inSection:indexPath.section]];
                each.open = FALSE;
            }
            
            i++;
        }
        
        [self.tableView reloadRowsAtIndexPaths:updatedPaths withRowAnimation:UITableViewRowAnimationFade];
    }
    else{
        UIView* tappedView = (UIView*) tap.view;
        RadioTableViewCell* cell = (RadioTableViewCell *) tappedView.superview.superview;
        cell.songName.text=@"ds";
        UITableView *tableView = (UITableView *)cell.superview;
        NSIndexPath* indexPath = [tableView indexPathForCell:cell];
        NSMutableArray* updatedPaths = [NSMutableArray array];
        [updatedPaths addObject:indexPath];
        [self.tableView reloadRowsAtIndexPaths:updatedPaths withRowAnimation:UITableViewRowAnimationFade];


    }
     
   /* UIView* tappedView = (UIView*) tap.view;
    RadioTableViewCell* cell = (RadioTableViewCell *) tappedView.superview.superview;
    cell.songName.text=@"ds";
//    UITableView *tableView = (UITableView *)cell.superview;
//    NSIndexPath* indexPath = [tableView indexPathForCell:cell];
//    NSMutableArray* updatedPaths = [NSMutableArray array];
//    [updatedPaths addObject:indexPath];
    //[self.tableView reloadRowsAtIndexPaths:updatedPaths withRowAnimation:UITableViewRowAnimationFade];*/
}


#pragma mark - Cell Notof

- (void) stopButtonPressed:(NSNotification *) notification{
    [self.player stop];
}

-(void)remoteControlEventNotification:(NSNotification *)note{
    UIEvent *event = note.object;
    if (event.type == UIEventTypeRemoteControl){
        switch (event.subtype) {
            case UIEventSubtypeRemoteControlTogglePlayPause:
                if (self.player.playbackState == MPMoviePlaybackStatePlaying){
                    [self.player pause];
                } else {
                    [self.player play];
                }
                break;
                // You get the idea.
            default:
                break;
        }
    }
}



- (void) dealloc
{
    // If you don't remove yourself as an observer, the Notification Center
    // will continue to try and send notification objects to the deallocated
    // object.
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Cell Delegate
-(void) stopBtnTapped{
    [self.player stop];
}
@end
