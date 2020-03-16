#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    NSMutableArray *newArray = [NSMutableArray arrayWithArray:array];
    NSInteger sum = [newArray[0] intValue];
    NSNumber *maxValue = newArray[0];
    NSNumber *minValue = newArray[0];
    for (int i = 1; i < [newArray count]; i++) {
        sum += [newArray[i] intValue];
        if ([minValue intValue] > [newArray[i] intValue]) {
            minValue = newArray[i];
        }
        if ([maxValue intValue] < [newArray[i] intValue]) {
            maxValue = newArray[i];
        }
    }
    NSInteger maxSum = sum - [minValue intValue];
    NSInteger minSum = sum - [maxValue intValue];
    return @[@(minSum), @(maxSum)];
}

@end
