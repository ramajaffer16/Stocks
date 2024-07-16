//
//  StocksViewModel.swift
//  Stocks
//
//  Created by Gracie on 16/07/2024.
//

import Foundation
import RxSwift


class StocksViewModel{
// Declaring the Service class
private let stocksService: StocksAPIService

//Declaring the publish subjects
//Input publishsubject from either trigger or a button that will trigger the fetch
let triggerfetch = PublishSubject<Void>()

//Output publishsubject that will emit the observable
let stocksAPIData = PublishSubject<Any>()

//Creating the initializer
init(stocksService: StocksAPIService = StocksAPIService()){
    self.stocksService = stocksService



triggerfetch.flatMapLatest {_ in
    StocksAPIService.fetchAPI()
    
}
    



