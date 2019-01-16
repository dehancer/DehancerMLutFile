//
//  MLutColorType.swift
//  ExportPanel
//
//  Created by denn on 11.07.2018.
//  Copyright © 2018 Dehancer. All rights reserved.
//

import Foundation

public extension MLutColorType {
        
    public var caption:String {
        switch self {
        case .color:
            return NSLocalizedString("Color", comment: "")
        case .bw:
            return NSLocalizedString("BW", comment: "")
        default:
            return ""
        }
    }
    
    public static var availableList:[MLutColorType] {
        return [.color, .bw]
    }
}
