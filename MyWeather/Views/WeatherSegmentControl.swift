//
//  WeatherSegmentControl.swift
//  MyWeather
//
//  Created by Jeffrey Lai on 2/17/21.
//

import UIKit

protocol WeatherSegmentControlDelegate: class {
    func change(to index: Int)
}

class WeatherSegmentControl: UIView {

    private var buttonTitles:[String]!
    private var buttons: [UIButton]!
    private var selectorView: UIView!
    
    var textColor: UIColor = .label
    var selectorViewColor: UIColor = .systemRed
    var selectorTextColor: UIColor = .systemRed
    
    weak var delegate: WeatherSegmentControlDelegate?
    
    public private(set) var selectedIndex: Int = 0
    
    convenience init(frame: CGRect, buttonTitles: [String]) {
        self.init(frame: frame)
        self.buttonTitles = buttonTitles
    }
    
    convenience init(frame: CGRect, buttonTitles: [String], initialSelection: Int) {
        self.init(frame: frame)
        self.buttonTitles = buttonTitles
        selectedIndex = initialSelection
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.backgroundColor = .clear
        updateView()
    }
    
    func setButtonTitles(buttonTitles: [String]) {
        self.buttonTitles = buttonTitles
        self.updateView()
    }
    
    func setIndex(index: Int) {
        buttons.forEach( { $0.setTitleColor(textColor, for: .normal)} )
        let button = buttons[index]
        selectedIndex = index
        button.setTitleColor(selectorTextColor, for: .normal)
        let selectorPosition = frame.width/CGFloat(buttonTitles.count) * CGFloat(index)
        UIView.animate(withDuration: 0.2) {
            self.selectorView.frame.origin.x = selectorPosition
        }
    }
    
    @objc func buttonAction(sender: UIButton) {
        for (buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            if btn == sender {
                let selectorPosition = frame.width/CGFloat(buttonTitles.count) * CGFloat(buttonIndex)
                selectedIndex = buttonIndex
                delegate?.change(to: selectedIndex)
                UIView.animate(withDuration: 0.3) {
                    self.selectorView.frame.origin.x = selectorPosition
                }
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
    }
}

//Configuration View
extension WeatherSegmentControl {
    
    private func updateView() {
        createButton()
        configureSelectorView()
        configureStackView()
    }
    
    private func configureStackView() {
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: self.topAnchor),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func createButton() {
        buttons = [UIButton]()
        buttons.removeAll()
        
        subviews.forEach({ $0.removeFromSuperview() })
        
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.isUserInteractionEnabled = true
            button.isEnabled = true
            button.addTarget(self, action: #selector(WeatherSegmentControl.buttonAction(sender:)), for: .touchUpInside)
            button.setTitleColor(textColor, for: .normal)
            buttons.append(button)
        }
        
        //Set Initial State
        buttons[self.selectedIndex ].setTitleColor(selectorTextColor, for: .normal)
    }
    
    private func configureSelectorView() {
        let selectorWidth = frame.width / CGFloat(self.buttonTitles.count)
        selectorView = UIView(frame: CGRect(x: frame.width/CGFloat(buttonTitles.count) * CGFloat(selectedIndex), y: self.frame.height, width: selectorWidth, height: 2))
        selectorView.backgroundColor = selectorViewColor
        addSubview(selectorView)
    }
    
}
