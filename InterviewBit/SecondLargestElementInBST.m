//My solution base on examination if tree contains right/left subtree

- (int)2ndLargestElementInBST:(Node *)root {
	if(root == nil){
		[NSException raise:@"Empty tree" format:@"tree %@ is invalid", root];
	}

	if(root.right != nil){
		return [self 2ndLargestElementInBSTHelper:root.right largest:root.right.value second:root.value];
	} else if (root.left != nil) {
		return [self 2ndLargestElementInBSTHelper:root.left largest:root.value second:root.left.value];
	}

	[NSException raise:@"There is no second largest element" format:@"tree %@ has no children", root];
}

- (int)2ndLargestElementInBSTHelper:(Node *)root largest:(int)largest second:(int)second {
	if(root == nil) {
		return second;
	}

	if(root.value > largest){
		second = largest;
		largest = root.value;
	} else if (root.value > second) {
		second = root.value;
	}

	int leftSecondLarge = [self 2ndLargestElementInBSTHelper:root.left largest:largest second:second];
	int rightSecondLarge = [self 2ndLargestElementInBSTHelper:root.right largest:largest second:second];

	return MAX(leftSecondLarge, rightSecondLarge);
}