import UIKit

@implementation NSMutableArray (Reverse)

- (void)reverse {
    if ([self count] <= 1)
    return;
    NSUInteger i = 0;
    NSUInteger j = [self count] - 1;
    while (i < j) {
        [self exchangeObjectAtIndex:i
            withObjectAtIndex:j];
        
        i++;
        j--;
    }
}

@end
