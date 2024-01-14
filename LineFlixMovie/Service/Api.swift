//
//  API.swift
//  LineFlixMovie
//
//  Created by ReviseUC73 on 14/1/2567 BE.


import Foundation

struct Constants {
    static let API_KEY = "697d439ac993538da4e3e60b54e762cd"
    static let baseURL = "https://api.themoviedb.org"
}

class APICaller {
    static let shared = APICaller()

    func getTrendingMovies(completion: @escaping (String) -> Void) {
           guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else {return}
        
           let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _ , error in
               guard let data = data, error == nil else {
                   return
               }

               do {
//                   let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
//                   completion(.success(results.results))
                   let result = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                   print(result)
               } catch {
                   print(error.localizedDescription)
//                   completion(.failure(error))
               }
           }

           task.resume()
       }
        
}
 
