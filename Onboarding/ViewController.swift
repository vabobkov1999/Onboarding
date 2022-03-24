//
//  ViewController.swift
//  Onboarding
//
//  Created by Vasily Bobkov  on 24.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 0, y: 0, width: 150, height: 80)
        button.center = self.view.center
        button.setTitle("Onboarding", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .purple
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
        
    }

    
    @objc func buttonAction(){
        
        let  pagevc = MainPageViewController()
        pagevc.modalPresentationStyle = .fullScreen
        present(pagevc, animated: true, completion: nil)
        
    }

}

