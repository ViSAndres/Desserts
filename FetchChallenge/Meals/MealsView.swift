//
//  MealsView.swift
//  FetchChallenge
//
//  Created by Carlos Neira on 8/17/24.
//

import SwiftUI

struct MealsView: View {
    @State var viewModel: MealsViewModelProtocol
    @State private var shouldNavigate: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HeaderView()
                
                BodyView()
            }
            .background(.lighterGray)
            .alert(isPresented: $viewModel.hasError, content: {
                Alert(title: Text("Error"),
                      message: Text("There has been a problem loading your data."),
                      dismissButton: .default(Text("OK")))
            })

        }
        .task {
            await viewModel.fetchMeals(for: .dessert)
        }
    }
    
    // MARK: Sub views
    @ViewBuilder
    func BodyView() -> some View {
        let columns = [GridItem(.flexible()), GridItem(.flexible())]
        
        ScrollView {
            
            LazyVGrid(columns: columns) {
                ForEach(viewModel.meals.meals, id: \.self) { meal in
                        MealCellView(meal)
                }
            }
        }
        .navigationDestination(isPresented: $shouldNavigate) {
            if let mealDetails = viewModel.getCurrentMealDetails() {
                MealDetailView(meal: mealDetails.meals[0])
            } else {
                ErrorView()
            }
        }
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        Text("Desserts")
            .font(.title)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .padding()
    }
        
    @ViewBuilder
    func MealCellView(_ meal: Meal) -> some View {
        Button {
            Task.init {
                await viewModel.fetchMealDetails(for: meal.idMeal)
                shouldNavigate.toggle()
            }
        } label: {
            VStack(spacing: 0) {
                AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                    image.resizable()
                } placeholder: {
                    Image(systemName: "carrot")
                }
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding(.bottom, 10)
                
                Text(meal.strMeal)
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(.black)
                    .padding(.horizontal, 5)
                
                Spacer()
            }
            .frame(width: 150, height: 200)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.lightGray, lineWidth: 0.8)
            )
            .background(.white)
        }
    }
}



#Preview {
    MealsView(viewModel: MockMealsViewModel())
}
