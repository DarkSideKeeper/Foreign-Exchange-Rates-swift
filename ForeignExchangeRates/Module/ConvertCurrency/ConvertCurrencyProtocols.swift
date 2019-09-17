//
//  ConvertCurrencyProtocols.swift
//  ForeignExchangeRates
//
//  Created Titipan Sakunwongsalee on 17/9/2562 BE.
//  Copyright © 2562 Titipan Sakunwongsalee. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol ConvertCurrencyWireframeProtocol: class {

}
//MARK: Presenter -
protocol ConvertCurrencyPresenterProtocol: class {

    var interactor: ConvertCurrencyInteractorInputProtocol? { get set }
    
    func getListRates() -> [String]
}

//MARK: Interactor -
protocol ConvertCurrencyInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
}

protocol ConvertCurrencyInteractorInputProtocol: class {

    var presenter: ConvertCurrencyInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
}

//MARK: View -
protocol ConvertCurrencyViewProtocol: class {

    var presenter: ConvertCurrencyPresenterProtocol?  { get set }

    /* Presenter -> ViewController */
}
