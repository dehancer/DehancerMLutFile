//
//  MLutFile.swift
//  ExportPanel
//
//  Created by denn on 09.07.2018.
//  Copyright © 2018 Dehancer. All rights reserved.
//

import Foundation
import IMProcessing
import CryptoSwift
import Darwin
import IMProcessingXMP

public class MLutFile {
    
    private static var dataCache = NSCache<NSString,AnyObject>()
    
    static public var key:[UInt8] = []
    
    public typealias Attributes = MLutAttributes
    
    public var attributes = MLutAttributes()
    
    public var type:MLutType = .mlut
    
    public lazy var cLuts:[MLutExposureMode:IMPCLut] = [MLutExposureMode.under:self.cLutIdentity(),
                                               MLutExposureMode.normal:self.cLutIdentity(),
                                               MLutExposureMode.over:self.cLutIdentity()]
    
    static public func restore(url:URL, context:IMPContext?=nil) throws -> MLutFile? {
        let manager = FileManager()
        if manager.fileExists(atPath: url.path) {
            if url.pathExtension == MLutType.mlut.extention {
                let file = MLutFile(url: url, type: .mlut, context:context)
                try file.restore()
                return file
            }
            let f = NSLocalizedString("File %@ is not mlut format, could not be imported", comment:"")
            throw NSError(domain: "com.dehancer.error",
                          code: Int(EACCES),
                          userInfo: [
                            NSLocalizedDescriptionKey:
                                String(format: String.localizedStringWithFormat(f, url.path)),
                            NSLocalizedFailureReasonErrorKey:
                                String(format: NSLocalizedString("File error", comment:""))
                ])
        }
        let f = NSLocalizedString("File %@ not found", comment:"")
        throw NSError(domain: "com.dehancer.error",
                      code: Int(EACCES),
                      userInfo: [
                        NSLocalizedDescriptionKey:
                            String(format: String.localizedStringWithFormat(f, url.path)),
                        NSLocalizedFailureReasonErrorKey:
                            String(format: NSLocalizedString("File error", comment:""))
            ])
    }
    
    static public func restore(path:String, context:IMPContext?=nil) throws -> MLutFile? {
        return try restore(url: URL(fileURLWithPath: path), context:context)
    }
    
    static public func new(url:URL, type:MLutType = .mlut, context:IMPContext?=nil) -> MLutFile {
        return MLutFile(url: url, type: type, context:context)
    }
    
    static public func new(path:String, type:MLutType = .mlut, context:IMPContext?=nil) -> MLutFile {
        return new(url: URL(fileURLWithPath: path), type: type, context:context)
    }
    
    let cipher = try! Blowfish(key: MLutFile.key, padding: .pkcs7)

    @discardableResult public func commit() throws -> MLutFile {
        
        var f = NSLocalizedString("File %@ must contain file caption", comment:"")
       
        let captionErr = NSError(domain: "com.dehancer.error",
                      code: Int(ENOENT),
                      userInfo: [
                        NSLocalizedDescriptionKey:
                            String(format: String.localizedStringWithFormat(f, url.path)),
                        NSLocalizedFailureReasonErrorKey:
                            String(format: NSLocalizedString("File error", comment:""))
            ])
        
        guard let caption = attributes.caption else {
            throw captionErr
        }
        
        if caption.isEmpty {
            throw captionErr
        }
        
        
        f = NSLocalizedString("File %@ must contain a right ISO Index, current is: %i", comment:"")
        let isoErr = NSError(domain: "com.dehancer.error",
                                 code: Int(ENOENT),
                                 userInfo: [
                                    NSLocalizedDescriptionKey:
                                        String(format: String.localizedStringWithFormat(f, url.path, attributes.ISOIndex)),
                                    NSLocalizedFailureReasonErrorKey:
                                        String(format: NSLocalizedString("File error", comment:""))
            ])
        
        if attributes.ISOIndex <= 0 || attributes.ISOIndex > 64000 {
            throw isoErr
        }
        
        switch self.type {
        case .cube:
            try saveAsFolderWithCube()
        case .mlut:
            try saveAsmLut()
        case .png:
            try saveAsFolderWithPng()
       }
        return self
    }
    
    private func saveAsmLut() throws {
        
        let meta = try attributes.store(url: url, extension: MLutType.mlut.extention)

        let model = MLutModel()
        
        for l in cLuts {
            
            var _2d:IMPImageProvider = try l.value.convert(to: .lut_2d, lutSize: self.attributes.lutSize.size, format: .float)
            
            if let data = try _2d.representation(using: .png, compression: 1, reflect: true) {
                let enc = try self.cipher.encrypt(data.bytes)
                model.clutList.append(enc.toBase64()!)
            }
                
            else {
                model.clutList.append("".bytes.toBase64() ?? "")
            }
            
            try meta.setField(model)
            
        }
    }
    
    private func checkFolder(suffix:String) throws -> URL {
        let manager = FileManager()
        var isDir : ObjCBool = false
        
        let _url = URL(fileURLWithPath: self.url.deletingPathExtension().path+"\(suffix)")

        if manager.fileExists(atPath: _url.path, isDirectory: &isDir) {
            if !isDir.boolValue {
                let f = NSLocalizedString("File %@ is a regular file", comment:"")
                throw NSError(domain: "com.dehancer.error",
                              code: Int(EACCES),
                              userInfo: [
                                NSLocalizedDescriptionKey:
                                    String(format: String.localizedStringWithFormat(f, url.path)),
                                NSLocalizedFailureReasonErrorKey:
                                    String(format: NSLocalizedString("File error", comment:""))
                    ])
            }
        }
        else {
            try manager.createDirectory(atPath: _url.path, withIntermediateDirectories: true, attributes: nil)
        }
        
        return _url
    }
    
    private func saveAsFolderWithPng() throws {
        let _url = try checkFolder(suffix: "")
        for l in cLuts {
            var _url = _url
            let _2d = try l.value.convert(to: .lut_2d, lutSize: attributes.lutSize.size)
            _url.appendPathComponent(l.key.name)
            _url.appendPathExtension(MLutType.png.extention)
            try _2d.write(to: _url.path, using: .png)
        }
    }
    
    private func saveAsFolderWithCube() throws {
        let _url = try checkFolder(suffix: "")
        for l in cLuts {
            var _url = _url
            _url.appendPathComponent(l.key.name)
            _url.appendPathExtension(MLutType.cube.extention)
            let _3d = try l.value.convert(to: .lut_3d, lutSize: attributes.lutSize.size)
            try _3d.write(cube: _url.path)
        }
    }
    
    private init(url:URL, type:MLutType, context:IMPContext?) {
        self.url = url
        self.type = type
        self.context = context ?? IMPContext()
    }
    
    @discardableResult private func restore() throws -> MLutFile {
        do {
            MLutFile.lock.lock()
            defer {
                MLutFile.lock.unlock()
            }
            
            if  let a = MLutFile.dataCache.object(forKey: url.absoluteString as NSString) as? [MLutExposureMode:IMPCLut] {
                
                cLuts = a
                return self
            }
        }
        
        let meta = try attributes.restore(url: url, extension: MLutType.mlut.extention)
        
        switch self.type {
        case .mlut:
            break
        default:
            throw  NSError(domain: "com.dehancer.error",
                           code: Int(EINVAL),
                           userInfo: [
                            NSLocalizedDescriptionKey:
                                String(format: NSLocalizedString("Type of Multi Lut file is not supported", comment:"")),
                            NSLocalizedFailureReasonErrorKey:
                                String(format: NSLocalizedString("Open file error", comment:""))
                ])
        }

        let model = try meta.getField(MLutModel.self, fieldId: nil) as! MLutModel
        
        
        for (k,l) in model.clutList.enumerated() {
            let data =  Data(bytes: try cipher.decrypt(Array(base64: (l as! String))))
            guard let mode = MLutExposureMode(index: k) ?? MLutExposureMode(rawValue: k) else {
                throw  NSError(domain: "com.dehancer.error",
                               code: Int(EINVAL),
                               userInfo: [
                                NSLocalizedDescriptionKey:
                                    String(format: NSLocalizedString("Type lut exposure mode: %i is not supported", comment:""), k),
                                NSLocalizedFailureReasonErrorKey:
                                    String(format: NSLocalizedString("Open file error", comment:""))
                    ])
            }
            if let image = NSImage(data: data) {
                let lut = try IMPCLut(context: context, haldImage: image)
                cLuts[mode] = try lut.convert(to: .lut_3d)
            }
            else {
                let error = NSError(domain: "com.dehancer.error",
                               code: Int(EINVAL),
                               userInfo: [
                                NSLocalizedDescriptionKey:
                                    String(format: NSLocalizedString("Type of lut data[%i] is not supported", comment:""), k),
                                NSLocalizedFailureReasonErrorKey:
                                    String(format: NSLocalizedString("Open file error", comment:""))
                    ])
                debugPrint("MLut.restore \(url) error: ", error)
            }
        }
        
        MLutFile.dataCache.setObject(cLuts as AnyObject, forKey: url.absoluteString as NSString)
        
        return self
    }
    
    fileprivate static var lock = NSLock()
    fileprivate var url:URL
    fileprivate var context:IMPContext //= IMPContext()
    
    fileprivate func cLutIdentity() -> IMPCLut {
        return try! IMPCLut(context: context,
                            lutType: .lut_3d,
                            lutSize: MLutSize.large.size,
                            format: .float,
                            title: "Dehancer mLut Maker CLUT Source")
    }
}
