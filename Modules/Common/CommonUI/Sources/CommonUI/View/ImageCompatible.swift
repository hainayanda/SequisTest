//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import Foundation
import SwiftUI

// MARK: ImageConvertibleType

public enum ImageConvertibleType {
    case asset(name: String, bundle: Bundle)
    case url(URL)
    case system(name: String)
    case uiImage(UIImage)
}

// MARK: ImageConvertible

public protocol ImageConvertible {
    var type: ImageConvertibleType { get }
}

// MARK: BundleImage

struct BundleImage: ImageConvertible {
    let name: String
    let bundle: Bundle
    
    var type: ImageConvertibleType { .asset(name: name, bundle: bundle) }
}

// MARK: ImageConvertible extensions implementation

extension URL: ImageConvertible {
    public var type: ImageConvertibleType { .url(self) }
}

extension ImageCompatible {
    struct ResizeValue {
        let capInsets: EdgeInsets
        let resizingMode: Image.ResizingMode
    }
}

// MARK: ImageCompatible

public struct ImageCompatible: View {
    
    let type: ImageConvertibleType
    let resizeValue: ResizeValue?
    
    public init(_ convertible: ImageConvertible) {
        self.type = convertible.type
        self.resizeValue = nil
    }
    
    init(_ type: ImageConvertibleType, resizeValue: ResizeValue) {
        self.type = type
        self.resizeValue = resizeValue
    }
    
    public var body: some View {
        switch type {
        case .asset(let name, let bundle):
            makeResizableIfNeeded(for: Image(name, bundle: bundle))
        case .url(let url):
            AsyncImage(url: url)
        case .system(let name):
            makeResizableIfNeeded(for: Image(systemName: name))
        case .uiImage(let image):
            makeResizableIfNeeded(for: Image(uiImage: image))
        }
    }
    
    func makeResizableIfNeeded(for image: Image) -> Image {
        guard let resizeValue else { return image }
        return image
            .resizable(
                capInsets: resizeValue.capInsets,
                resizingMode: resizeValue.resizingMode
            )
    }
    
    public func resizable(capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> ImageCompatible {
        return ImageCompatible(type, resizeValue: ResizeValue(capInsets: capInsets, resizingMode: resizingMode))
    }
}

// MARK: ImageCompatible_Previews

struct ImageCompatible_Previews: PreviewProvider {
    static var previews: some View {
        ImageCompatible(Bundle.module.image(name: "Test"))
            .resizable()
    }
}
