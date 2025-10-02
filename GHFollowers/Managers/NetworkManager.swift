//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Tarun Sharma on 19/09/25.
//

import UIKit

class NetworkManager {
    static let shared   = NetworkManager()
    let baseURL         = "https://api.github.com/users/"
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        //check if the url is invalid
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            // check if any error received
            if let _ = error {
                completed(.failure( .unableToComplete))
            }
            
            // first check if response is nil, if its not null then check if its status code == 200 (success)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            // check if data is nil
            guard let data else {
                completed(.failure( .invalidData))
                return
            }
            
//            if let jsonString = String(data: data, encoding: .utf8) {
//                print("JSON Response: \(jsonString)")
//            }

            
            do {
                let decoder = JSONDecoder() // creating json decoder
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data) // decode data and collect follower data
                completed(.success(followers))
            } catch {
                completed(.failure( .invalidData))
            }
            
        }
        
        task.resume() // starts the network call
    }
    
    
    func getUserInfo(for username: String, completed: @escaping (Result<User, GFError>) -> Void) {
        let endpoint = baseURL + "\(username)"
        
        //check if the url is invalid
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            // check if any error received
            if let _ = error {
                completed(.failure( .unableToComplete))
            }
            
            // first check if response is nil, if its not null then check if its status code == 200 (success)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            // check if data is nil
            guard let data else {
                completed(.failure( .invalidData))
                return
            }
            
//            if let jsonString = String(data: data, encoding: .utf8) {
//                print("JSON Response: \(jsonString)")
//            }

            
            do {
                let decoder = JSONDecoder() // creating json decoder
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let user = try decoder.decode(User.self, from: data) // decode data and collect follower data
                completed(.success(user))
                print(user)
            } catch {
                completed(.failure( .invalidData))
            }
            
        }
        
        task.resume() // starts the network call
    }
}
