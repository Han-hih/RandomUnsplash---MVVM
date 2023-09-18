//
//  APIRequest.swift
//  RandomUnsplash.MVVM
//
//  Created by 황인호 on 2023/09/18.
//

import UIKit

class APIRequest {
    
    func randomPhoto(completion: @escaping (Result<Photo?, NetworkError>) -> Void) {
    
        guard let url = URL(string: "https://api.unsplash.com/photos/random/?client_id=\(APIKey.unsplashKey)") else { return }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(.networkingError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.dataError))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(Photo.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(result))
                }
                return
            } catch {
                completion(.failure(.parseError))
            }
        }.resume()
        
    }
    
}


