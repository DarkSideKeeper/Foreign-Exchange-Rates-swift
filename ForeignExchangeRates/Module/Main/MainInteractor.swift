//
//  MainInteractor.swift
//  ForeignExchangeRates
//
//  Created Titipan Sakunwongsalee on 16/9/2562 BE.
//  Copyright © 2562 Titipan Sakunwongsalee. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import Alamofire

class MainInteractor: MainInteractorInputProtocol {

    weak var presenter: MainInteractorOutputProtocol?
    
    func callApiExchangeRates() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let dateString = formatter.string(from: date)
        let service = AppService.ExchangeRate(date: dateString)
        let headers: HTTPHeaders = [
            "Ocp-Apim-Subscription-Key": "7d1b09abe2ea413cbf95b2d99782ed37"
        ]
        
        Alamofire.request(service.url, headers: headers).response { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode(Array<ExchangeRatesModel>.self, from: data)
                self.presenter?.callApiExchangeRatesSuccess(model: model)
            } catch let error {
                print(error)
            }
        }
    }
}
