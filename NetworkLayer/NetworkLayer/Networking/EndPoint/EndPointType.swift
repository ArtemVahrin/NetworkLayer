//
//  EndPointType protocol.swift
//  NetworkLayer
//
//  Created by Артём on 03.03.2026.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
