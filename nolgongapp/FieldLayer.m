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

@synthesize mappingSprite;
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
        self.isTouchEnabled = YES;
        
        // 화면의 픽셀 크기를 구함.
        winSize = [[CCDirector sharedDirector] winSize];
        
        [self createBackGround];
        [self createMapping];
        [self createBuildingAniation];
        
	}
	return self;
}
-(void)createBackGround{
//    CCSprite *sprite = [CCSprite spriteWithFile:@"background.png"];
//    sprite.position = ccp(winSize.width/2, winSize.height/2);
//    [self addChild:sprite];
    
    CCSprite *sprite = [CCSprite spriteWithFile:@"back1.png"];
    sprite.position = ccp(512.0f, 384.0f);
    [self addChild:sprite];
}
-(void)createMapping{
    self.mappingSprite = [UIImage imageNamed:@"mapping.png"];
}
-(void)createBuildingAniation{
    
    NSMutableArray *aniFrames = [NSMutableArray array];
    NSMutableArray *aniFramesList = [[NSMutableArray alloc] initWithObjects: @"1", @"2", @"3", @"4", @"5", @"6", @"7", nil];
    
    CCTexture2D *texture;
    CGSize textureSize;
    CGRect textureRect;
    CCSpriteFrame *spriteFrame;
   for(int idx=0; idx < [aniFramesList count]; idx++){
        NSString *image_name = [NSString stringWithFormat:@"building%@.png", [aniFramesList objectAtIndex:idx]];
        NSLog(@"%@", image_name);
        texture = [[CCTextureCache sharedTextureCache] addImage:image_name];
        textureSize = [texture contentSize];
        textureRect = CGRectMake(0, 0, textureSize.width, textureSize.height);
        spriteFrame = [CCSpriteFrame frameWithTexture:texture rect:textureRect];
        [aniFrames addObject:spriteFrame];
    }
    
    CCAnimation *openAnimation =[[CCAnimation alloc] initWithName:@"building_open" delay:0.2f frames:aniFrames];
    CCAnimate *animate = [[CCAnimate alloc] initWithAnimation:openAnimation restoreOriginalFrame:NO];
    self.buildingOpenAnimation = animate;

    
    self.buildingSprite = [CCSprite spriteWithFile:@"building1.png"];
    self.buildingSprite.position = ccp(199.0f, 352.0f);
    [self addChild:self.buildingSprite];
    
    /*
     
    ### 이건 texture Editer 구해지면 하자 흐규흐규 ㅠㅠ_ㅠ
     
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
    */
}
#pragma mark -
#pragma mark Touch Event Handling
-(BOOL)isTouchInside:(CCSprite*)sprite withTouch:(UITouch*)touch {
    // Cocoa 좌표 
	CGPoint location = [touch locationInView: [touch view]];
    
    // Cocoa 좌표를 cocos2d 좌표로 변환합니다
	CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
    
    CGFloat halfWidth = sprite.contentSize.height / 2.0;
    CGFloat halfHeight = sprite.contentSize.height / 2.0;
    
    
    //unsigned char pixel[4];
    
    //glReadPixels(convertedLocation.x, convertedLocation.y, 1, 1,GL_RGBA, GL_UNSIGNED_BYTE, pixel);
    
    //NSLog(@"pixel %d %d %d", pixel[0], pixel[1], pixel[2]);
    
/*
    if(){
        NSLog(@"알파당!!");
    }
 */
    if(convertedLocation.x > (sprite.position.x + halfWidth) ||
       convertedLocation.x < (sprite.position.x - halfWidth) ||
       convertedLocation.y < (sprite.position.y - halfHeight) ||
       convertedLocation.y > (sprite.position.y + halfHeight) ) {
        return NO;
    }
    return YES;
}

-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    
    if([self isTouchInside:self.buildingSprite withTouch:touch] == YES){
        [self.buildingSprite runAction:self.buildingOpenAnimation];
    }
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
