//
//  ViewController.swift
//  BMI
//
//  Created by Никита Ясеник on 19.01.2023.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    let backgroundImage: UIImage = UIImage(named: "calculate_background")!
    
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView(image: backgroundImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var headLabel: UILabel = {
        let label = UILabel()
        label.text = "CALCULATE  \n YOUR BMI"
        label.textColor = #colorLiteral(red: 0.246254921, green: 0.246254921, blue: 0.246254921, alpha: 1)
        label.font = label.font.withSize(50)
        label.textAlignment = .left
        label.numberOfLines = 2
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var heightTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Height"
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var currentHeightValue = 1.0
    
    private lazy var heightScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "\(currentHeightValue)m"
        label.textColor = .darkGray
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var heightSlider: UISlider = {
        let slider = UISlider()
        slider.setValue(1.5, animated: false)
        slider.minimumValue = 0
        slider.maximumValue = 3
        slider.thumbTintColor = .purple
        slider.tintColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        slider.addTarget(self, action: #selector(changeHeightValue), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false

        
        return slider
    }()
    
    @objc func changeHeightValue() {
        heightScoreLabel.text = String(format: "%.1fm", heightSlider.value)
    }
    
    private lazy var weightTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Weight"
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var currentWeightValue = 0
    
    private lazy var weightScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "\(currentWeightValue)Kg"
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var weightSlider: UISlider = {
        let slider = UISlider()
        slider.setValue(1.5, animated: false)
        slider.minimumValue = 0
        slider.maximumValue = 200
        slider.thumbTintColor = .purple
        slider.tintColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        slider.addTarget(self, action: #selector(changeWeightValue), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false

        
        return slider
    }()
    
    @objc func changeWeightValue() {
        weightScoreLabel.text = String(format: "%.1fKg", weightSlider.value)
    }
    
    private lazy var calculateButton: UIButton = {
        var buttonConfig = UIButton.Configuration.plain()
        buttonConfig.title = "CALCULATE"
        buttonConfig.baseForegroundColor = .white
        
        let button = UIButton(configuration: buttonConfig, primaryAction: UIAction(){_ in
            self.calculateBMI()
        })
        button.backgroundColor = #colorLiteral(red: 0.7325697541, green: 0.5040931106, blue: 1, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    func calculateBMI() {
        let weight = weightSlider.value
        let height = heightSlider.value
        
        let bmiValue = Float(weight) / (Float(weight) * Float(height))
        
        let secondVC = SecondViewController()
        secondVC.bmiValue = bmiValue
        self.present(secondVC, animated: true)
    }
    
    func setupView() {
        view.addSubview(backgroundView)
        view.addSubview(headLabel)
        view.addSubview(heightTextLabel)
        view.addSubview(heightScoreLabel)
        view.addSubview(heightSlider)
        view.addSubview(weightTextLabel)
        view.addSubview(weightScoreLabel)
        view.addSubview(weightSlider)
        view.addSubview(calculateButton)
        
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            headLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            headLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            headLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            //
            heightTextLabel.topAnchor.constraint(equalTo: headLabel.bottomAnchor),
            heightTextLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            //
            heightScoreLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            heightScoreLabel.topAnchor.constraint(equalTo: headLabel.bottomAnchor),
            //
            heightSlider.topAnchor.constraint(equalTo: heightTextLabel.bottomAnchor, constant: 30),
            heightSlider.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            heightSlider.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
//            //
            weightTextLabel.topAnchor.constraint(equalTo: heightSlider.bottomAnchor, constant: 25),
            weightTextLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),

            weightScoreLabel.topAnchor.constraint(equalTo: heightSlider.bottomAnchor, constant: 25),
            weightScoreLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
//
            weightSlider.topAnchor.constraint(equalTo: weightTextLabel.bottomAnchor, constant: 30),
            weightSlider.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            weightSlider.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
//
            calculateButton.topAnchor.constraint(equalTo: weightSlider.bottomAnchor, constant: 30),
            calculateButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            calculateButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            calculateButton.heightAnchor.constraint(equalToConstant: 50)
            
            
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }


}

struct MyProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> some UIViewController {
            return ViewController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}

