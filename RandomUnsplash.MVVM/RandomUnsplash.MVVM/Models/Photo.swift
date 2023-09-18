//
//  Photo.swift
//  RandomUnsplash.MVVM
//
//  Created by 황인호 on 2023/09/19.
//

import Foundation

struct Photo: Codable, Hashable {
    let urls: PhotoURL
}

struct PhotoURL: Codable, Hashable {
    let regular: String
}
    
enum NetworkError: Error {
    case networkingError
    case dataError
    case parseError
}
