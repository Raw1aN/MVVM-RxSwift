//
//  MainViewModel.swift
//  RxSwiftTest
//
//  Created by Алексей Щукин on 14.03.2023.
//

import Foundation
import RxSwift
import RxCocoa

class MainViewModel{
    let apiManager = ApiManager()
    var quote: BehaviorRelay<[Quote]> = BehaviorRelay(value: [])
    init(){
        apiManager.getData { result in
            switch result{
            case .success(let data):
                self.quote.accept(self.quote.value + data)
            case .failure(let error):
                print(error)
            }
        }
    }
    func makeNewQuotes(completionHandler: @escaping () -> Void){
        apiManager.getData { result in
            switch result{
            case .success(let data):
                self.quote.accept(data)
                completionHandler()
            case .failure(let error):
                print(error)
            }
        }
    }
}
