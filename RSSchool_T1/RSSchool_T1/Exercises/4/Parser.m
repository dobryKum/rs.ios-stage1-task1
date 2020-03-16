#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    NSMutableArray *openBracketsArray = [NSMutableArray new];
    NSMutableArray *closeBracketsArray = [NSMutableArray new];
    NSMutableArray<NSString*> *result = [NSMutableArray new];
    for (int i = 0; i < [string length]; i++) {
        char character = [string characterAtIndex:i];
        if ( character == '(' || character == '[' || character == '<' ) {
            [openBracketsArray addObject:@[[NSString stringWithFormat:@"%c", character],@(i)]];
        }
        if ( character == ')' || character == ']' || character == '>' ) {
            [closeBracketsArray addObject:@[[NSString stringWithFormat:@"%c", character],@(i)]];
        }
    }
    
    for (int i = 0; i < [openBracketsArray count]; i++) {
        for (int j = 0; j < [closeBracketsArray count]; j++) {
//            NSInteger test1 = [openBracketsArray[i][1] intValue];
//            NSInteger test2 = [closeBracketsArray[j][1] intValue];
            if ([openBracketsArray[i][0] isEqualToString:@"("] && [closeBracketsArray[j][0] isEqualToString:@")"]) {
                NSRange range = NSMakeRange([openBracketsArray[i][1] intValue]+1, [closeBracketsArray[j][1] intValue]-[openBracketsArray[i][1] intValue]-1);
                [result addObject:[string substringWithRange:range]];
                [closeBracketsArray removeObjectAtIndex:j];
                break;
            } else if ([openBracketsArray[i][0] isEqualToString:@"["] && [closeBracketsArray[j][0] isEqualToString:@"]"]) {
                NSRange range = NSMakeRange([openBracketsArray[i][1] intValue]+1, [closeBracketsArray[j][1] intValue]-[openBracketsArray[i][1] intValue]-1);
                [result addObject:[string substringWithRange:range]];
                [closeBracketsArray removeObjectAtIndex:j];
                break;
            } else if ([openBracketsArray[i][0] isEqualToString:@"<"] && [closeBracketsArray[j][0] isEqualToString:@">"]) {
                NSRange range = NSMakeRange([openBracketsArray[i][1] intValue]+1, [closeBracketsArray[j][1] intValue]-[openBracketsArray[i][1] intValue]-1);
                [result addObject:[string substringWithRange:range]];
                [closeBracketsArray removeObjectAtIndex:j];
                break;
            } else {
                continue;
            }
        }
    }
    return result;
}

@end
