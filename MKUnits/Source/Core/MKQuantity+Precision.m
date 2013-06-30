//
//  MKQuantity+Precision.m
//  MKUnits
//
//  Created by Michal Konturek on 30/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKQuantity+Precision.h"

#import "MKUnit.h"

#import "NSNumber+Fraction.h"

@implementation MKQuantity (Precision)

- (BOOL)isTheSame:(MKQuantity *)other withPrecision:(short)precision {
    return ([self compare:other withPrecision:precision] == NSOrderedSame);
}

- (BOOL)isGreaterThan:(MKQuantity *)other withPrecision:(short)precision {
    return ([self compare:other withPrecision:precision] == NSOrderedDescending);
}

- (BOOL)isLessThan:(MKQuantity *)other withPrecision:(short)precision {
    return ([self compare:other withPrecision:precision] == NSOrderedAscending);
}

- (NSComparisonResult)compare:(MKQuantity *)other withPrecision:(short)precision {
    NSAssert([self.unit isMemberOfClass:[other.unit class]], UNIT_MISMATCH);
    MKQuantity *converted = [other convertTo:self.unit];
    return ([[self.amount decimalNumberWithPrecision:precision]
             compare:[converted.amount decimalNumberWithPrecision:precision]]);
}

@end
