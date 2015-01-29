//
//  xxiivvViewController.m
//  Oquonie
//
//  Created by Devine Lu Linvega on 2013-07-08.
//  Copyright (c) 2013 XXIIVV. All rights reserved.
//

#import "xxiivvVariables.h"
#import "xxiivvSettings.h"
#import "xxiivvWorld.h"
#import "xxiivvViewController.h"

@implementation xxiivvViewController (Templates)

-(void)templateStart
{
    UIDevice * device = [UIDevice currentDevice];
    switch(device.orientation)
    {
        case UIDeviceOrientationPortrait:
            NSLog(@">  TMPL | Portrait");
            [self templatePortraitStart];
            break;
            
        case UIDeviceOrientationPortraitUpsideDown:
            NSLog(@">  TMPL | Portrait");
            [self templatePortraitStart];
            break;
            
        case UIDeviceOrientationLandscapeLeft:
            NSLog(@">  TMPL | Landscape");
            [self templateLandscapeStart];
            break;
            
        case UIDeviceOrientationLandscapeRight:
            NSLog(@">  TMPL | Landscape");
            [self templateLandscapeStart];
            break;
            
        default:
            [self templatePortraitStart];
            break;
    };
    
    if([[UIDevice currentDevice] orientation] == 5){
        [self templatePortraitStart];
    }

}

-(void)templatePortraitStart
{
    NSLog(@">  TMPL | Loading Landscape Template..");
    screen = [[UIScreen mainScreen] bounds];
    screenMargin = screen.size.width/10;
    
    viewWidth = screen.size.width - (2*screenMargin);
    tileW = viewWidth/3;
    tileH = tileW * 0.5;
    
    centerW = (screen.size.width/2)-(tileW/2);
    centerH = (screen.size.height/2)-(tileH/2);
    
    self.floor00.frame = [position tile:0 :0 :0];
    self.floor1e.frame = [position tile:0 :-1 :1];
    self.floore1.frame = [position tile:0 :1 :-1];
    self.floor10.frame = [position tile:0 :1 :0];
    self.floor01.frame = [position tile:0 :0 :1];
    self.floor0e.frame = [position tile:0 :0 :-1];
    self.floore0.frame = [position tile:0 :-1 :0];
    self.floor11.frame = [position tile:0 :1 :1];
    self.flooree.frame = [position tile:0 :-1 :-1];
    
    self.wall1l.frame = [position tile:5 :2 :-1];
    self.wall2l.frame = [position tile:5 :2 : 0];
    self.wall3l.frame = [position tile:5 :2 : 1];
    
    self.wall1r.frame = [position tile:5 : -1 : 2];
    self.wall2r.frame = [position tile:5 : 0 : 2];
    self.wall3r.frame = [position tile:5 : 1 : 2];
    
    self.step1l.frame = [position tile:0 :1 :-2];
    self.step2l.frame = [position tile:0 :0 :-2];
    self.step3l.frame = [position tile:0 :-1 :-2];
    
    self.step1r.frame = [position tile:0 :-2 : -1];
    self.step2r.frame = [position tile:0 :-2 : 0];
    self.step3r.frame = [position tile:0 :-2 : 1];
    
    self.userPlayer.tag = 404;
    self.userPlayer.frame = [position tile:4 :0 :0];
    
    self.userPlayerChar.image = [UIImage imageNamed: [NSString stringWithFormat:@"%@", [self templateSpriteName:@"2"] ] ];
    
    self.userPlayerChar.frame = CGRectMake(0, 0, self.userPlayer.frame.size.width, self.userPlayer.frame.size.height);
    
    self.userPlayerShadow.frame = self.userPlayerChar.frame;
    self.userPlayerShadow.image = [UIImage imageNamed:@"fx.shadow.png"];
    
    float textBlock = ( screen.size.width - (2*screenMargin) )/4;
    
    textBlock1 = CGRectMake(screenMargin+(0*textBlock), screen.size.height-(textBlock*2), textBlock, textBlock);
    textBlock2 = CGRectMake(screenMargin+(1*textBlock), screen.size.height-(textBlock*2), textBlock, textBlock);
    textBlock3 = CGRectMake(screenMargin+(2*textBlock), screen.size.height-(textBlock*2), textBlock, textBlock);
    textBlock4 = CGRectMake(screenMargin+(3*textBlock), screen.size.height-(textBlock*2), textBlock, textBlock);
    
    self.dialogView.frame = CGRectMake(0, screen.size.height-screen.size.width, screen.size.width, screen.size.width);
    
    self.dialogCharacterWarpper.frame = CGRectMake(self.dialogView.frame.size.width/15, self.dialogView.frame.size.height/1.7, self.dialogView.frame.size.width/5.5*2.5, self.dialogView.frame.size.width/5.5);
    
    float letterSize = self.dialogCharacterWarpper.frame.size.height;
    float letterSizeMargin = letterSize/8;
    
    self.dialogCharacter1.frame = CGRectMake(0, 0, letterSize, letterSize);
    self.dialogCharacter2.frame = CGRectMake(letterSize-letterSizeMargin, 0, letterSize, letterSize);
    self.dialogCharacter3.frame = CGRectMake((letterSize*2)-(2*letterSizeMargin), 0, letterSize, letterSize);
    
    self.mapImage.alpha = 0;
    self.mapImage.backgroundColor = [UIColor whiteColor];
    
    // Dialog
    portraitOrigin = self.dialogCharacter.frame;
    bubbleOrigin = self.dialogBubble.frame;
    char1Origin = self.dialogCharacter1.frame;
    char2Origin = self.dialogCharacter2.frame;
    char3Origin = self.dialogCharacter3.frame;
    
    self.spellCharacter1.frame = CGRectMake((screen.size.width/2)-((tileW/2)*1.5), 0, tileW/2, tileW/2);
    self.spellCharacter2.frame = CGRectMake((screen.size.width/2)-((tileW/2)/2), 0, tileW/2, tileW/2);
    self.spellCharacter3.frame = CGRectMake((screen.size.width/2)+((tileW/2)*0.5), 0, tileW/2, tileW/2);
    
    // Spellbook
    spellCharacter1Origin = self.spellCharacter1.frame;
    spellCharacter2Origin = self.spellCharacter2.frame;
    spellCharacter3Origin = self.spellCharacter3.frame;
    
    self.dialogCharacter.frame = portraitOrigin;
    self.dialogCharacter.alpha = 0;
    self.dialogBubble.frame = bubbleOrigin;
    self.dialogBubble.alpha = 0;
    self.dialogCharacter1.alpha = 0;
    self.dialogCharacter2.alpha = 0;
    self.dialogCharacter3.alpha = 0;
    
    self.debugLocation.hidden = YES;
    self.creditsImage.hidden = YES;
    
    self.saveIndicator.alpha = 0;
}

-(void)templateLandscapeStart
{
    NSLog(@">  TMPL | Loading Landscape Template..");
    screen = [[UIScreen mainScreen] bounds];
    screenMargin = screen.size.width/20;
    
    viewWidth = (screen.size.width - (2*screenMargin))/2;
    tileW = viewWidth/3;
    tileH = tileW * 0.5;
    
    centerW = (screen.size.width/2)-(tileW/2);
    centerH = (screen.size.height/2)+(tileH/2);
    
    self.floor00.frame = [position tile:0 :0 :0];
    self.floor1e.frame = [position tile:0 :-1 :1];
    self.floore1.frame = [position tile:0 :1 :-1];
    self.floor10.frame = [position tile:0 :1 :0];
    self.floor01.frame = [position tile:0 :0 :1];
    self.floor0e.frame = [position tile:0 :0 :-1];
    self.floore0.frame = [position tile:0 :-1 :0];
    self.floor11.frame = [position tile:0 :1 :1];
    self.flooree.frame = [position tile:0 :-1 :-1];
    
    self.wall1l.frame = [position tile:5 :2 :-1];
    self.wall2l.frame = [position tile:5 :2 : 0];
    self.wall3l.frame = [position tile:5 :2 : 1];
    
    self.wall1r.frame = [position tile:5 : -1 : 2];
    self.wall2r.frame = [position tile:5 : 0 : 2];
    self.wall3r.frame = [position tile:5 : 1 : 2];
    
    self.step1l.frame = [position tile:0 :1 :-2];
    self.step2l.frame = [position tile:0 :0 :-2];
    self.step3l.frame = [position tile:0 :-1 :-2];
    
    self.step1r.frame = [position tile:0 :-2 : -1];
    self.step2r.frame = [position tile:0 :-2 : 0];
    self.step3r.frame = [position tile:0 :-2 : 1];
    
    self.userPlayer.tag = 404;
    self.userPlayer.frame = [position tile:4 :0 :0];
    
    self.userPlayerChar.image = [UIImage imageNamed: [NSString stringWithFormat:@"%@", [self templateSpriteName:@"2"] ] ];
    
    self.userPlayerChar.frame = CGRectMake(0, 0, self.userPlayer.frame.size.width, self.userPlayer.frame.size.height);
    
    self.userPlayerShadow.frame = self.userPlayerChar.frame;
    self.userPlayerShadow.image = [UIImage imageNamed:@"fx.shadow.png"];
    
    float textBlock = ( screen.size.width - (2*screenMargin) )/4;
    
    textBlock1 = CGRectMake(screenMargin+(0*textBlock), screen.size.height-(textBlock*2), textBlock, textBlock);
    textBlock2 = CGRectMake(screenMargin+(1*textBlock), screen.size.height-(textBlock*2), textBlock, textBlock);
    textBlock3 = CGRectMake(screenMargin+(2*textBlock), screen.size.height-(textBlock*2), textBlock, textBlock);
    textBlock4 = CGRectMake(screenMargin+(3*textBlock), screen.size.height-(textBlock*2), textBlock, textBlock);
    
    self.dialogView.frame = CGRectMake(0, screen.size.height-screen.size.width, screen.size.width, screen.size.width);

    self.dialogView.frame = CGRectMake( (screen.size.width/2)-(screen.size.height/2), tileH/3, screen.size.height, screen.size.height);
    
    self.dialogCharacterWarpper.frame = CGRectMake(self.dialogView.frame.size.width/15, self.dialogView.frame.size.height/1.7, self.dialogView.frame.size.width/5.5*2.5, self.dialogView.frame.size.width/5.5);
    
    float letterSize = self.dialogCharacterWarpper.frame.size.height;
    float letterSizeMargin = letterSize/8;
    
    self.dialogCharacter1.frame = CGRectMake(0, 0, letterSize, letterSize);
    self.dialogCharacter2.frame = CGRectMake(letterSize-letterSizeMargin, 0, letterSize, letterSize);
    self.dialogCharacter3.frame = CGRectMake((letterSize*2)-(2*letterSizeMargin), 0, letterSize, letterSize);
    
    self.mapImage.alpha = 0;
    self.mapImage.backgroundColor = [UIColor whiteColor];
    
    // Dialog
    portraitOrigin = self.dialogCharacter.frame;
    bubbleOrigin = self.dialogBubble.frame;
    char1Origin = self.dialogCharacter1.frame;
    char2Origin = self.dialogCharacter2.frame;
    char3Origin = self.dialogCharacter3.frame;
    
    self.spellCharacter1.frame = CGRectMake((screen.size.width/2)-((tileW/2)*1.5), 0, tileW/2, tileW/2);
    self.spellCharacter2.frame = CGRectMake((screen.size.width/2)-((tileW/2)/2), 0, tileW/2, tileW/2);
    self.spellCharacter3.frame = CGRectMake((screen.size.width/2)+((tileW/2)*0.5), 0, tileW/2, tileW/2);
    
    // Spellbook
    spellCharacter1Origin = self.spellCharacter1.frame;
    spellCharacter2Origin = self.spellCharacter2.frame;
    spellCharacter3Origin = self.spellCharacter3.frame;
    
    self.dialogCharacter.frame = portraitOrigin;
    self.dialogCharacter.alpha = 0;
    self.dialogBubble.frame = bubbleOrigin;
    self.dialogBubble.alpha = 0;
    self.dialogCharacter1.alpha = 0;
    self.dialogCharacter2.alpha = 0;
    self.dialogCharacter3.alpha = 0;
    
    self.debugLocation.hidden = YES;
    self.creditsImage.hidden = YES;
    
    self.saveIndicator.alpha = 0;
    
}

- (void) templateRoomAnimation
{
	for (UIView *subview in [self.roomContainer subviews]) {
		float delay = (arc4random()%30)+1;
		
		if (subview.tag == 100 || subview.tag == 200) {
			CGRect origin = subview.frame;
			subview.frame = CGRectOffset(subview.frame, 0, 5);
			subview.alpha = 0;
			[UIView beginAnimations: @"Fade In" context:nil];
			[UIView setAnimationDuration:(delay/50)];
			[UIView setAnimationDelay:0];
			subview.frame = origin;
			subview.alpha = 1;
			[UIView commitAnimations];
		}
	}
}


- (NSString *) templateSpriteName :(NSString*) mod
{
	NSString *spriteName = @"";
	
	// Remove mod if looking back
	if( [[user state] isEqual:@"stand"] && [[user vertical] isEqualToString:@"b"]){
		mod = @"1";
	}
	// If there is no mod
	if([mod isEqualToString:@""]){
		mod = @"1";
	}
	
	spriteName = [NSString stringWithFormat:@"char%d.%@.%@.%@.%@.png", [user character], [user state], [user horizontal], [user vertical],mod];
	return spriteName;
}

@end