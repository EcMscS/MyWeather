//
//  SegmentWeatherCollectionViewCell.swift
//  MyWeather
//
//  Created by Jeffrey Lai on 2/17/21.
//

import UIKit

class SegmentWeatherCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "weatherCollectionViewCell"
    var cardView = UIView()
    let timeLabel = WeatherLabel(font: UIFont.preferredFont(forTextStyle: .body), alignment: .center)
    let temperatureLabel = WeatherLabel(font: UIFont.preferredFont(forTextStyle: .body), alignment: .center)
    let weatherImageView = WeatherImageView()
    
    let padding:CGFloat = 5
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(weather: WeatherSub, index: Int, segmentIndex: Int) {
        
        if weather.daily.isEmpty || weather.hourly.isEmpty { return }
        
        //0 is Today and 1 is Week
        switch segmentIndex {
            case 0:
                let time = weather.hourly[index].dt
                let temp = weather.hourly[index].temp
                let condition = weather.hourly[index].weather[0].id //Better way to do this?
                
                timeLabel.text = weather.convertFromUnixTimeToCurrentTime(time: time)
                temperatureLabel.text = weather.convertTempDoubleToString(temp: temp)
                weatherImageView.image = UIImage(named: weather.retrieveWeatherIconName(condID: condition))
                
            case 1:
                let time = weather.daily[index].dt
                let temp = weather.daily[index].temp.day
                let condition = weather.daily[index].weather[0].id
                
                timeLabel.text = weather.convertFromUnixTimeToCurrentDay(time: time)
                temperatureLabel.text = weather.convertTempDoubleToString(temp: temp)
                weatherImageView.image = UIImage(named: weather.retrieveWeatherIconName(condID: condition))
            default:
                break
        }
        
    }
    
    private func configure() {
        backgroundColor = .clear
        
        cardView.backgroundColor = CustomColors.backgroundColorForCollectionCell
        cardView.layer.cornerRadius = 15
        cardView.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(cardView)
        self.addSubview(timeLabel)
        self.addSubview(weatherImageView)
        self.addSubview(temperatureLabel)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            timeLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: padding),
            timeLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: padding),
            timeLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -padding),
            timeLabel.heightAnchor.constraint(equalToConstant: 20),
            
            weatherImageView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 10),
            weatherImageView.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            
            temperatureLabel.topAnchor.constraint(equalTo: weatherImageView.bottomAnchor, constant: 10),
            temperatureLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            temperatureLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -padding)
        ])
    }
    
}
