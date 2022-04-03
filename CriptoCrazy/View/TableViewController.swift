//
//  TableViewController.swift
//  CriptoCrazy
//
//  Created by İSMAİL AÇIKYÜREK on 3.04.2022.
//

import UIKit

class TableViewController: UITableViewController  {
    
    private var cryptoListViewModel : CryptoListViewModel!
            var colorArray = [UIColor]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.colorArray = [
            UIColor(red: 20/255, green: 10/255, blue: 170/255, alpha: 1.0),
            UIColor(red: 110/255, green: 240/255, blue: 220/255, alpha: 1.0),
            UIColor(red: 130/255, green: 156/255, blue: 40/255, alpha: 1.0),
            UIColor(red: 150/255, green: 173/255, blue: 213/255, alpha: 1.0),
            UIColor(red: 220/255, green: 184/255, blue: 170/255, alpha: 1.0),
            UIColor(red: 20/255, green: 20/255, blue: 10/255, alpha: 1.0),
            
        
        
        ]
        
        
    
       getData()
    }
    
    func getData () {
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        
        Webservice().downloadCurrencies(url: url) { (cryptos) in
            if let cryptos = cryptos {
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
    }

   

 

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSecntion()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell" ,for: indexPath) as! CryptoTableViewCell
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(index: indexPath.row)
        cell.priceText.text = cryptoViewModel.price
        cell.currencyText.text = cryptoViewModel.name
        cell.backgroundColor = self.colorArray[indexPath.row % 5]
       
        return cell
    }

   
}
