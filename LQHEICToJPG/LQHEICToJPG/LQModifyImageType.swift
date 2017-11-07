//
//  LQModifyImageType.swift
//  ImageTest
//
//  Created by Artron_LQQ on 2017/11/2.
//  Copyright © 2017年 Artup. All rights reserved.
//

import UIKit
import Photos

extension UIImage {
    
    class func imageWithHeic(_ data: Data) -> UIImage? {
        
        let ciImage = CIImage(data: data)
        guard let image = ciImage else {
            return nil
        }
        
        return UIImage(ciImage: image)
    }
    
    class func imageWithHeic(_ url: URL) -> UIImage? {
        
        let ciImage = CIImage(contentsOf: url)
        guard let image = ciImage else {
            return nil
        }
        
        return UIImage(ciImage: image)
    }
}

extension PHAsset {
    var isHEIC: Bool {
        
        let resources = PHAssetResource.assetResources(for: self)
        for resource in resources {
            let uti = resource.uniformTypeIdentifier
            if uti == "public.heif" || uti == "public.heic" { return true }
        }
        
        return false
    }
    
}

class LQModifyImageType: NSObject {

    func toJPG(_ url: URL) -> Data? {
        
        let ciImage = CIImage(contentsOf: url)
        guard let image = ciImage else {
            return nil
        }
        
        let context = CIContext()
        let jpgData = context.jpegRepresentation(of: image, colorSpace: image.colorSpace!, options: [:])
        
        return jpgData
    }
    
    func toJPG(_ data: Data) -> Data? {
        
        let ciImage = CIImage(data: data)
        guard let image = ciImage else {
            return nil
        }
        
        let context = CIContext()
        let jpgData = context.jpegRepresentation(of: image, colorSpace: image.colorSpace!, options: [:])
        
        return jpgData
        /* options 参数
         kCGImageDestinationLossyCompressionQuality 压缩质量0 -- 1 CFNumberRef
         kCIImageRepresentationAVDepthData
         kCIImageRepresentationDepthImage
         kCIImageRepresentationDisparityImage
         */
    }

    func writeJPG(_ data: Data, toURL url: URL) -> Bool {
        let ciImage = CIImage(data: data)
        guard let image = ciImage else {
            return false
        }
        
        let context = CIContext()
        
        do {
//            kCGImageDestinationLossyCompressionQuality
            try context.writeJPEGRepresentation(of: image, to: url, colorSpace: image.colorSpace!, options: [:])
            return true
        } catch (let error) {
            print(error)
            return false
        }
    }
    
    func toPNG(_ url: URL) -> Data? {
        
        let ciImage = CIImage(contentsOf: url)
        guard let image = ciImage else {
            return nil
        }
        
        let context = CIContext()
        let pngData = context.pngRepresentation(of: image, format: kCIFormatABGR8, colorSpace: image.colorSpace!, options: [:])
        return pngData
    }
    
    func toPNG(_ data: Data) -> Data? {
        
        let ciImage = CIImage(data: data)
        guard let image = ciImage else {
            return nil
        }
        
        let context = CIContext()
        let pngData = context.pngRepresentation(of: image, format: kCIFormatABGR8, colorSpace: image.colorSpace!, options: [:])
        return pngData
    }
    
    func writePNG(_ data: Data, toURL url: URL) -> Bool {
        let ciImage = CIImage(data: data)
        guard let image = ciImage else {
            return false
        }
        
        let context = CIContext()
        
        do {
            try context.writePNGRepresentation(of: image, to: url, format: kCIFormatABGR8, colorSpace: image.colorSpace!, options: [:])
            return true
        } catch (let error) {
            print(error)
            return false
        }
    }
    
    func toHEIC(_ url: URL) -> Data? {
        let ciImage = CIImage(contentsOf: url)
        guard let image = ciImage else {
            return nil
        }
        
        let context = CIContext()
        let heicData = context.heifRepresentation(of: image, format: kCIFormatABGR8, colorSpace: image.colorSpace!, options: [:])
        return heicData
    }
    
    func toHEIC(_ data: Data) -> Data? {
        let ciImage = CIImage(data: data)
        guard let image = ciImage else {
            return nil
        }
        
        let context = CIContext()
        let heicData = context.heifRepresentation(of: image, format: kCIFormatABGR8, colorSpace: image.colorSpace!, options: [:])
        return heicData
    }
    
    func writeHEIC(_ data: Data, toURL url: URL) -> Bool {
        let ciImage = CIImage(data: data)
        guard let image = ciImage else {
            return false
        }
        
        let context = CIContext()
        
        do {
            
            try context.writeHEIFRepresentation(of: image, to: url, format: kCIFormatABGR8, colorSpace: image.colorSpace!, options: [:])
            return true
        } catch (let error) {
            print(error)
            return false
        }
    }
}



