//
//  MLutOptions.swift
//  Dehancer mLut Maker
//
//  Created by denn on 30/09/2018.
//  Copyright © 2018 Dehancer. All rights reserved.
//

import Foundation
import IMProcessingXMP
import IMProcessing

public struct MLutAttributes {
    
    public var formatVersion:Int {
        get { return model.nsformatVersion.intValue }
        set { model.nsformatVersion = NSNumber(value: newValue)}
    }
    
    public var revision:Int {
        get { return model.nsrevision.intValue }
        set { model.nsrevision = NSNumber(value: newValue)}
    }
    
    public var isPublished:Bool  {
        get { return model.nsisPublished.boolValue }
        set { model.nsisPublished = NSNumber(value: newValue)}
    }
    
    public var isPrinted:Bool   {
        get { return model.nsisPrinted.boolValue }
        set { model.nsisPrinted = NSNumber(value: newValue)}
    }
    
    public var type:MLutType   {
        get { return MLutType(rawValue: uint(model.nslutType.uintValue)) ?? .mlut }
        set { model.nslutType = NSNumber(value: newValue.rawValue) }
    }
    
    public var lutSize:MLutSize   {
        get { return MLutSize(rawValue: uint(model.nslutSize.uintValue)) ?? .normal }
        set { model.nslutSize = NSNumber(value: newValue.rawValue) }
    }
    
    public var colorType:MLutColorType {
        get { return MLutColorType(rawValue: uint(model.nscolorType.uintValue)) ?? .color }
        set { model.nscolorType = NSNumber(value: newValue.rawValue) }
    }
    
    public var filmType:MLutFilmType {
        get { return MLutFilmType(rawValue: uint(model.nsfilmType.uintValue)) ?? .negative }
        set { model.nsfilmType = NSNumber(value: newValue.rawValue) }
    }
    
    public var expandBlendingMode:IMPBlendingMode {
        get { return IMPBlendingMode(rawValue: uint(model.nsexpandBlendingMode.uintValue)) ?? .normal }
        set { model.nsexpandBlendingMode = NSNumber(value: newValue.rawValue) }
    }
    
    public var expandImpact:Float {
        get { return model.nsexpandImpact.floatValue }
        set { model.nsexpandImpact = NSNumber(value: newValue) }
    }
    
    public var name:String? {
        get { return model.nsname }
        set { model.nsname = newValue }
    }
    
    public var lutDescription:String? {
        get { return model.nsdescription }
        set { model.nsdescription = newValue }
    }
    
    public var author:String? {
        get { return model.nsauthor }
        set { model.nsauthor = newValue }
    }
    
    public var mantainer:String? {
        get { return model.nsmantainer }
        set { model.nsmantainer = newValue }
    }
    
    public var tags:String? {
        get { return model.nstags }
        set { model.nstags = newValue }
    }
    
    
    public init(){}
    
    @discardableResult public func store(url: URL, extension ext: String = "xmp") throws -> ImageMeta {
        let meta = ImageMeta(path: url.path, extension: ext, history:1)
        try meta.setField(model)
        return meta
    }
    
    @discardableResult public mutating func restore(url: URL, extension ext: String = "xmp") throws -> ImageMeta {
        
        let meta = ImageMeta(path: url.path, extension: ext, history:1)
        
        model = try meta.getField(MLutAttributesModel.self, fieldId: nil) as! MLutAttributesModel
        
        return meta
    }
    
    private var model = MLutAttributesModel()
}

extension MLutAttributes: CustomStringConvertible {
    
    public var description: String {
        var s = ""
            
            + " formatVersion: \(formatVersion)\n"
            + "      revision: \(revision)\n"
            + "    isPprinted: \(isPrinted)\n"
            + "   isPublished: \(isPublished)\n"
            + "          type: \(type.caption)\n"
            + "          size: \(lutSize.caption)\n"
            + "     colorType: \(colorType.caption)\n"
            + "      filmType: \(filmType.caption)\n"
            + "  blendingMode: \(expandBlendingMode.name)\n"
            + "  expandImpact: \(expandImpact)\n"
            + "        author: \(String(describing: author))\n"
            + "     mantainer: \(String(describing: mantainer))\n"
            + "          tags: \(String(describing: tags))\n"
        
        return s
    }
    
}
