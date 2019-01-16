//
//  MLutTypes.swift
//  ExportPanel
//
//  Created by denn on 09.07.2018.
//  Copyright © 2018 Dehancer. All rights reserved.
//

import Foundation

public extension MLutType {
    
    public var caption:String {
        switch self {
        case .mlut:
            return NSLocalizedString("Dehancer Multi Lut", comment: "")
        case .cube:
            return NSLocalizedString("Adobe Cube (3 files in folder)", comment: "")
        case .png:
            return NSLocalizedString("Lookup PNG (3 files in folder)", comment: "")
        }
    }
    
    public static var availableList:[MLutType] {
        return [.mlut, .cube, .png]
    }
    
    public var extention:String {
        switch self {
        case .mlut:
            return "mlut"
        case .cube:
            return "cube"
        case .png:
            return "png"
        }
    }
    
    public var folderExtention:String {
        switch self {
        case .mlut:
            return ""
        case .cube:
            return " (Cube)"
        case .png:
            return " (Lookup)"
        }
    }
}
