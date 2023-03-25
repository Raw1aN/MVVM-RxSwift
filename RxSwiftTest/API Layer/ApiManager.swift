//
//  ApiWork.swift
//  RxSwiftTest
//
//  Created by Алексей Щукин on 14.03.2023.
//

enum DataError: Error{
    case invalidData
    case invalidDeconding
    case invalidUrl
}

import Foundation

class ApiManager{
    
// MARK: - GET array of quotes
    func getData(handler: @escaping (Result<[Quote],DataError>) -> Void ){
        guard let url = URL(string: Constant.Api.quotes) else {
            handler(.failure(.invalidUrl))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                handler(.failure(.invalidData))
                return
            }
            do{
                let quotes = try JSONDecoder().decode([Quote].self, from: data)
                handler(.success(quotes))
            }
            catch{
                handler(.failure(.invalidDeconding))
            }
        }.resume()
    }
}
