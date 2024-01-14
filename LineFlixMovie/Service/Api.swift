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

enum APIError: Error {
    case failedTogetData
}

class APICaller {
    static let shared = APICaller()

    
     
     func getTrendingMovies(completion: @escaping (Result<[Content], Error>) -> Void) {
         guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
         let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
             guard let data = data, error == nil else {
                 return
             }

             do {
                 let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                 completion(.success(results.results))
                 
             } catch {
                 completion(.failure(APIError.failedTogetData))
             }
         }
         
         task.resume()
     }
     
     
     func getTrendingTvs(completion: @escaping (Result<[Content], Error>) -> Void) {
         guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
         let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
             guard let data = data, error == nil else {
                 return
             }

             do {
                 let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                 completion(.success(results.results))
             }
             catch {
                 completion(.failure(APIError.failedTogetData))
             }
         }
         
         task.resume()
     }
     
     
     func getUpcomingMovies(completion: @escaping (Result<[Content], Error>) -> Void) {
         guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
         let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
             guard let data = data, error == nil else {
                 return
             }
             
             do {
                 let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                 completion(.success(results.results))
             } catch {
                 print(error.localizedDescription)
             }

         }
         task.resume()
     }
     
     func getPopular(completion: @escaping (Result<[Content], Error>) -> Void) {
         guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
         let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
             guard let data = data, error == nil else {
                 return
             }
             
             do {
                 let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                 completion(.success(results.results))
             } catch {
                 completion(.failure(APIError.failedTogetData))
             }
         }
         
         task.resume()
     }
     
     func getTopRated(completion: @escaping (Result<[Content], Error>) -> Void) {
         guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return }
         let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
             guard let data = data, error == nil else {
                 return
             }
             
             do {
                 let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                 completion(.success(results.results))

             } catch {
                 completion(.failure(APIError.failedTogetData))
             }

         }
         task.resume()
     }
    
    
}
 
