//
//  MCJSONDataTransformer.m
//  Pods
//
//  Created by Neil García on 2/6/17.
//
//

#import "MCJSONDataTransformer.h"

@implementation MCJSONDataTransformer

+ (Class)transformedValueClass {
    return [NSData class];
}

+ (BOOL)allowsReverseTransformation {
    return YES;
}

- (id)transformedValue:(id)value {
    if([value isKindOfClass:[NSNull class]])return nil;
    NSDictionary *dict;
    NSError* error;
    return  [NSJSONSerialization dataWithJSONObject:value
                                                           options:NSJSONReadingAllowFragments
                                                             error:&error];
}

- (id)reverseTransformedValue:(id)value {
    NSError* error;
    return [NSJSONSerialization JSONObjectWithData:value
                                    options:NSJSONReadingAllowFragments
                                      error:&error];
}



@end
