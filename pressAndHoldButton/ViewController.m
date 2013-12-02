//
//  ViewController.m
//  pressAndHoldButton
//
//  Created by Gabriel Massana on 12/2/13.
//  Copyright (c) 2013 Gabriel Massana. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *pressButton;
@property (nonatomic, strong) NSTimer  *timerDown;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Idea
    // http://stackoverflow.com/questions/903114/way-to-make-a-uibutton-continuously-fire-during-a-press-and-hold-situation
    
    self.pressButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.pressButton setFrame:CGRectMake(20, 50, 280, 50)];
    [self.pressButton setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:self.pressButton];
    
    [self.pressButton addTarget:self action:@selector(down:) forControlEvents:UIControlEventTouchDown];
    [self.pressButton addTarget:self action:@selector(up:) forControlEvents:UIControlEventTouchUpInside];
    [self.pressButton addTarget:self action:@selector(up:) forControlEvents:UIControlEventTouchUpOutside];
}

- (void) down:(id) sender
{
    self.timerDown = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(print:) userInfo:Nil repeats:YES];
}

- (void) up:(id) sender
{
    [self.timerDown invalidate];
}

- (void) print:(id) sender
{
    NSLog(@"down");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
