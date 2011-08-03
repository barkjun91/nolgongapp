//
//  HelloWorldLayer.m
//  nolgongapp
//
//  Created by Nolgong Powerhouse on 8/1/11.
//  Copyright Nolgong 2011. All rights reserved.
//


// Import the interfaces
#import "FieldLayer.h"

// HelloWorldLayer implementation
@implementation FieldLayer

@synthesize buildingSprite, buildingOpenAnimation;


enum{
    kTag_Building  
};
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	FieldLayer *layer = [FieldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
//        self.isTouchEnabled = YES;
        
        // 화면의 픽셀 크기를 구함.
        winSize = [[CCDirector sharedDirector] winSize];
        
        [self createBuildingAniation];
        
	}
	return self;
}

-(void)createBuildingAniation{
    
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"building.sprites"];
    
    NSMutableArray *aniFrames = [NSMutableArray array];
    NSMutableArray *aniFramesList = [[NSMutableArray alloc] initWithObjects: @"1", @"2", @"3", @"4", @"5", @"6", @"7", nil];
    for(int idx=0; idx < [aniFramesList count]; idx++){
        NSString *image_name = [NSString stringWithFormat:@"building%@.png", [aniFramesList objectAtIndex:idx]];
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:image_name];
        [aniFrames addObject:frame];
    }
    
    CCAnimation *openAnimation =[[CCAnimation alloc] initWithName:@"building_open" delay:0.2f frames:aniFrames];
    self.buildingOpenAnimation = openAnimation;
    [openAnimation release];
 
    CCSprite *sprite = [CCSprite spriteWithSpriteFrameName:@"building1.png"];
    self.buildingSprite = sprite;
    [self addChild:self.buildingSprite z:kTag_Building tag:kTag_Building];
    
    self.buildingSprite.anchorPoint = ccp(512, 354);
    
    self.buildingSprite.position = ccp(winSize.width / 2, 13);
    
    [sprite release];
}

- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
