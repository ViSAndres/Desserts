//
//  MockAPIService.swift
//  FetchChallenge
//
//  Created by Carlos Neira on 8/20/24.
//

import Foundation

class MockAPIService: APIService {
    var requestResponseData = Data()
    var requestSuccess: Bool = true
    var reqquestError: NetworkError = NetworkError.apiError
    var requestURL: URL!
    
    override func performDataRequest(for url: URL) async throws -> Data {
        requestURL = url
        
        if requestSuccess {
            return requestResponseData
        }
        
        throw reqquestError
    }
    
}
