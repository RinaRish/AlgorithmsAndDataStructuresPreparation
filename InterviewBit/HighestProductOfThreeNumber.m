- (int)highestProduct:(NSArray *)arr {
    if (arr == nil || arr.count < 3) {
        [NSException raise:@"You need to have minimum two elements" format:@"array %@ is invalid", arr];
    }

    int highest = MAX([arr[0] intValue], [arr[1] intValue]);
    int lowest = MIN([arr[0] intValue], [arr[1] intValue]);
    int lowestProductOf2 = [arr[0] intValue] * [arr[1] intValue];
    int highestProductOf2 = [arr[0] intValue] * [arr[1] intValue];
    int highestProductOf3 = [arr[0] intValue] * [arr[1] intValue] * [arr[2] intValue];

    for (int i = 2; i < arr.count; i++) {
        int curValue = [arr[i] intValue];

        highestProductOf3 = MAX(highestProductOf3, MAX(curValue * lowestProductOf2, curValue * highestProductOf2));

        highestProductOf2 = MAX(highestProductOf2, MAX(curValue * highest, curValue * lowest));

        lowestProductOf2 = MIN(lowestProductOf2, MIN(curValue * highest, curValue * lowest));

        highest = MAX(highest, curValue);

        lowest = MIN(lowest, curValue);
    }

    return highestProductOf3;
}
