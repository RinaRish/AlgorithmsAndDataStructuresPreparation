// https://www.interviewcake.com/question/python/product-of-other-numbers
-(NSArray *)arrayProductWithoutCurIndex:(NSArray *)arr {
    if (arr == nil || arr.count < 2) {
        [NSException raise:@"You need to have minimum two elements" format:@"array %@ is invalid", arr];
    }

    NSMutableArray *productBefore = [[NSMutableArray alloc] initWithCapacity:arr.count];
    for (int i = 0; i < arr.count; i++) {
        [productBefore addObject:@0];
    }

    int mult = 1;
    productBefore[0] = @1;
    for (int i = 0; i < arr.count; i++) {
        productBefore[i] = @(mult);
        mult = mult*[arr[i] intValue];
    }

    mult = 1;
    int j = (int)arr.count -1;
    while (j >= 0) {
        productBefore[j] = @([productBefore[j] intValue] * mult);
        mult = mult * [arr[j] intValue];
        j--;
    }

    return [productBefore copy];
}
