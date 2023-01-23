//
//  SecondViewController.swift
//  BMI
//
//  Created by Никита Ясеник on 23.01.2023.
//

import UIKit
import SwiftUI

class SecondViewController: UIViewController {
    
    var bmiValue: Float = 0.0
    
    let backgroundImage: UIImage? = UIImage(named: "result_background")
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: backgroundImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var labelForBMIValue: UILabel = {
        $0.text = "\(bmiValue)"
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = $0.font.withSize(50)
        
        return $0
    }(UILabel())
    
    lazy var topLabel: UILabel = {
        $0.text = "YOUR RESULT"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private lazy var reCalculateButton: UIButton = {
        var buttonConfig = UIButton.Configuration.plain()
        buttonConfig.title = "RECALCULATE"
        buttonConfig.baseForegroundColor = .purple
        
        let button = UIButton(configuration: buttonConfig, primaryAction: UIAction(){_ in
            self.goToMainScreen()
        })
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    func goToMainScreen() {
        self.dismiss(animated: true)
    }
    
    

    func setupView() {
        view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        view.addSubview(backgroundImageView)
        view.addSubview(topLabel)
        view.addSubview(labelForBMIValue)
        view.addSubview(reCalculateButton)
        
        NSLayoutConstraint.activate([
            backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            
            labelForBMIValue.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 20),
            labelForBMIValue.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            reCalculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            reCalculateButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            reCalculateButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            reCalculateButton.heightAnchor.constraint(equalToConstant: 50)
            
            
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
}

struct Provider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> some UIViewController {
            return SecondViewController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
