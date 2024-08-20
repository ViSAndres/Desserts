//
//  APIService.swift
//  FetchChallenge
//
//  Created by Carlos Neira on 8/17/24.
//

import Foundation

enum NetworkError: Error {
    case apiError
    case invalidResponse
}

class APIService {
    
    func performDataRequest(for url: URL) async throws -> Data {
        let request = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else { throw NetworkError.invalidResponse }
        
        if httpResponse.statusCode != 200 { 
            throw NetworkError.apiError }
        
        
        return data
    }
}
