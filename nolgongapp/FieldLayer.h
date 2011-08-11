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
    //구름스프라이트
    CCSprite *skySprite;
    
    CCSprite *gray_CafeteriaSprite;
    CCSprite *color_CafeteriaSprite;
    CCAnimate *cafeteriaOpenAnimation;
    
    CCSprite *gray_BurgerSprite;
    CCSprite *color_BurgerSprite;
    CCAnimate *burgerOpenAnimation;
    
    CCSprite *gray_CafeSprite;
    CCSprite *color_CafeSprite;
    CCAnimate *cafeOpenAnimation;
    
    CCSprite *gray_CompanySprite;
    CCSprite *color_CompanySprite;
    CCAnimate *companyOpenAnimation;
    
    CCSprite *gray_StairsSprite;
    CCSprite *color_StairsSprite;
    CCAnimate *stairsOpenAnimation;
    
    CCSprite *gray_TheaterSprite;
    CCSprite *color_TheaterSprite;
    CCAnimate *theaterOpenAnimation;
    
    
    //몇번째 건물이 작동중인지 검사한다.
    int tag;
    
    //애니메이션이 진행중인지 검사.
    BOOL isAnimating;
    
    UIImage *mappingSprite;
    
    
    
}

@property (nonatomic, retain) CCSprite *skySprite;

@property (nonatomic, retain) CCSprite *gray_CafeteriaSprite;
@property (nonatomic, retain) CCSprite *color_CafeteriaSprite;
@property (nonatomic, retain) CCAnimate *cafeteriaOpenAnimation;

@property (nonatomic, retain) CCSprite *gray_BurgerSprite;
@property (nonatomic, retain) CCSprite *color_BurgerSprite;
@property (nonatomic, retain) CCAnimate *burgerOpenAnimation;

@property (nonatomic, retain) CCSprite *gray_CafeSprite;
@property (nonatomic, retain) CCSprite *color_CafeSprite;
@property (nonatomic, retain) CCAnimate *cafeOpenAnimation;

@property (nonatomic, retain) CCSprite *gray_CompanySprite;
@property (nonatomic, retain) CCSprite *color_CompanySprite;
@property (nonatomic, retain) CCAnimate *companyOpenAnimation;

@property (nonatomic, retain) CCSprite *gray_StairsSprite;
@property (nonatomic, retain) CCSprite *color_StairsSprite;
@property (nonatomic, retain) CCAnimate *stairsOpenAnimation;

@property (nonatomic, retain) CCSprite *gray_TheaterSprite;
@property (nonatomic, retain) CCSprite *color_TheaterSprite;
@property (nonatomic, retain) CCAnimate *theaterOpenAnimation;

@property (nonatomic, retain) UIImage *mappingSprite;

-(void)createBuilding;

-(void)createBuildingAniation;
-(void)createBackGround;
-(void)createMapping;
-(void)skyAnimation;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
@end
