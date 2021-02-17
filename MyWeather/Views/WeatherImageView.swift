//
//  weatherImageView.swift
//  MyWeather
//
//  Created by Jeffrey Lai on 2/15/21.
//

import UIKit

class WeatherImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init() {
        self.init(frame: .zero)
    }
    
    convenience override init(image: UIImage?) {
        self.init(frame: .zero)
        self.image = image
    }
    
    private func configure() {
        contentMode = .scaleAspectFit
        tintColor = .label
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
