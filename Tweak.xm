#import <UIKit/UIKit.h>
#import "LSStatusBarItem.h"

LSStatusBarItem* sbItem = nil;

%hook SBMediaController

-(void)setRingerMuted:(BOOL)state{
       %orig;
    if(state) {
       sbItem.visible = YES;
    } else {
       sbItem.visible = NO;
    }
}

%end

%hook SpringBoard

-(void)_updateRingerState:(int)state withVisuals:(BOOL)visuals updatePreferenceRegister:(BOOL)aRegister{
       %orig;
    sbItem.visible = !state;

}

- (void)applicationDidFinishLaunching:(id)arg1 {
        %orig;
    sbItem = [[NSClassFromString(@"LSStatusBarItem") alloc] initWithIdentifier:@"com.lizynz.mute" alignment:StatusBarAlignmentRight];
    sbItem.imageName = @"mute";
    sbItem.visible = NO;
}

%end