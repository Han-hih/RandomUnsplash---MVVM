//
//  RandomViewModel.swift
//  RandomUnsplash.MVVM
//
//  Created by 황인호 on 2023/09/18.
//

import Foundation

class RandomViewModel {
    let apiManager = APIRequest()
    
    var photo: Photo?
    
    var randomImage = ""
    
    func randomButtonTapped() {
        apiManager.randomPhoto { result in
            switch result {
            case .success(let photo):
                guard let photo = photo else { return }
                let randomImageUrl = photo.urls.regular
                self.randomImage = randomImageUrl
                print(randomImageUrl)
            case .failure(let error):
                switch error {
                case .dataError:
                    print("데이터 에러")
                case .networkingError:
                    print("네트워킹 에러")
                case .parseError:
                    print("파싱 에러")
                }
            }
        }
    }
}
