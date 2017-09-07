// Given an undirected graph with maximum degree D,
// find a graph coloring using at most D+1 colors.

@interface AdjacentListNode : NSObject

@property (nonatomic, assign) NSInteger destination;
@property (nonatomic, strong) AdjacentListNode *next;
@property (nonatomic, strong) NSString *color;

@end

@interface AdjacencyList : NSObject

@property (nonatomic, strong) AdjacentListNode *head;

@end

@interface Graph : NSObject

@property (nonatomic, assign) NSInteger v;
@property (nonatomic, strong) NSMutableArray <AdjacencyList*> *adjList;

+ (Graph *)createGraph:(NSInteger)v;

- (void)addEdgeToGraph:(Graph *)graph
                source:(NSInteger)source
           destination:(NSInteger)dest;

- (void)printGraph:(Graph *)graph;

@end

- (void)colorGraph:(Graph *)graph colors:(NSSet<NSString *> *)colors {
    for (int i = 0; i < graph.adjList.count; i++) {
        AdjacencyList *list = graph.adjList[i];
        AdjacentListNode *cur = list.head;
        
        NSMutableSet<NSString *> *illegalColors = [NSMutableSet new];
        while (cur != nil) {
            NSCAssert((cur.destination != i), @"Legal coloring impossible for node with loop");
            if (cur.color != nil) {
                [illegalColors addObject:cur.color];
            } else {
                for (NSString *color in colors) {
                    if (![illegalColors containsObject:color]) {
                        cur.color = color;
                        [illegalColors addObject:cur.color];
                        break;
                    }
                }
            }
            cur = cur.next;
        }
    }
}
