//
//  MealsViewModelTests.swift
//  FetchChallengeTests
//
//  Created by Carlos Neira on 8/20/24.
//

import XCTest
@testable import FetchChallenge

final class MealsViewModelTests: XCTestCase {
    
    var sut: MealsViewModel!
    var mockMealsService: MockMealService!

    override func setUp() {
        super.setUp()
        
        mockMealsService = MockMealService()
    }
    
    override func tearDown() {
        sut = nil
        mockMealsService = nil
        super.tearDown()
    }
    
    private func givenFetchMealsSuccessResponse(with meals: Meals) {
        mockMealsService.requestSuccess = true
        mockMealsService.requestMeals = meals
        
        sut = MealsViewModel(mealService: mockMealsService)
    }
    
    private func givenFetchMealsFailureResponse() {
        mockMealsService.requestSuccess = false
        
        sut = MealsViewModel(mealService: mockMealsService)
    }
    
    private func givenFetchMealDetailsSuccessResponse(with mealDetails: MealDetails) {
        mockMealsService.requestSuccess = true
        mockMealsService.requestMealDetails = mealDetails
        
        sut = MealsViewModel(mealService: mockMealsService)
    }
    
    private func givenFetchMealDetailsFailureResponse() {
        mockMealsService.requestSuccess = false
        
        sut = MealsViewModel(mealService: mockMealsService)
    }

    func test_fetchDessert_setsMealsCorrectly() async {
        let mealsData = mockMeals()
        
        givenFetchMealsSuccessResponse(with: mealsData)
        
        await sut.fetchMeals(for: .dessert)
        
        XCTAssertEqual(mealsData.meals, sut.meals.meals)
    }
    
    func test_fetchDessert_throwsError() async {
        givenFetchMealsFailureResponse()
        
        await sut.fetchMeals(for: .dessert)
        
        XCTAssertEqual(sut.error as! NetworkError, NetworkError.apiError)
    }
    
    func test_fetchMealDetails_setsMealDetailsCorrectly() async {
        let mockData = mockMealDetails()
        
        givenFetchMealDetailsSuccessResponse(with: mockData)
        
        await sut.fetchMealDetails(for: "1234")
        
        XCTAssertEqual(sut.getCurrentMealDetails().meals, mockData.meals)
    }
    
    func test_fetchMealDetails_throwsError() async {
        givenFetchMealDetailsFailureResponse()
        
        await sut.fetchMealDetails(for: "1234")
        
        XCTAssertEqual(sut.error as! NetworkError, NetworkError.apiError)
    }
}
