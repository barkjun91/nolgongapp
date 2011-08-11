//
//  Openining.m
//  nolgongapp
//
//  Created by Nolgong Powerhouse on 8/11/11.
//  Copyright 2011 Nolgong. All rights reserved.
//

#import "Openining.h"
#import "FieldLayer.h"

@implementation Openining
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	FieldLayer *layer = [Openining node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}
-(void)LoadScene{
    CCScene *sMain = [CCScene node];
	[sMain addChild:[FieldLayer node]];   // 새로 적용될 CCLayer 
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:2.0f scene:sMain]];
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        self.isTouchEnabled = YES;
        
        CCSprite *sprite = [CCSprite spriteWithFile:@"Default-Landscape~ipad.png"];
        sprite.position = ccp(512.0f, 384.0f);
        [self addChild:sprite];
        
        label = [CCLabelTTF labelWithString:@"Nolgong Present" fontName:@"Marker Felt" fontSize:60];
        CGSize size = [[CCDirector sharedDirector] winSize];
        label.position = ccp(size.width / 2, size.height / 2);
        label.opacity = 0;
        [label runAction:[CCSequence actions:[CCFadeTo actionWithDuration:3.5f opacity:255], 
                          [CCCallFunc actionWithTarget:self 
                                              selector:@selector(LoadScene)]
                          , nil]];
        [self addChild:label];
	}
	return self;
}

-(void)dealloc{
    [super dealloc];
}
@end
