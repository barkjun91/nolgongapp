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

@synthesize mappingSprite, skySprite;
@synthesize gray_CafeteriaSprite, color_CafeteriaSprite, cafeteriaOpenAnimation;
@synthesize gray_BurgerSprite, color_BurgerSprite, burgerOpenAnimation;
@synthesize gray_CafeSprite, color_CafeSprite, cafeOpenAnimation;
@synthesize gray_CompanySprite, color_CompanySprite, companyOpenAnimation;
@synthesize gray_StairsSprite, color_StairsSprite, stairsOpenAnimation;
@synthesize gray_TheaterSprite, color_TheaterSprite, theaterOpenAnimation;


enum{
    kTag_Building = 1,  
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
        [self createBuilding];
        [self createBuildingAniation];
        [self skyAnimation];
	}
	return self;
}

#pragma mark -
#pragma mark Animation Building

-(void)skyAnimation{
    id rotate = [CCRotateBy actionWithDuration:120.0f angle:360];
    id repeat = [CCRepeatForever actionWithAction:rotate];
    [self.skySprite runAction:repeat];
}

-(void)createBackGround{
    CCSprite *sprite = [CCSprite spriteWithFile:@"background.png"];
    sprite.position = ccp(winSize.width/2, winSize.height/2);
    [self addChild:sprite];
    
    self.skySprite = [CCSprite spriteWithFile:@"sky.png"];
    self.skySprite.position = ccp(winSize.width/2, winSize.height/10);
    [self addChild:self.skySprite];
    
}
-(void)createMapping{
    self.mappingSprite = [UIImage imageNamed:@"mapping.png"];
}
-(void)createBuilding{
    
    self.gray_TheaterSprite = [CCSprite spriteWithFile:@"black_theater.png"];
    self.gray_TheaterSprite.position = ccp(winSize.width/2, winSize.height/2);
    [self addChild:self.gray_TheaterSprite];
    
    self.color_TheaterSprite = [CCSprite spriteWithFile:@"color_theater.png"];
    self.color_TheaterSprite.opacity = 0;
    self.color_TheaterSprite.position = ccp(512.0f, 384.0f);
    [self addChild:self.color_TheaterSprite z:kTag_Building tag:kTag_Building];
    
    self.gray_StairsSprite = [CCSprite spriteWithFile:@"black_stairs.png"];
    self.gray_StairsSprite.position = ccp(winSize.width/2, winSize.height/2);
    [self addChild:self.gray_StairsSprite];
    
    self.color_StairsSprite = [CCSprite spriteWithFile:@"color_stairs.png"];
    self.color_StairsSprite.opacity = 0;
    self.color_StairsSprite.position = ccp(512.0f, 384.0f);
    [self addChild:self.color_StairsSprite z:kTag_Building tag:kTag_Building];
    
    self.gray_CompanySprite = [CCSprite spriteWithFile:@"black_company.png"];
    self.gray_CompanySprite.position = ccp(winSize.width/2, winSize.height/2);
    [self addChild:self.gray_CompanySprite];
    
    self.color_CompanySprite = [CCSprite spriteWithFile:@"color_company.png"];
    self.color_CompanySprite.opacity = 0;
    self.color_CompanySprite.position = ccp(512.0f, 384.0f);
    [self addChild:self.color_CompanySprite z:kTag_Building tag:kTag_Building];
    
    self.gray_CafeSprite = [CCSprite spriteWithFile:@"black_cafe.png"];
    self.gray_CafeSprite.position = ccp(winSize.width/2, winSize.height/2);
    [self addChild:self.gray_CafeSprite];
    
    self.color_CafeSprite = [CCSprite spriteWithFile:@"color_cafe.png"];
    self.color_CafeSprite.opacity = 0;
    self.color_CafeSprite.position = ccp(512.0f, 384.0f);
    [self addChild:self.color_CafeSprite z:kTag_Building tag:kTag_Building];
    
    self.gray_BurgerSprite = [CCSprite spriteWithFile:@"black_burger.png"];
    self.gray_BurgerSprite.position = ccp(winSize.width/2, winSize.height/2);
    [self addChild:self.gray_BurgerSprite];
    
    self.color_BurgerSprite = [CCSprite spriteWithFile:@"color_burger.png"];
    self.color_BurgerSprite.opacity = 0;
    self.color_BurgerSprite.position = ccp(512.0f, 384.0f);
    [self addChild:self.color_BurgerSprite z:kTag_Building tag:kTag_Building];
    
    self.gray_CafeteriaSprite = [CCSprite spriteWithFile:@"black_cafeteria.png"];
    self.gray_CafeteriaSprite.position = ccp(winSize.width/2, winSize.height/2);
    [self addChild:self.gray_CafeteriaSprite];
    
    self.color_CafeteriaSprite = [CCSprite spriteWithFile:@"color_cafeteria.png"];
    self.color_CafeteriaSprite.opacity = 0;
    self.color_CafeteriaSprite.position = ccp(512.0f, 384.0f);
    [self addChild:self.color_CafeteriaSprite z:kTag_Building tag:kTag_Building];

}
-(void)createBuildingAniation{
    
    NSMutableArray *aniFrames = [NSMutableArray array];
    NSMutableArray *aniFramesList = [[NSMutableArray alloc] initWithObjects: @"1", @"2", @"3", @"4", @"5", @"6", @"7", nil];
    
    CCTexture2D *texture;
    CGSize textureSize;
    CGRect textureRect;
    CCSpriteFrame *spriteFrame;
    
    isAnimating = NO;
    tag = 0;
    
   for(int idx=0; idx < [aniFramesList count]; idx++){
        NSString *image_name = [NSString stringWithFormat:@"building%@.png", [aniFramesList objectAtIndex:idx]];
        texture = [[CCTextureCache sharedTextureCache] addImage:image_name];
        textureSize = [texture contentSize];
        textureRect = CGRectMake(0, 0, textureSize.width, textureSize.height);
        spriteFrame = [CCSpriteFrame frameWithTexture:texture rect:textureRect];
        [aniFrames addObject:spriteFrame];
    }
    
    CCAnimation *openAnimation =[[CCAnimation alloc] initWithName:@"building_open" delay:0.4f frames:aniFrames];
    CCAnimate *animate = [[CCAnimate alloc] initWithAnimation:openAnimation restoreOriginalFrame:NO];
    self.cafeteriaOpenAnimation = animate;
    
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
    self.cafeteriaOpenAnimation = openAnimation;
    [openAnimation release];
 
    CCSprite *sprite = [CCSprite spriteWithSpriteFrameName:@"building1.png"];
    self.gray_CafeteriaSprite = sprite;
    [self addChild:self.gray_CafeteriaSprite z:kTag_Building tag:kTag_Building];
    
    self.gray_CafeteriaSprite.anchorPoint = ccp(512, 354);
    
    self.gray_CafeteriaSprite.position = ccp(winSize.width / 2, 13);
    
    [sprite release];
    */
}
#pragma mark -
#pragma mark Get Color Values

- (CGContextRef) createARGBBitmapContextFromImage:(CGImageRef) inImage {
    
	CGContextRef    context = NULL;
	CGColorSpaceRef colorSpace;
	void *          bitmapData;
	int             bitmapByteCount;
	int             bitmapBytesPerRow;
    
	// Get image width, height. We'll use the entire image.
	size_t pixelsWide = CGImageGetWidth(inImage);
	size_t pixelsHigh = CGImageGetHeight(inImage);
    
	// Declare the number of bytes per row. Each pixel in the bitmap in this
	// example is represented by 4 bytes; 8 bits each of red, green, blue, and
	// alpha.
	bitmapBytesPerRow   = (pixelsWide * 4);
	bitmapByteCount     = (bitmapBytesPerRow * pixelsHigh);
    
	// Use the generic RGB color space.
	colorSpace = CGColorSpaceCreateDeviceRGB();
	
    if (colorSpace == NULL)
	{
		fprintf(stderr, "Error allocating color space\n");
		return NULL;
	}
    
	// Allocate memory for image data. This is the destination in memory
	// where any drawing to the bitmap context will be rendered.
	bitmapData = malloc( bitmapByteCount );
	if (bitmapData == NULL)
	{
		fprintf (stderr, "Memory not allocated!");
		CGColorSpaceRelease( colorSpace );
		return NULL;
	}
    
	// Create the bitmap context. We want pre-multiplied ARGB, 8-bits
	// per component. Regardless of what the source image format is
	// (CMYK, Grayscale, and so on) it will be converted over to the format
	// specified here by CGBitmapContextCreate.
	context = CGBitmapContextCreate (bitmapData,
									 pixelsWide,
									 pixelsHigh,
									 8,      // bits per component
									 bitmapBytesPerRow,
									 colorSpace,
									 kCGImageAlphaPremultipliedFirst);
	if (context == NULL)
	{
		free (bitmapData);
	}
    
	// Make sure and release colorspace before returning
	CGColorSpaceRelease( colorSpace );
    
	return context;
}

- (NSMutableArray *) getPixelColorAtLocation:(CGPoint)point {
    NSMutableArray *colorArray = [NSMutableArray array];
	CGImageRef inImage = self.mappingSprite.CGImage;
	// Create off screen bitmap context to draw the image into. Format ARGB is 4 bytes for each pixel: Alpa, Red, Green, Blue
	CGContextRef cgctx = [self createARGBBitmapContextFromImage:inImage];
	if (cgctx == NULL) { return nil; /* error */ }
    
    size_t w = CGImageGetWidth(inImage);
	size_t h = CGImageGetHeight(inImage);
	CGRect rect = {{0,0},{w,h}}; 
    
	// Draw the image to the bitmap context. Once we draw, the memory
	// allocated for the context for rendering will then contain the
	// raw image data in the specified color space.
	CGContextDrawImage(cgctx, rect, inImage); 
    
	// Now we can get a pointer to the image data associated with the bitmap
	// context.
	unsigned char* data = CGBitmapContextGetData (cgctx);
	if (data != NULL) {
		//offset locates the pixel in the data from x,y.
		//4 for 4 bytes of data per pixel, w is width of one row of data.
		int offset = 4*((w*round(point.y))+round(point.x));
		int alpha =  data[offset];
		int red = data[offset+1];
		int green = data[offset+2];
		int blue = data[offset+3];
		//NSLog(@"offset: %i colors: RGB A %i %i %i  %i",offset,red,green,blue,alpha);
        
        [colorArray addObject:[NSString stringWithFormat:@"%d", red]];
        [colorArray addObject:[NSString stringWithFormat:@"%d", green]];
        [colorArray addObject:[NSString stringWithFormat:@"%d", blue]];
	}
    
	// When finished, release the context
	CGContextRelease(cgctx);
	// Free image data memory for the context
	if (data) { free(data); }
    
	return colorArray;
}
-(BOOL) isSpriteTouch:(int)spritetag:(NSMutableArray *)RGBArray{
    
    switch (spritetag) {
        case 1:
            if([[RGBArray objectAtIndex:0] intValue]==198 && 
               [[RGBArray objectAtIndex:1] intValue]==0 && 
               [[RGBArray objectAtIndex:2] intValue]==121
               )
                return YES;
            break;
            
        default:
            break;
    }
    return NO;
}
#pragma mark -
#pragma mark Touch Event Handling

-(BOOL)isTouchInside:(CCSprite*)sprite withTouch:(UITouch*)touch {
    // Cocoa 좌표 
	CGPoint location = [touch locationInView: [touch view]];
    
    // Cocoa 좌표를 cocos2d 좌표로 변환합니다
//	CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
    
//    CGFloat halfWidth = sprite.contentSize.height / 2.0;
//    CGFloat halfHeight = sprite.contentSize.height / 2.0;
    
    NSMutableArray *colorArray = [self getPixelColorAtLocation:location];
//    NSLog(@"%@", colorArray);
//    NSLog(@"%d", self.gray_CafeteriaSprite.tag);
    
     if ([self isSpriteTouch:self.color_CafeteriaSprite.tag:colorArray]) {
         if(!isAnimating){
             isAnimating = YES;
             tag = self.color_CafeteriaSprite.tag;
         }
         return YES;
     }    

    return NO;
}
/*
-(BOOL)isTouchOutside:(int)spritetag withTouch:(UITouch*)touch{
    CGPoint location = [touch locationInView: [touch view]];
    NSMutableArray *colorArray = [self getPixelColorAtLocation:location];
    switch (spritetag) {
        case 1:
            if(![self isSpriteTouch:self.gray_CafeteriaSprite.tag:colorArray]){
                return YES;
            }
            break;
            
        default:
            break;
    }
    return NO;
}
*/

-(void) buildingOpenAnimateCompleteHandler{
    [self.color_CafeteriaSprite stopAllActions];
    isAnimating = NO;
}

-(void) spriteAnimateInit:(CCSprite*)sprite{
    [sprite stopAllActions];
    [sprite runAction:[CCFadeOut actionWithDuration:1.0f]];
    [sprite runAction:[CCFadeIn actionWithDuration:1.0f]];
}

-(void)cafeteriaOpen{
    gray_CafeteriaSprite.opacity = 0;
    [self.color_CafeteriaSprite 
     runAction:[CCSequence actions:self.cafeteriaOpenAnimation, 
                [CCCallFunc actionWithTarget:self 
                                    selector:@selector(buildingOpenAnimateCompleteHandler)]
                , nil]
    ];
}

-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    
    if([self isTouchInside:self.color_CafeteriaSprite withTouch:touch] == YES){
        NSLog(@"Cafeteria Select.");
        [self.color_CafeteriaSprite runAction:[CCSequence actions:[CCFadeTo actionWithDuration:2.0f opacity:255], 
                                        [CCCallFunc actionWithTarget:self 
                                                            selector:@selector(cafeteriaOpen)]
                                        , nil]];
    }
}

/*
-(void) ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    if(isAnimating){
        if([self isTouchOutside:self.gray_CafeteriaSprite.tag withTouch:touch]){
            [self buildingOpenAnimateCompleteHandler];
            [self spriteAnimateInit:self.gray_CafeteriaSprite];
        }
    }
}

-(void) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    if(isAnimating){
        if([self isTouchInside:self.gray_CafeteriaSprite withTouch:touch]){
            [self buildingOpenAnimateCompleteHandler];
            [self spriteAnimateInit:self.gray_CafeteriaSprite];
        }
    }
}
*/

#pragma mark -
#pragma mark Memory Dealloc

- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
    [skySprite dealloc];
    [gray_TheaterSprite dealloc];
    [gray_StairsSprite dealloc];
    [gray_CompanySprite dealloc];
    [gray_CafeteriaSprite dealloc];
    [gray_CafeSprite dealloc];
    [gray_BurgerSprite dealloc];
    [color_TheaterSprite dealloc];
    [color_StairsSprite dealloc];
    [color_CompanySprite dealloc];
    [color_CafeteriaSprite dealloc];
    [color_CafeSprite dealloc];
    [color_BurgerSprite dealloc];
    [cafeOpenAnimation dealloc];
    [cafeteriaOpenAnimation dealloc];
    [burgerOpenAnimation dealloc];
    [companyOpenAnimation dealloc];
    [stairsOpenAnimation dealloc];
    [theaterOpenAnimation dealloc];
    
}
@end
