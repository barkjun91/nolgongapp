//
//  Openining.h
//  nolgongapp
//
//  Created by Nolgong Powerhouse on 8/11/11.
//  Copyright 2011 Nolgong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Openining : CCLayer {
    CCLabelTTF* label;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
@end
