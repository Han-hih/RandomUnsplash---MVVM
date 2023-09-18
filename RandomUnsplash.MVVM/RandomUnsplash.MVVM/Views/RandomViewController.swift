//
//  ViewController.swift
//  RandomUnsplash.MVVM
//
//  Created by 황인호 on 2023/09/18.
//

import UIKit

class RandomViewController: UIViewController {

    let viewModel = RandomViewModel()
    
    let randomImageView = {
        let view = UIImageView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let randomButton = {
        let bt = UIButton()
        bt.setTitle("랜덤 이미지", for: .normal)
        bt.backgroundColor = .red
        bt.setTitleColor(UIColor.white, for: .normal)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.addTarget(self, action: #selector(randomButtonTouched), for: .touchUpInside)
       return bt
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(randomImageView)
        view.addSubview(randomButton)
        setAutoLayout()
    }
    @objc func randomButtonTouched() {
        viewModel.randomButtonTapped()
    }
    
    func setAutoLayout() {
        NSLayoutConstraint.activate([
            //랜덤이미지 뷰
            randomImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            randomImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            randomImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            randomImageView.widthAnchor.constraint(equalTo: randomImageView.heightAnchor, multiplier: 0.6),
            //랜덤 버튼
            randomButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            randomButton.topAnchor.constraint(equalTo: randomImageView.bottomAnchor, constant: 20)
            
        ])
        
        
        
        
        
        
    }
    

}

