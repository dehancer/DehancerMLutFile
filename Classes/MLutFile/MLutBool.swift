//
//  MLutBool.swift
//  ExportPanel
//
//  Created by denn on 11.07.2018.
//  Copyright © 2018 Dehancer. All rights reserved.
//

import Foundation
import IMProcessingXMP

public extension MLutBoolModel {
    
    public convenience init(meta: ImageMeta) throws {
        self.init()
        try create(meta: meta)
    }
    
    public var state:Bool {
        get {
            return nsstate.boolValue
        }
        set {
            nsstate = NSNumber(value: newValue)
        }
    }
    
    private func create<T:MLutBoolModel>(meta: ImageMeta) throws -> T {
        let t = try meta.getField(T.self, fieldId: nil) as! T
        state = t.nsstate.boolValue
        return t
    }
}
