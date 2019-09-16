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

class MainInteractor: MainInteractorInputProtocol {

    weak var presenter: MainInteractorOutputProtocol?
    
    func callApiExchangeRates() {
        presenter?.callApiExchangeRatesSuccess(model: [])
    }
}
