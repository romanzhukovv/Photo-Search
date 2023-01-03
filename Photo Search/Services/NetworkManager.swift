//
//  NetworkManager.swift
//  Photo Search
//
//  Created by Roman Zhukov on 02.01.2023.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

protocol NetworkManagerProtocol {
    func fetchData(completion: @escaping(Result<[Photo], NetworkError>) -> Void)
    func searchPhotos(query: String, completion: @escaping(Result<SearchedPhotos, NetworkError>) -> Void)
}

final class NetworkManager: NetworkManagerProtocol {
    
    static let shared = NetworkManager()
    
    private let baseURl = "https://api.unsplash.com/"
    private let photoCount = 30
    private let pageCount = 1
    private let apiKey = "j0jvFBCxGG342dl2oyuw497E6Eh7eMvCOQz8gu-U5Ow"
    
    private init() {}
    
    func fetchData(completion: @escaping(Result<[Photo], NetworkError>) -> Void) {
        let endPoint = baseURl + "photos/random?" + "&count=" + String(photoCount) + "&client_id=" + apiKey
        guard let url = URL(string: endPoint) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                completion(.failure(.noData))
                return
            }
            do {
                let images = try JSONDecoder().decode([Photo].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(images))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func searchPhotos(query: String, completion: @escaping(Result<SearchedPhotos, NetworkError>) -> Void) {
        let endPoint = baseURl + "search/photos" + "?page=" + String(pageCount) + "&query=" + query + "&client_id=" + apiKey
        guard let url = URL(string: endPoint) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                completion(.failure(.noData))
                return
            }
            do {
                let images = try JSONDecoder().decode(SearchedPhotos.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(images))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
