//
//  APIService.swift
//  FetchChallenge
//
//  Created by Carlos Neira on 8/17/24.
//

import Foundation

protocol APIServiceProtocol {
    func performDataRequest(for url: URL) async throws -> Data
}

enum NetworkError: Error {
    case badURL
}

class APIService {
    
    func performDataRequest(for url: URL) async throws -> Data {
        let request = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        return data
    }
}
