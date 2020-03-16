#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    NSMutableArray *newBill = [NSMutableArray arrayWithArray:bill];
    [newBill removeObjectAtIndex:index];
    NSInteger newSum = sum.intValue;
    
    NSInteger sumWithoutAnna = 0;
    for (int i = 0; i < [newBill count]; i++) {
        sumWithoutAnna += [newBill[i] intValue];
    }
    
    NSInteger billForAnna = sumWithoutAnna / 2;
    
    if (newSum > billForAnna) {
        NSInteger finalSum = newSum - billForAnna;
        return [NSString stringWithFormat:@"%ld", (long)finalSum];
    } else {
        return @"Bon Appetit";
    }
}

@end
