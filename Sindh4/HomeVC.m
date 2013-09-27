//
//  HomeVC.m
//  Sindh 3
//
//  Created by Saleem Sangi on 5/27/13.
//  Copyright (c) 2013 Ignas. All rights reserved.
//

#import "HomeVC.h"
#import "JSTRRSSParser.h"
#import "AppDelegate.h"

@interface HomeVC ()

@end

@implementation HomeVC
@synthesize audioPlayer = _audioPlayer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];

    NSString *UrlString = @"http://dunyanews.tv/news.xml";
    //AsynchronousRequest to grab the data
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:UrlString]];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         if ([data length] > 0 && error == nil){
             //[self receivedData:data];
             
             NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
             JSTRRSSParser *rssParser = [[JSTRRSSParser alloc] init];
             parser.delegate = rssParser;
             [parser parse];
            AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];

             app.listArray = [rssParser getParsedList];
             NSLog(@"%@", [[app.listArray objectAtIndex:1] objectForKey:@"title"]);
             
             NSLog(@"%@", [[app.listArray objectAtIndex:1] objectForKey:@"description"]);
             
             
         }else if ([data length] == 0 && error == nil){
             //[self emptyReply];
         }else if (error != nil && error.code == NSURLErrorTimedOut){ //used this NSURLErrorTimedOut from foundation error responses
             //[self timedOut];
         }else if (error != nil){
             //[self downloadError:error];
         }
     }];
    // Do any additional setup after loading the view.
    //self.audioPlayer = [AVPlayer playerWithURL:[NSURL URLWithString:@"http://208.109.186.29:8201"]];
    //[_audioPlayer addObserver:self forKeyPath:@"status" options:0 context:&PlayerStatusContext];
    //[self.audioPlayer play];
    
    //self.view.backgroundColor  = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sindhi-ajrak3.jpg"]];
    NSString *soundUrl = @"http://208.109.186.29:8201";
    
//    //here I get mp3 file from http url via NSRequest in NSData
//    NSData *fileUrl=[[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:soundUrl]];
//    NSError *error;
//    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithData:fileUrl error:&error];
//    audioPlayer.numberOfLoops = 0;
//    if (error) {
//        NSLog(@"Error: %@",[error description]);
//    }
//    else {
//        audioPlayer.delegate = self;
//        [audioPlayer play];
//    }
    
//    NSURL *clickURL = [NSURL URLWithString:soundUrl];
//    NSData *data = [NSData dataWithContentsOfURL:clickURL];
//
//    NSError *error;
//    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc]initWithData:data error:&error];
//    [audioPlayer prepareToPlay];
//    [audioPlayer play];
    

    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    int randomIndex = arc4random() % 5 + 1 ;
    NSString *imageName= [NSString stringWithFormat:@"%i%@",randomIndex,@".jpg"];
    NSLog(@"imagenmae = %@", imageName);
    self.shairi.image=[UIImage imageNamed:imageName];
    
    NSLog(@"numbr = %i", randomIndex);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setShairi:nil];
    [super viewDidUnload];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [self.data setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.data appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSLog(@"data = %@", self.data);
}


@end
