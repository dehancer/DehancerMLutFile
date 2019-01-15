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

public extension MLutBoolModel {
    
//    public var state:Bool {
//        get {
//            return nsstate.boolValue
//        }
//        set {
//            nsstate = NSNumber(value: newValue)
//        }
//    }
}


public extension MLutPrinted {
//    public convenience init(meta: ImageMeta) throws {
//        self.init()
//        do {
//            let t = try meta.getField(MLutPrinted.self, fieldId: nil) as! MLutBoolModel
//            state = t.nsstate.boolValue
//        }
//        catch {
//            state = false
//        }
//    }
}


public extension MLutPublish {
//    public convenience init(meta: ImageMeta) throws {
//        self.init()
//        do {
//            let t = try meta.getField(MLutPublish.self, fieldId: nil) as! MLutBoolModel
//            state = t.nsstate.boolValue
//        }
//        catch {
//            state = false
//        }
//    }
}
