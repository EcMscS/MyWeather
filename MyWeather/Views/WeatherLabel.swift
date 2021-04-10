//
//  weatherLabel.swift
//  MyWeather
//
//  Created by Jeffrey Lai on 2/15/21.
//

import UIKit

class WeatherLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    convenience init(font: UIFont, alignment: NSTextAlignment) {
        self.init(frame: .zero)
        self.font = font
        self.textAlignment = alignment
    }
    
    convenience init(text: String, font: UIFont, alignment: NSTextAlignment) {
        self.init(frame: .zero)
        self.text = text 
        self.font = font
        self.textAlignment = alignment
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        numberOfLines = 1
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
    }

}
