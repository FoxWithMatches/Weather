//
//  ViewController.swift
//  testAPI
//
//  Created by Alisa Ts on 26.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageWeather: UIImageView!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var feelsLikeLabel: UILabel!
    
    var networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.onCompletion = { currentWeather in
            self.updateInterface(weather: currentWeather)
        }
        networkManager.fetchCurrentWeather(forCity: "London")
    }

    @IBAction func searchBtn(_ sender: Any) {
        self.presentSearchAlertController(withTitle: "Enter city Name", message: "", style: .alert) { city in
            self.networkManager.fetchCurrentWeather(forCity: city)
        }
    }
    
    func updateInterface(weather: CurrentWeather) {
        DispatchQueue.main.async {
            
            self.cityLabel.text = weather.cityName
            self.temperatureLabel.text = "\(weather.temperatureString)ºC"
            self.feelsLikeLabel.text = "Feels like \(weather.feelsLikeTemperatureString)ºC"
            self.imageWeather.image = UIImage(systemName: weather.systemIconNameString)
        }
    }
}

