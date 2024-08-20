//
//  MealsServiceTests.swift
//  FetchChallengeTests
//
//  Created by Carlos Neira on 8/20/24.
//

import XCTest
@testable import FetchChallenge

final class MealServiceTests: XCTestCase {
    var sut: MealServiceProtocol!
    var mockApiService: MockAPIService!
    

    override func setUp() {
        mockApiService = MockAPIService()
    }
    
    override func tearDown() {
        sut = nil
        mockApiService = nil
        super.tearDown()
    }
    
    private func givenApiSuccessResponse(with responseData: Data) {
        mockApiService.requestSuccess = true
        mockApiService.requestResponseData = responseData
        
        sut = MealService(APIService: mockApiService)
    }
    
    private func givenApiFailureResponse() {
        mockApiService.requestSuccess = false
        
        sut = MealService(APIService: mockApiService)
    }
    
    private func givenMalformedResponse() {
        mockApiService.requestSuccess = true
        mockApiService.requestResponseData = Data("Malformed Data".utf8)
        
        sut = MealService(APIService: mockApiService)
    }

    func test_fetchMeals_SuccessfulFetch() async throws {
        var correctMeals = mockMeals()
        
        givenApiSuccessResponse(with: mockMealsData())
        
        var meals = try await sut.fetchMeals(for: .dessert)
        XCTAssertEqual(correctMeals.meals[0].idMeal, meals.meals[0].idMeal)
    }
    

}
