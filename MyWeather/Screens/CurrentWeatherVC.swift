//
//  CurrentWeatherVC.swift
//  MyWeather
//
//  Created by Jeffrey Lai on 2/15/21.
//

import UIKit

class CurrentWeatherVC: UIViewController {

    let currentLocationButton = WeatherButton(image: CustomIcons.customCurrentLocation)
    let weatherImageView = WeatherImageView()
    let animatedImageViews = [WeatherImageView]()
    
    let locationLabel = WeatherLabel(font: UIFont.preferredFont(forTextStyle: .largeTitle), alignment: .center)
    let weatherConditionLabel = WeatherLabel(font: UIFont.preferredFont(forTextStyle: .title1), alignment: .center)
    let temperatureLabel = WeatherLabel(font: UIFont(name: "GillSans-Bold", size: 300)!, alignment: .center)
    let timeLabel = WeatherLabel(font: UIFont.preferredFont(forTextStyle: .title2), alignment: .center)
    
    var timeSegment: UISegmentedControl!
    var timeWeatherCollectionView: UICollectionView!
    
    let padding : CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testData()
        configureVC()
        configureLabels()
        configureImageViews()
        configureSegmentController()
        configureCollectionView()
    }
    
    private func testData() {
        locationLabel.text = "Los Angeles"
        weatherConditionLabel.text = "Cloudy"
        temperatureLabel.text = "105°"
        timeLabel.text = "February 16, 2021"
    }
    
    private func configureVC() {
        view.backgroundColor = determineBackgroundColor()
    }
    
    private func configureLabels() {
        view.addSubview(locationLabel)
        view.addSubview(weatherConditionLabel)
        view.addSubview(temperatureLabel)
        
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            locationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: 60),
            
            weatherConditionLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 50),
            weatherConditionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherConditionLabel.heightAnchor.constraint(equalToConstant: 60),
            
            temperatureLabel.topAnchor.constraint(equalTo: weatherConditionLabel.bottomAnchor, constant: 25),
            temperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            temperatureLabel.heightAnchor.constraint(equalToConstant: view.frame.height * 1 / 4),
            temperatureLabel.widthAnchor.constraint(equalToConstant: view.frame.width * 3 / 4),
        ])
    }
    
    private func configureImageViews() {
        currentLocationButton.addTarget(self, action: #selector(getCurrentLocation), for: .touchUpInside)
        view.addSubview(currentLocationButton)
        
        NSLayoutConstraint.activate([
            currentLocationButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            currentLocationButton.trailingAnchor.constraint(equalTo: locationLabel.leadingAnchor, constant: -padding),
            currentLocationButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func configureSegmentController() {

    }
    
    private func configureCollectionView() {
        
    }
    
    private func determineBackgroundColor() -> UIColor {
        //TODO: Determine color of background depending sunset / sunrise
        return TimeOfDay.dayTime
    }
    
    @objc private func getCurrentLocation() {
        print("Current Location is: ?")
    }

}
