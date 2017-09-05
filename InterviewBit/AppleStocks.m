//Apple stocks https://www.interviewcake.com/?utm_medium=affiliate&utm_source=interviewingio&utm_campaign=interviewingio
- (int)appleStocks:(NSArray *)stocks {
    if (stocks == nil || stocks.count < 2) {
        [NSException raise:@"You need to have minimum two prices to calculate profit" format:@"stocks %@ are invalid", stocks];
    }

    int minPrice = [stocks[0] intValue];
    int maxProfit = [stocks[1] intValue] - minPrice;

    int curPrice;
    int potentialProfit;

    for (int i = 1; i < stocks.count; i++) {
        curPrice = [stocks[i] intValue];

        potentialProfit = curPrice - minPrice;

        maxProfit = MAX(potentialProfit, maxProfit);
        minPrice = MIN(minPrice, curPrice);
    }

    return maxProfit;
}