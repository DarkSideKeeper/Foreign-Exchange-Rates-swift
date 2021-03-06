//
//  MainRouter.swift
//  ForeignExchangeRates
//
//  Created Titipan Sakunwongsalee on 16/9/2562 BE.
//  Copyright © 2562 Titipan Sakunwongsalee. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class MainRouter: MainWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = MainViewController(nibName: nil, bundle: nil)
        let interactor = MainInteractor()
        let router = MainRouter()
        let presenter = MainPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
    
    func goToConvertView(model: [ExchangeRatesModel]) {
        let vc = ConvertCurrencyRouter.createModule(model: model)
        let nav = UINavigationController(rootViewController: vc)
        nav.isNavigationBarHidden = true
        nav.modalPresentationStyle = .overFullScreen
        viewController?.present(nav, animated: true, completion: nil)
    }
}
