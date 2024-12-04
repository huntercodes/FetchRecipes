//
//  ImageCacheManager.swift
//  FetchRecipes
//
//  Created by hunter downey on 12/3/24.
//

import UIKit

class ImageCacheManager {
    
    static let shared = ImageCacheManager()

    private let memoryCache = NSCache<NSString, UIImage>()
    
    private let fileManager = FileManager.default
    
    private lazy var cacheDirectory: URL = {
        let urls = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)
        return urls[0].appendingPathComponent("ImageCache", isDirectory: true)
    }()

    private init() {
        createCacheDirectoryIfNeeded()
    }

    private func createCacheDirectoryIfNeeded() {
        if !fileManager.fileExists(atPath: cacheDirectory.path) {
            try? fileManager.createDirectory(at: cacheDirectory, withIntermediateDirectories: true)
        }
    }

    func getCachedImage(forKey key: String) -> UIImage? {
        // Check memory cache first
        if let memoryImage = memoryCache.object(forKey: key as NSString) {
            return memoryImage
        }

        // Check disk cache
        let fileURL = cacheDirectory.appendingPathComponent(key)
        
        if let diskImage = UIImage(contentsOfFile: fileURL.path) {
            // Store in memory for quicker access next time
            memoryCache.setObject(diskImage, forKey: key as NSString)
            return diskImage
        }

        return nil
    }

    func cacheImage(_ image: UIImage, forKey key: String) {
        // Store in memory
        memoryCache.setObject(image, forKey: key as NSString)

        // Store on disk
        let fileURL = cacheDirectory.appendingPathComponent(key)
        guard let imageData = image.jpegData(compressionQuality: 1.0) else { return }
        try? imageData.write(to: fileURL)
    }

    func clearCache() {
        // Remove memory
        memoryCache.removeAllObjects()
        try? fileManager.removeItem(at: cacheDirectory)
        createCacheDirectoryIfNeeded()
    }
    
}
