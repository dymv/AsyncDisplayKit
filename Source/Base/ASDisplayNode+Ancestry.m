//
//  ASNodeAncestorEnumerator.m
//  AsyncDisplayKit
//
//  Created by Adlai Holler on 4/12/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import "ASDisplayNode+Ancestry.h"

AS_SUBCLASSING_RESTRICTED
@interface ASNodeAncestryEnumerator : NSEnumerator
@end

@implementation ASNodeAncestryEnumerator {
  // Enumerators are one-shot optimized – avoid retains/releases/weak
  __unsafe_unretained ASDisplayNode * _Nullable _node;
}

- (instancetype)initWithNode:(ASDisplayNode *)node
{
  if (self = [super init]) {
    _node = node;
  }
  return self;
}

- (id)nextObject
{
  __unsafe_unretained ASDisplayNode *node = _node;
  _node = [node supernode];
  return node;
}

@end

@implementation ASDisplayNode (Ancestry)

- (NSEnumerator *)ancestorEnumeratorWithSelf:(BOOL)includeSelf
{
  __unsafe_unretained ASDisplayNode *node = includeSelf ? self : self.supernode;
  return [[ASNodeAncestryEnumerator alloc] initWithNode:node];
}

- (NSString *)ancestryDescription
{
  NSMutableArray *strings = [NSMutableArray array];
  for (ASDisplayNode *node in [self ancestorEnumeratorWithSelf:YES]) {
    [strings addObject:ASObjectDescriptionMakeTiny(node)];
  }
  return strings.description;
}

@end
