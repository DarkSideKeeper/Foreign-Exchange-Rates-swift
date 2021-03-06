//
//  ConvertCurrencyPresenter.swift
//  ForeignExchangeRates
//
//  Created Titipan Sakunwongsalee on 17/9/2562 BE.
//  Copyright © 2562 Titipan Sakunwongsalee. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class ConvertCurrencyPresenter: ConvertCurrencyPresenterProtocol, ConvertCurrencyInteractorOutputProtocol {

    weak private var view: ConvertCurrencyViewProtocol?
    var interactor: ConvertCurrencyInteractorInputProtocol?
    private let router: ConvertCurrencyWireframeProtocol
    
    var listRate: [ExchangeRatesModel] = []

    init(interface: ConvertCurrencyViewProtocol, interactor: ConvertCurrencyInteractorInputProtocol?, router: ConvertCurrencyWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

    func getListRate() -> [String] {
        let list = listRate.compactMap({$0.family})
        return list
    }
    
    func getRate(index: Int) -> ExchangeRatesModel {
        return listRate[index]
    }
}
