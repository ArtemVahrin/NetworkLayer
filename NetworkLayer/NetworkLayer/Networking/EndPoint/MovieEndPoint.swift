//
//  MovieEndPoint.swift
//  NetworkLayer
//
//  Created by Артём on 05.03.2026.
//

import Foundation

enum NetworkEnvironment {
    case qa
    case production
    case staging
}

public enum MovieApi {
    case popular(page: Int)
    case recommended(id: Int)
    case newMovies(page: Int)
    case video(id: Int)
}


extension MovieApi: EndPointType {
    var environmentBaseURL: String {
        switch NetworkManager.environment {
        case .qa:
            "https://qa.themoviedb.org/3/movie/"
        case .production:
            "https://api.themoviedb.org/3/movie/"
        case .staging:
            "https://staging.themoviedb.org/3/movie/"
        }
    }
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.") }
        return url
    }
    
    var path: String {
        switch self {
        case .popular(let page):
            "popular/\(page)"
        case .recommended(let id):
            "\(id)/recommendations"
        case .newMovies(let page):
            "now_playing"
        case .video(let id):
            "\(id)/videos"
        }
    }
    
    var httpMethod: HTTPMethod {
        .get
    }
    
    var task: HTTPTask {
        switch self {
        case .newMovies(let page):
                return .requestParameters(bodyParameters: nil,
                                   urlParameters: ["page": page, "api_key": NetworkManager.movieApiKey]
                )
        default:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        nil
    }
    
    
}
