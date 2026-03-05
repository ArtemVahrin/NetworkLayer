//
//  JSONParametersEncoding.swift
//  NetworkLayer
//
//  Created by Артём on 05.03.2026.
//

import Foundation

public struct JSONParametersEncoder: ParameterEncoding {
    public static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            
            urlRequest.httpBody = jsonAsData
            
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        } catch {
            
        }
    }
}
