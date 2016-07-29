#import <UIKit/UIKit.h>
#import "LSStatusBarItem.h"

LSStatusBarItem* sbItem;

@interface SBMediaController
+ (id)sharedInstance;
- (BOOL)isRingerMuted;
- (void)setRingerMuted:(BOOL)muted;
@end

static BOOL mut;

%hook SBMediaController

-(void)setRingerMuted:(BOOL)state{
       %orig;
    if(state) {
       sbItem.visible = YES;
    } else {
       sbItem.visible = NO;
    }
}

%new
-(void)muteRinger {
mut = [[%c(SBMediaController) sharedInstance] isRingerMuted];
[[%c(SBMediaController) sharedInstance] setRingerMuted:!mut];
mut = YES;
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
