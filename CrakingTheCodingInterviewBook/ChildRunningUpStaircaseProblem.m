// Problem 9.1
// A child is running up a staircase with n steps, and can hop
// either 1 step, 2 steps, or 3 steps at a time. Implement
// a method to count how many possible ways the child can run
// up the stairs.

@property (nonatomic, strong) NSMutableArray *ways;

// Initialize array with -1

self.ways = [NSMutableArray new];
for(int i = 0; i < n; i++){
	self.ways addObject:@(-1)];
}

// Function

- (int)countWays:(int)n {
	if(n < 0){
		return 0;
	} else if (n == 0){
		return 1;
	} else if (self.ways[n] == -1){
		self.ways[n] = [self countWays:n - 1] +
					   [self countWays:n - 2] +
					   [self countWays:n - 3];
		return self.ways[n];
	}
	return self.ways[n];
}
