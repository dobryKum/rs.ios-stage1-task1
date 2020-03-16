#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    NSMutableArray *happyArray = [NSMutableArray arrayWithArray:sadArray];
    if ([happyArray count] == 0) {
        return happyArray;
    }
    for (int i = 1; i < [happyArray count] - 1; i++) {
        NSNumber *middleNumber = happyArray[i];
        NSNumber *leftNumber = happyArray[i-1];
        NSNumber *rightNumber = happyArray[i+1];
        if (middleNumber.intValue >= leftNumber.intValue + rightNumber.intValue) {
            [happyArray removeObjectAtIndex:i];
            i = 0;
        }
    }
    return happyArray;
}

@end
