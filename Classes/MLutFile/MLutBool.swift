//
//  MLutBool.swift
//  ExportPanel
//
//  Created by denn on 11.07.2018.
//  Copyright © 2018 Dehancer. All rights reserved.
//

import Foundation
import IMProcessingXMP

/// MARK: - Float
public func &=<T:MLutBoolModel>(left: inout T, right: Bool)  {
    left.nsvalue = NSNumber(value: right)
}

public prefix func !<T:MLutBoolModel>(left: T) -> Bool {
    return !(left.nsvalue.boolValue)
}
