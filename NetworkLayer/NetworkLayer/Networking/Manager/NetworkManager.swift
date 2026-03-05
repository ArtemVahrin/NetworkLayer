//
//  NetworkManager.swift
//  NetworkLayer
//
//  Created by Артём on 05.03.2026.
//

import Foundation

struct NetworkManager {
    static let environment: NetworkEnvironment = .production
    static let movieApiKey = ""
    private let router = Router<MovieApi>()
    
    enum NetworkResponse: String {
        case success
        case authenticationError = "You need to be authenticated first"
        case badRequest = "Bad Request"
        case outdated = "The URL you requested is outdated"
        case failed = "Network request failed"
        case noData = "Request returned with no data to decode"
        case unableToDecode = "Couldnt deocde the response"
    }

    enum Result<String> {
        case success
        case failure(String)
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299: .success
        case 401...500: .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: .failure(NetworkResponse.badRequest.rawValue)
        case 600: .failure(NetworkResponse.outdated.rawValue)
        default: .failure(NetworkResponse.failed.rawValue)
        }
    }
}


