//
//  MLutNumber.swift
//  CryptoSwift
//
//  Created by denn on 15/01/2019.
//

import Foundation
import IMProcessingXMP

/// MARK: - Int
public func &=<T:MLutNumberModel>(left: inout T, right: Int)  {
    left.nsvalue = NSNumber(value: right)
}

public func -<T:MLutNumberModel>(left: T, right: Int) -> T {
    return T(number:NSNumber(value: left.nsvalue.intValue - right))
}

public func +<T:MLutNumberModel>(left: T, right: Int) -> T {
    return T(number:NSNumber(value: left.nsvalue.intValue + right))
}

public func +=<T:MLutNumberModel>( left: inout T, right: Int)  {
    left = left + right
}

public func -=<T:MLutNumberModel>( left: inout T, right: Int)  {
    left = left - right
}

/// MARK: - Float
public func &=<T:MLutNumberModel>(left: inout T, right: Float)  {
    left.nsvalue = NSNumber(value: right)
}

public func -<T:MLutNumberModel>(left: T, right: Float) -> T {
    return T(number:NSNumber(value: left.nsvalue.floatValue - right))
}

public func +<T:MLutNumberModel>(left: T, right: Float) -> T {
    return T(number:NSNumber(value: left.nsvalue.floatValue + right))
}

public func +=<T:MLutNumberModel>( left: inout T, right: Float)  {
    left = left + right
}

public func -=<T:MLutNumberModel>( left: inout T, right: Float)  {
    left = left - right
}
