//
//  MainViewController.swift
//  ForeignExchangeRates
//
//  Created Titipan Sakunwongsalee on 16/9/2562 BE.
//  Copyright © 2562 Titipan Sakunwongsalee. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class MainViewController: UIViewController, MainViewProtocol {

	var presenter: MainPresenterProtocol?

    @IBOutlet var navigationBar: UINavigationBar!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var btnConvert: UIButton!
    
    @IBOutlet var lbName: UILabel!
    @IBOutlet var lbBuyPrice: UILabel!
    @IBOutlet var lbSellPrice: UILabel!
    
    var listRate: [ExchangeRatesModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        navigationBar.topItem?.title = "Text_Main_Title".localized
        
        lbName.text = "Text_Currency".localized
        lbBuyPrice.text = "Text_Buying".localized
        lbSellPrice.text = "Text_Selling".localized
        
        tableView.register(UINib(nibName: ExchangeRateCell.nibName, bundle: nil), forCellReuseIdentifier: ExchangeRateCell.identifier)
        tableView.tableFooterView = UIView()
        
        presenter?.getExchangeRates()
    }
    
    func updateView() {
        setupView()
        tableView.reloadData()
    }
    
    func showListExchangeRates(model: [ExchangeRatesModel]) {
        listRate = model
    }
    
    @IBAction func clickBtnConvert(_ sender: Any) {
        presenter?.showConvertView()
    }
    
    @IBAction func clickChangeLanguage(_ sender: UIButton) {
        if GBM.shared.getLanguage() == .en {
            sender.setImage(UIImage(named: "icon_th"), for: .normal)
            GBM.shared.setLanguage(language: .th)
        } else {
            sender.setImage(UIImage(named: "icon_us"), for: .normal)
            GBM.shared.setLanguage(language: .en)
        }
        updateView()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listRate.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExchangeRateCell.identifier) as! ExchangeRateCell
        cell.setupCell(model: listRate[indexPath.row])
        
        return cell
    }
}
