// FrogRiverOne
// https://codility.com/programmers/lessons/4-counting_elements/frog_river_one/start/
- (int)findMinimumTime:(NSArray *)positions num:(int)number {
    NSMutableDictionary *dict = [NSMutableDictionary new];
    for (int i = 0; i < positions.count; i++) {
        NSNumber *num = positions[i];
        if(dict[num] == 0){
            dict[num] = num;
            if ([self checkIfAllPositionsOccupied:number
                                       dictionary:dict]) {
                return i;
            }
        }
    }
    return -1;
}

- (BOOL)checkIfAllPositionsOccupied:(int)x dictionary:(NSDictionary *)dict {
    for(int i = 1; i <= x; i++){
        NSNumber *num = @(i);
        if(dict[num] == 0){
            return NO;
        }
    }
    return YES;
}
