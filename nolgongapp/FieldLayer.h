//
//  HelloWorldLayer.h
//  nolgongapp
//
//  Created by Nolgong Powerhouse on 8/1/11.
//  Copyright Nolgong 2011. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface FieldLayer : CCLayer
{
    id action;
    CGSize winSize;
    
    //빌딩 스프라이트
    CCSprite *buildingSprite;
    //빌딩 오픈 애니메이션
    CCAnimate *buildingOpenAnimation;
    //빌딩 오픈 진행중인지 검사
    BOOL isBuildingAnimating;
    
    UIImage *mappingSprite;
    
}

@property (nonatomic, retain) CCSprite *buildingSprite;
@property (nonatomic, retain) CCAnimate *buildingOpenAnimation;
@property (nonatomic, retain) UIImage *mappingSprite;
-(void)createBuildingAniation;
-(void)createBackGround;
-(void)createMapping;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
@end
