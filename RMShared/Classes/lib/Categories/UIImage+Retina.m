//
//  UIImage+Retina.m
//  Romo
//

#import "UIImage+Retina.h"
#import <Romo/UIDevice+Romo.h>


@implementation UIImage (Retina)

+ (UIImage *)nonRetinaImageNamed:(NSString *)name
{
    NSString *resource = name;
    NSString *type = [name pathExtension];
    if (type.length) {
        resource = [name substringToIndex:name.length - 1 - type.length];
    }

    name = [resource stringByAppendingPathExtension:type];
    UIImage *image = [self imageNamed:name];
    return image;
}

+ (UIImage *)smartImageNamed:(NSString *)name
{
    BOOL retina = [[UIDevice currentDevice] isFastDevice];
    UIImage *result = nil;
    
    if (!retina) {
        result = [self nonRetinaImageNamed:name];
    }

    if (!result) {
        result = [self imageNamed:name];
    }

    return result;
}

@end
