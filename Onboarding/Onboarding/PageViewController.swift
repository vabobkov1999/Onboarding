//
//  PageViewController.swift
//  Onboarding
//
//  Created by Vasily Bobkov  on 24.03.2022.
//

import UIKit



class PageViewController: UIViewController {
    
    //MARK: - Create Image
    
    private let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let swipeImage: UIImageView = {
        let swipeIV =  UIImageView(image: UIImage(systemName: "hand.draw"))
        swipeIV.contentMode = .scaleAspectFit
        swipeIV.tintColor = .systemBlue
        swipeIV.translatesAutoresizingMaskIntoConstraints = false
        return swipeIV
    }()
    
    private let figureImage: UIImageView = {
        let arrowIV = UIImageView(image: UIImage(systemName: "arrow.turn.left.up"))
        arrowIV.contentMode = .scaleAspectFit
        arrowIV.tintColor = .systemBlue
        arrowIV.translatesAutoresizingMaskIntoConstraints = false
        return arrowIV
    }()
    
    private let settingImage: UIImageView = {
        let setIV = UIImageView(image: UIImage(named: "setting"))
        setIV.contentMode = .scaleAspectFit
        setIV.translatesAutoresizingMaskIntoConstraints = false
        return setIV
    }()

    
    //MARK: - Create Labels
    
    private var mainLabel: UILabel = {
        let mlabel = UILabel()
        mlabel.font = UIFont.boldSystemFont(ofSize: 28)
        mlabel.textColor = .systemBlue
        mlabel.translatesAutoresizingMaskIntoConstraints = false
        return mlabel
    }()
    
    private var descriptionLabel: UILabel = {
        let desLabel = UILabel()
        desLabel.textColor = .white
        desLabel.font = UIFont.boldSystemFont(ofSize: 21)
        desLabel.textAlignment = .center
        desLabel.lineBreakMode = .byWordWrapping
        desLabel.numberOfLines = 6
        desLabel.translatesAutoresizingMaskIntoConstraints = false
        return desLabel
    }()
    
    private var firstInfoLabel: UILabel = {
       let fiLabel = UILabel()
        fiLabel.textColor = .lightGray
        fiLabel.font = UIFont.boldSystemFont(ofSize: 21)
        fiLabel.lineBreakMode = .byWordWrapping
        fiLabel.numberOfLines = 5
        fiLabel.translatesAutoresizingMaskIntoConstraints = false
        return fiLabel
    }()
    
    private var secondInfoLabel: UILabel = {
       let siLabel = UILabel()
        siLabel.textColor = .lightGray
        siLabel.font = UIFont.boldSystemFont(ofSize: 21)
        siLabel.lineBreakMode = .byWordWrapping
        siLabel.numberOfLines = 5
        siLabel.translatesAutoresizingMaskIntoConstraints = false
        return siLabel
    }()
    
    private var dismissButton: UIButton = {
        var button = UIButton()
        button = UIButton(type: .roundedRect)
        //button.setTitle("Пропустить", for: .normal)
       // button.setImage(UIImage(named: "close"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .systemPink
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(skipButtonAction), for: .touchUpInside)
        return button
    }()
    
    @objc func skipButtonAction(){
        dismiss(animated: true, completion: nil)
    }

    //MARK: - Lazy sub
    
    lazy var subView: [UIView] = [self.logoImage, self.mainLabel, self.descriptionLabel]
    
    //MARK: - Init
    
    init(pageWith: PageElement) {
        super.init(nibName: nil, bundle: nil)
        
        view.backgroundColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
        
        logoImage.image = pageWith.image
        mainLabel.text = pageWith.mainLabel
        descriptionLabel.text = pageWith.descriptionLabel
        
        
        
        for view in subView {
            self.view.addSubview(view)
        }
        
        edgesForExtendedLayout = []
        
        NSLayoutConstraint.activate([
            
            //MARK: - Image location & Size
            
        logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.size.height / 4),
        logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        logoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        logoImage.heightAnchor.constraint(equalToConstant: 150),
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        //MARK: - Labels location & Size
        
        mainLabel.topAnchor.constraint(equalTo: logoImage.topAnchor, constant: 160),
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        descriptionLabel.topAnchor.constraint(equalTo: mainLabel.topAnchor, constant: 40),
        descriptionLabel.widthAnchor.constraint(equalToConstant: 310),
        descriptionLabel.heightAnchor.constraint(equalToConstant: 170),
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor ),
        

        ])

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(firstPageWith: FirstPageElement) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
        
        logoImage.image = firstPageWith.image1
        mainLabel.text = firstPageWith.mainLabel1
        descriptionLabel.text = firstPageWith.descriptionLabel1
        firstInfoLabel.text = firstPageWith.fiLabel
        secondInfoLabel.text = firstPageWith.siLabel
        mainLabel.textColor = .white
        dismissButton.setImage(UIImage(named: "close"), for: .normal)
        
        view.addSubview(self.dismissButton)
        view.addSubview(self.firstInfoLabel)
        view.addSubview(self.secondInfoLabel)
        view.addSubview(self.swipeImage)
        view.addSubview(self.figureImage)
        
        for view in subView {
            self.view.addSubview(view)
        }
        
        edgesForExtendedLayout = []
        
        NSLayoutConstraint.activate([
            
            //MARK: - Image location & Size
            
        logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.size.height / 9),
        logoImage.heightAnchor.constraint(equalToConstant: view.bounds.size.height / 6),
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        //MARK: - Labels location & Size
        
        mainLabel.topAnchor.constraint(equalTo: logoImage.topAnchor, constant: view.bounds.size.height / 5),
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        descriptionLabel.topAnchor.constraint(equalTo: mainLabel.topAnchor, constant: 30),
        descriptionLabel.widthAnchor.constraint(equalToConstant: 310),
        descriptionLabel.heightAnchor.constraint(equalToConstant: 120),
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor ),
        
        dismissButton.topAnchor.constraint(equalTo: secondInfoLabel.bottomAnchor, constant: 20),
        dismissButton.leftAnchor.constraint(equalTo: figureImage.leftAnchor, constant: 0),
        dismissButton.widthAnchor.constraint(equalTo: swipeImage.heightAnchor, multiplier: 0.6),
        dismissButton.heightAnchor.constraint(equalTo: swipeImage.heightAnchor, multiplier: 0.6),
        
        firstInfoLabel.topAnchor.constraint(equalTo: secondInfoLabel.topAnchor, constant: 150),
        firstInfoLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        firstInfoLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 140),

        secondInfoLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: -view.bounds.size.height / 110),
        //secondInfoLabel.widthAnchor.constraint(equalToConstant: 200),
        secondInfoLabel.rightAnchor.constraint(equalTo: swipeImage.leftAnchor, constant: 10),
        secondInfoLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
        //secondInfoLabel.heightAnchor.constraint(equalToConstant: 150),

        
        swipeImage.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
        swipeImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.size.width / 2),
        swipeImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        swipeImage.heightAnchor.constraint(equalToConstant: view.bounds.size.height / 7),
        
        figureImage.topAnchor.constraint(equalTo: dismissButton.bottomAnchor, constant: 0),
        figureImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: view.bounds.size.width / 10),
        figureImage.heightAnchor.constraint(equalTo: swipeImage.heightAnchor, multiplier: 0.6),
        figureImage.widthAnchor.constraint(equalTo: swipeImage.heightAnchor, multiplier: 0.6),
        ])
        
        
    }
    
    
    init(LastPageWith: LastPageElement) {
        super.init(nibName: nil, bundle: nil)
        
        view.backgroundColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
        
        logoImage.image = LastPageWith.image
        mainLabel.text = LastPageWith.mainLabel
        descriptionLabel.text = LastPageWith.descriptionLabel
        firstInfoLabel.text = LastPageWith.fiLabel
        secondInfoLabel.text = LastPageWith.siLabel
        
        
        dismissButton.setTitle("Вперёд!", for: .normal)
        dismissButton.backgroundColor = .systemBlue
        dismissButton.tintColor = .white
        dismissButton.layer.cornerRadius = 10
        dismissButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        
        logoImage.tintColor = .systemPink
        mainLabel.textColor = .systemPink
        secondInfoLabel.textAlignment = .natural
        secondInfoLabel.numberOfLines = 6
        
        for view in subView {
            self.view.addSubview(view)
        }
        
        view.addSubview(self.firstInfoLabel)
        view.addSubview(self.secondInfoLabel)
        view.addSubview(self.settingImage)
        view.addSubview(self.dismissButton)
        
        edgesForExtendedLayout = []
        
        
        NSLayoutConstraint.activate([
            
            //MARK: - Image location & Size
            
        logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.size.height / 9),
        logoImage.heightAnchor.constraint(equalToConstant: view.bounds.size.height / 4.5),
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        logoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
   
        //MARK: - Labels location & Size
        
        mainLabel.topAnchor.constraint(equalTo: logoImage.topAnchor, constant: view.bounds.size.height / 4.5),
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        descriptionLabel.topAnchor.constraint(equalTo: mainLabel.topAnchor, constant: 20),
        descriptionLabel.widthAnchor.constraint(equalToConstant: 310),
        descriptionLabel.heightAnchor.constraint(equalToConstant: 120),
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor ),
        
        firstInfoLabel.topAnchor.constraint(equalTo: secondInfoLabel.bottomAnchor, constant: 10),
        firstInfoLabel.leftAnchor.constraint(equalTo: settingImage.leftAnchor),
        firstInfoLabel.rightAnchor.constraint(equalTo: dismissButton.leftAnchor, constant: -10),

        secondInfoLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: -view.bounds.size.height / 110),
        secondInfoLabel.leftAnchor.constraint(equalTo: settingImage.rightAnchor, constant: 10),
        secondInfoLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),

        settingImage.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 0),
        settingImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
        settingImage.heightAnchor.constraint(equalToConstant: view.bounds.size.height / 7),
        settingImage.widthAnchor.constraint(equalToConstant: view.bounds.size.height / 7),
        
        
        dismissButton.topAnchor.constraint(equalTo: secondInfoLabel.bottomAnchor, constant:  15 ),
        dismissButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        dismissButton.heightAnchor.constraint(equalToConstant: view.bounds.size.height / 14),
        dismissButton.widthAnchor.constraint(equalToConstant: view.bounds.size.width / 2.5),

        ])

        
    }
    
    
}

