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
        let correctMeals = mockMeals()
        
        givenApiSuccessResponse(with: mockMealsData())
        
        let meals = try await sut.fetchMeals(for: .dessert)
        XCTAssertEqual(correctMeals.meals[0].idMeal, meals.meals[0].idMeal)
    }
    
    func test_fetchMeals_invalidUrl() async throws {
        givenApiFailureResponse()
        
        var failError: NetworkError?
        
        do {
            _ = try await sut.fetchMeals(for: .dessert)
        } catch {
            failError = error as! NetworkError
        }
        
        XCTAssertNotNil(failError)
    }
    
    func test_fetchMeals_givenMalFormedData() async throws {
        givenMalformedResponse()
        
        var failError: Error?
        
        do {
            _ = try await sut.fetchMeals(for: .dessert)
        } catch {
            failError = error
        }
        
        XCTAssertNotNil(failError)
    }
    
    func test_fetchMealDetails_SuccessfulFetch() async throws {
        let correctMealDetails = mockMealDetails()
        
        givenApiSuccessResponse(with: mockMealDetailData())
        
        let mealDetails = try await sut.fetchMealDetails(for: "53049")
        XCTAssertEqual(correctMealDetails.meals[0].strMeal, mealDetails.meals[0].strMeal)
    }
    
    func test_fetchMeaDetails_invalidUrl() async throws {
        givenApiFailureResponse()
        
        var failError: NetworkError?
        
        do {
            _ = try await sut.fetchMealDetails(for: "53049")
        } catch {
            failError = error as! NetworkError
        }
        
        XCTAssertNotNil(failError)
    }
    
    func test_fetchMealDetails_givenMalFormedData() async throws {
        givenMalformedResponse()
        
        var failError: Error?
        
        do {
            _ = try await sut.fetchMealDetails(for: "53049")
        } catch {
            failError = error
        }
        
        XCTAssertNotNil(failError)
    }
}
