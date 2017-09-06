-(int)binaryGap:(int)n {
    // write your code in Objective-C 2.0
    while(n > 0 && n % 2 == 0) {
        n = n / 2;
    }
    
    int maxGap = 0;
    int curGap = 0;
    
    while(n > 0) {
        if(n % 2 == 1) {
            if(curGap > maxGap) {
                maxGap = curGap;
            } 
            curGap = 0;
        } else {
            curGap++;
        }
        n = n/2;
    }
    return maxGap;
}