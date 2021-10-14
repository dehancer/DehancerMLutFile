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
import DehancerCommon

public class MLutAttributes {
    
    public var formatVersion:Int {
        get { return model.nsformatVersion?.intValue ?? 1 }
    }
    
    public var revision:Int {
        set { model.nsrevision = NSNumber(value: newValue )}
        get { return model.nsrevision?.intValue ?? 1 }
    }
    
    public var ISOIndex:Int {
        set { model.nsISOIndex = NSNumber(value: newValue )}
        get { return model.nsISOIndex?.intValue ?? -1 }
    }
    
    public var timestamp:Date {
        set { model.nstimestamp = newValue}
        get { return model.nstimestamp ?? Date() }
    }
    
    public var isPrinted:Bool   {
        get { return model.nsisPrinted?.boolValue ?? false}
        set { model.nsisPrinted = NSNumber(value: newValue)}
    }
    
    public var isPrintMedia:Bool   {
        get { return model.nsisPrintMedia?.boolValue ?? false}
        set { model.nsisPrintMedia = NSNumber(value: newValue)}
    }
    
    public var fileType:MLutType   {
        get { return MLutType(rawValue: uint(model.nslutType?.uintValue ?? UInt(MLutType.mlut.rawValue))) ?? .mlut }
        set { model.nslutType = NSNumber(value: newValue.rawValue) }
    }
    
    public var lutSize:MLutSize   {
        get { return MLutSize(rawValue: uint(model.nslutSize?.uintValue ?? UInt(MLutSize.normal.rawValue))) ?? .normal }
        set { model.nslutSize = NSNumber(value: newValue.rawValue) }
    }
    
    public var colorType:MLutColorType {
        get { return MLutColorType(rawValue: uint(model.nscolorType?.uintValue ?? UInt(MLutColorType.color.rawValue))) ?? .color }
        set { model.nscolorType = NSNumber(value: newValue.rawValue) }
    }
    
    public var filmType:MLutFilmType {
        get { return MLutFilmType(rawValue: uint(model.nsfilmType?.uintValue ?? UInt(MLutFilmType.negative.rawValue))) ?? .negative }
        set { model.nsfilmType = NSNumber(value: newValue.rawValue) }
    }
    
    public var expandBlendingMode:IMPBlendingMode {
        get { return IMPBlendingMode(rawValue: uint(model.nsexpandBlendingMode?.uintValue ?? UInt(IMPBlendingMode.normal.rawValue))) ?? .normal }
        set { model.nsexpandBlendingMode = NSNumber(value: newValue.rawValue) }
    }
    
    public var expandImpact:Float {
        get { return model.nsexpandImpact?.floatValue ?? 0 }
        set { model.nsexpandImpact = NSNumber(value: newValue) }
    }
    
    public var id:String {
        get { return model.nsid }
        set { model.nsid = newValue }
    }
    
    public var caption:String? {
        get { return model.nscaption }
        set { model.nscaption = newValue }
    }
    
    public var lutDescription:String? {
        get { return model.nsdescription }
        set { model.nsdescription = newValue }
    }
    
    public var author:String? {
        get { return model.nsauthor }
        set { model.nsauthor = newValue }
    }
    
    public var maintainer:String? {
        get { return model.nsmaintainer }
        set { model.nsmaintainer = newValue }
    }
    
    public var tags:String? {
        get { return model.nstags }
        set { model.nstags = newValue }
    }
    
    public var isVideoEnabled:Bool {
        set { model.nsisVideoEnabled = NSNumber(booleanLiteral: newValue) }
        get { return model.nsisVideoEnabled.boolValue  }
    }
    
    public var isPhotoEnabled:Bool {
        set { model.nsisPhotoEnabled = NSNumber(booleanLiteral: newValue) }
        get { return model.nsisPhotoEnabled.boolValue  }
    }
      
    public var licenseMatrix:[LicenseType] {
        set {
            model.nslicenseMatrix = newValue.map {
                return $0.rawValue
            }
        }
        get { return model.nslicenseMatrix?.compactMap{
            return LicenseType(rawValue: $0 as! Int32)
            } ?? [] }
    }
    
    public init(){}
    
    @discardableResult public func store(url: URL, extension ext: String = "xmp") throws -> ImageMeta {
        
//        if !keepRevision {
//            model.nsrevision = NSNumber(value: revision + 1 )
//            model.nstimestamp = Date()
//        }
        
        let meta = ImageMeta(path: url.path, extension: ext, history:1)
                
//        if id.isEmpty   {
//            id = caption ?? ""
//        }
        
        try meta.setField(model)
        
        return meta
    }
    
    @discardableResult public func restore(url: URL, extension ext: String = "xmp") throws -> ImageMeta {
        
        let meta = ImageMeta(path: url.path, extension: ext, history:1)
            
        model = try meta.getField(MLutAttributesModel.self, fieldId: nil) as! MLutAttributesModel
        
//        if id.isEmpty   {
//            id = caption ?? ""
//            try meta.setField(model)
//        }
                
        return meta
    }
    
    private var model = MLutAttributesModel()
}

extension MLutAttributes: CustomStringConvertible {
    
    public var description: String {
        var s = ""
            
            + "            id: \(id)\n"
            + "       caption: \(caption)\n"
            + " formatVersion: \(formatVersion)\n"
            + "      revision: \(revision)\n"
            + "lutDescription: \(lutDescription ?? "-")\n"
            + "     timestamp: \(timestamp)\n"
            + "    isPrinted: \(isPrinted)\n"
            + "    isPrintMedia: \(isPrintMedia)\n"
            + "          type: \(fileType.caption)\n"
            + "          size: \(lutSize.caption)\n"
            + "     colorType: \(colorType.caption)\n"
            + "      filmType: \(filmType.caption)\n"
            + "     ISO index: \(ISOIndex)\n"
            + "  blendingMode: \(expandBlendingMode.caption)\n"
            + "  expandImpact: \(expandImpact)\n"
            + "        author: \(author ?? "-")\n"
            + "    maintainer: \(maintainer ?? "-")\n"
            + "          tags: \(tags ?? "-")\n"
        
        return s
    }
    
}
