//
//  CurrentWeatherVC.swift
//  MyWeather
//
//  Created by Jeffrey Lai on 2/15/21.
//

import UIKit
import CoreLocation
import SwiftUI

class CurrentWeatherVC: MWDataLoadingVC {

    let currentLocationButton = WeatherButton(image: CustomIcons.customCurrentLocation)
    let weatherImageView = WeatherImageView()
    let animatedImageViews = [WeatherImageView]()
    let backgroundImageView = WeatherImageView()
    
    let locationLabel = WeatherLabel(font: UIFont.preferredFont(forTextStyle: .largeTitle), alignment: .center)
    let weatherConditionLabel = WeatherLabel(font: UIFont.preferredFont(forTextStyle: .title1), alignment: .center)
    let temperatureLabel = WeatherLabel(font: UIFont(name: CustomFont.temperatureLabelFont, size: 130)!, alignment: .center)
    let timeLabel = WeatherLabel(font: UIFont.preferredFont(forTextStyle: .title2), alignment: .center)
    
    let bottomView = UIView()
    
    var timeSegment = WeatherSegmentControl(frame: .zero, buttonTitles: TimeSegments.times, initialSelection: 0)
    var timeWeatherCollectionView: UICollectionView!
    
    var locationManager: CLLocationManager?
    
    let padding : CGFloat = 20
    let numberOfWeatherCards = 5
    
    var currentWeather = WeatherMain()
    var weatherForecast = WeatherSub()
    var currentLocation: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureTopView()
        configureBottomView()
        configureCoreLocation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getCurrentLocation()
    }
    
    private func updateData(with currentWeather: WeatherMain) {
        locationLabel.text = currentWeather.cityName
        weatherConditionLabel.text = currentWeather.conditionDescription
        temperatureLabel.text = "\(currentWeather.temperatureString)°"
        timeLabel.text = Date().getCurrentDate()
        weatherImageView.image = UIImage(named: currentWeather.conditionImageName)
    }
    
    private func configureVC() {
        //TODO
        //view.backgroundColor = determineBackgroundColor()
        
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.image = BackgroundImages.weatherBackground
        view.addSubview(backgroundImageView)
        backgroundImageView.pinToEdges(of: view)
        
    }
    
    private func configureTopView() {
        view.addSubview(locationLabel)
        view.addSubview(weatherConditionLabel)
        view.addSubview(temperatureLabel)
        view.addSubview(currentLocationButton)
        view.addSubview(weatherImageView)
        view.addSubview(timeLabel)
        
        temperatureLabel.minimumScaleFactor = 0.5
 
        currentLocationButton.addTarget(self, action: #selector(getCurrentLocation), for: .touchUpInside)

        weatherImageView.contentMode = .scaleAspectFit
        view.bringSubviewToFront(weatherImageView)
        
        
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            locationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: 60),
            
            weatherConditionLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10),
            weatherConditionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherConditionLabel.heightAnchor.constraint(equalToConstant: 60),
            
            temperatureLabel.topAnchor.constraint(equalTo: weatherConditionLabel.bottomAnchor, constant: 0),
            temperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            temperatureLabel.widthAnchor.constraint(equalToConstant: view.frame.width * 3 / 4),
            
            currentLocationButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            currentLocationButton.trailingAnchor.constraint(equalTo: locationLabel.leadingAnchor, constant: -padding),
            currentLocationButton.heightAnchor.constraint(equalToConstant: 60),
            currentLocationButton.widthAnchor.constraint(equalToConstant: 60),
            
            weatherImageView.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: -20),
            weatherImageView.heightAnchor.constraint(equalToConstant: view.frame.height / 4),
            weatherImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            weatherImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            
            timeLabel.topAnchor.constraint(equalTo: weatherImageView.bottomAnchor, constant: 0),
            timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timeLabel.heightAnchor.constraint(equalToConstant: 60)
        
        ])
    }
    
    private func configureBottomView() {
        timeSegment.selectorViewColor = .white
        timeSegment.selectorTextColor = .white
        timeSegment.backgroundColor = .clear
        timeSegment.delegate = self
        
        timeWeatherCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createThreeItemHorizontalScolling(in: view))
        timeWeatherCollectionView.delegate = self
        timeWeatherCollectionView.dataSource = self
        timeWeatherCollectionView.register(SegmentWeatherCollectionViewCell.self, forCellWithReuseIdentifier: SegmentWeatherCollectionViewCell.reuseID)
        timeWeatherCollectionView.backgroundColor = .clear
        timeWeatherCollectionView.isDirectionalLockEnabled = true
        timeWeatherCollectionView.showsHorizontalScrollIndicator = false
        
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        timeSegment.translatesAutoresizingMaskIntoConstraints = false
        timeWeatherCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(bottomView)
        bottomView.addSubview(timeSegment)
        bottomView.addSubview(timeWeatherCollectionView)
        
        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 10),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: view.frame.height / 4),
            
            timeSegment.topAnchor.constraint(equalTo: bottomView.topAnchor),
            timeSegment.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            timeSegment.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor),
            timeSegment.heightAnchor.constraint(equalToConstant: 40),
            
            timeWeatherCollectionView.topAnchor.constraint(equalTo: timeSegment.bottomAnchor, constant: 10),
            timeWeatherCollectionView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            timeWeatherCollectionView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor),
            timeWeatherCollectionView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor)
        ])
        
    }
    
    private func configureCoreLocation() {
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        
        let status = locationManager?.authorizationStatus
        
        switch status {
        case .notDetermined:
            locationManager?.requestWhenInUseAuthorization()
        default:
            locationManager?.desiredAccuracy = kCLLocationAccuracyHundredMeters
        }
    }

    
    private func determineBackgroundColor() -> UIColor {
        //TODO: Determine color of background depending sunset / sunrise
        
        return TimeOfDay.dayTime
    }
    
    @objc private func getCurrentLocation() {
        currentLocation = CLLocation()
        locationManager?.requestLocation()
    }
    
    func getWeatherFromLocation(currentLocation: CLLocationCoordinate2D) {
        
        NetworkManager.shared.getWeather(currentLocation: currentLocation) { [weak self] (weatherResult) in

            guard let self = self else { return }
            
            switch weatherResult {
            case .success(let weatherData):
                self.currentWeather.cityName = weatherData.name!
                self.currentWeather.conditionID = (weatherData.weather?.first?.id)!
                self.currentWeather.temperature = (weatherData.main?.temp)!
                self.currentWeather.coordinates.latitude = (weatherData.coord?.lat)!
                self.currentWeather.coordinates.longitde = (weatherData.coord?.lon)!
                self.currentWeather.conditionDescription = (weatherData.weather?.first?.main)!
                
                DispatchQueue.main.async {
                    self.updateData(with: self.currentWeather)
                }
                
            case .failure(let error):
                assertionFailure("Error: \(error.localizedDescription)")
            }
            
        }
    }
    
    func getExtendedWeatherInfo(currentLocation: CLLocationCoordinate2D) {
        
        //showLoadingView()
        
        NetworkManager.shared.getOneCallWeather(currentLocation: currentLocation) { [weak self](result) in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let weatherOneCall):
                self.weatherForecast.currentTime = weatherOneCall.current.dt
                self.weatherForecast.daily = weatherOneCall.daily
                self.weatherForecast.hourly = weatherOneCall.hourly
                
                DispatchQueue.main.async {
                    self.timeWeatherCollectionView.reloadData()
                }
            case .failure(let error):
                print("FAILURE Error: \(error.localizedDescription)")
            }
        }
        
        
        //dismissLoadingView()
    }

}

extension CurrentWeatherVC: WeatherSegmentControlDelegate {
    func change(to index: Int) {
        self.timeSegment.setIndex(index: index)
        
        timeWeatherCollectionView.reloadData()
    }
}

extension CurrentWeatherVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfWeatherCards
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = timeWeatherCollectionView.dequeueReusableCell(withReuseIdentifier: SegmentWeatherCollectionViewCell.reuseID, for: indexPath) as? SegmentWeatherCollectionViewCell else { return UICollectionViewCell() }
        cell.set(weather: weatherForecast, index: indexPath.row, segmentIndex: timeSegment.selectedIndex)
        return cell
        
    }
}

extension CurrentWeatherVC: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse {
            //Authorization Granted for using current location
            //Actions here if necessary
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty {
            currentLocation = locations.last
            getWeatherFromLocation(currentLocation: currentLocation.coordinate)
            getExtendedWeatherInfo(currentLocation: currentLocation.coordinate)
        } else {
            assertionFailure("No location was obtained")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        assertionFailure("Failed to obtain current location: \(error)")
    }
    
}

//MARK: SwiftUI Preview
//struct CurrentWeatherVC_Previews: PreviewProvider {
//    static var previews: some View {
//            UIViewControllerPreview { () -> UIViewController in
//                CurrentWeatherVC()
//            }
//    }
//}
