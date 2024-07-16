//
//  PolygonAPI.swift
//  Stocks
//
//  Created by Gracie on 11/07/2024.
//

import Foundation
import RxSwift

func fetchAPI()-> Observable<[stocks]>{
    return Observable.create{observer in
        let url = URL(string: "https://api.polygon.io/v2/aggs/grouped/locale/us/market/stocks/2023-01-09?adjusted=true&apiKey=UZYZdeEnGVL8FnOr_ql75hXgSGCwWp4k")
        
        let task = URLSession.shared.dataTask(with: url!){data,response,error in
            
            if let error = error{
                observer.onError(error)
                return
            }
            
            guard let data = data else {
                observer.onError(NSError(domain: "No valid data", code: 0, userInfo: nil))
                return
            }
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode)else{
                observer.onError(NSError(domain: "Invalid response", code: 0, userInfo: nil))
                return
            }
            
            do {
                let decodeddata = try JSONDecoder().decode(stocksresponse.self, from: data)
                
                let modeldata = decodeddata.results.map { results -> stocks in
                    return stocks(open: results.o,
                                  close: results.c,
                                  high: results.h,
                                  low: results.l,
                                  item: results.T)
                }
                observer.onNext(modeldata)
                observer.onCompleted()
            }catch {
                observer.onError(error)
                return
            }.
        }
        task.resume()
        
        return Disposables.create {
            task.cancel()
        }
        
        }
    }

