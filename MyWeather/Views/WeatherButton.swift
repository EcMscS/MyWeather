//
//  WeatherButton.swift
//  MyWeather
//
//  Created by Jeffrey Lai on 2/15/21.
//

import UIKit

class WeatherButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    convenience init(image: UIImage?) {
        self.init(frame: .zero)
        self.setImage(image, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func layoutSubviews() {
//        self.layer.masksToBounds = true
//        self.layer.cornerRadius = self.frame.height / 2
//        self.backgroundColor = .systemBackground
//    }
    
    private func configure() {
        self.isEnabled = true
        self.isUserInteractionEnabled = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
