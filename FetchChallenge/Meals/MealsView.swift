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
            HeaderView()
            
            BodyView()
        }
        .task {
            await viewModel.fetchDessert()
        }
    }
    
    // MARK: Sub views
    @ViewBuilder
    func BodyView() -> some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(viewModel.meals.meals, id: \.self) { meal in
                    MealCellView(meal)
                }
            }
        }
        .navigationDestination(isPresented: $shouldNavigate) {
            MealDetailView(meal: viewModel.getCurrentMealDetails().meals[0])
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
        VStack(spacing: 0) {
            Button {
                Task.init {
                    await viewModel.fetchMealDetails(for: meal.idMeal)
                    shouldNavigate.toggle()
                }
            } label: {
                HStack {
                    AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                        image.resizable()
                    } placeholder: {
                        Image(systemName: "carrot")
                    }
                    .frame(width: 75, height: 75)
                    
                    Text(meal.strMeal)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
            
            Divider()
        }
    }
}



#Preview {
    MealsView(viewModel: MockMealsViewModel())
}
