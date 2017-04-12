//
//  ASNodeAncestorEnumerator.h
//  AsyncDisplayKit
//
//  Created by Adlai Holler on 4/12/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AsyncDisplayKit/ASDisplayNode.h>

NS_ASSUME_NONNULL_BEGIN

@interface ASDisplayNode (Ancestry)

- (NSEnumerator *)ancestorEnumeratorWithSelf:(BOOL)includeSelf;

@property (atomic, copy, readonly) NSString *ancestryDescription;

@end

NS_ASSUME_NONNULL_END
