//
//  ContentView.swift
//  SwiftUI-MVVM
//
//  Created by Bhuiyan Wasif on 10/25/23.
//
//

import SwiftUI

struct ForecastListView : View {
    
    @ObservedObject var viewModel: ForecastViewModel

    var body: some View {
        NavigationView {
            LoadingView(isShowing: $viewModel.isLoading) {
                List {
                    ForEach(self.viewModel.forecast) { forecast in
                        Section(header: Text(forecast.weekDay)
                                    .fontWeight(.bold)
                                    .padding()
                                    .background(
                                        LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .leading, endPoint: .trailing)
                                    )
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                                    .padding(.vertical, 5)
                        ) {
                            ForEach(forecast.forecast) { item in
                                ForecastListRow(forecast: item)
                                    .animation(.easeIn(duration: 0.3))
                            }
                        }
                    }
                }
                .padding(EdgeInsets(top: 10, leading: -10, bottom: 10, trailing: 10))
                .alert(isPresented: self.$viewModel.isErrorShown, content: {
                    Alert(
                        title: Text("Error"),
                        message: Text(self.viewModel.errorMessage)
                    )
                    
                })
            }
            .navigationBarTitle(Text(viewModel.forecast.first?.name ?? ""))
            .transition(.opacity)

        }
        .onAppear {
            withAnimation(.spring()) {
            }
        }
    }
}

#if DEBUG
struct RepositoryListView_Previews : PreviewProvider {
    static var previews: some View {
        ForecastListView(viewModel: .init())
    }
}
#endif
