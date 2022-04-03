//
//  cryptoViewModel.swift
//  CriptoCrazy
//
//  Created by İSMAİL AÇIKYÜREK on 3.04.2022.
//

import Foundation


struct CryptoListViewModel {
    
    let cryptoCurrencyList : [CryptoCurrency]
    func numberOfRowsInSecntion() -> Int {
        return self.cryptoCurrencyList.count
    }
    
    
    func cryptoAtIndex(index : Int ) -> CryptoViewModel {
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
    }
    
}


struct CryptoViewModel {
    let cryptoCurrency : CryptoCurrency
    
    var name  : String {
        return cryptoCurrency.currency
    }
    
    var price : String {
        return cryptoCurrency.price
    }
}



