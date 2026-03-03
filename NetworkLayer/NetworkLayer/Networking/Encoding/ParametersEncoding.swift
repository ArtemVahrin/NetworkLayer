//
//  ParametersEncoding.swift
//  NetworkLayer
//
//  Created by Артём on 03.03.2026.
//

import Foundation

public typealias Parameters = [String: Any]

public protocol ParameterEncoding {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

