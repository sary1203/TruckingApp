//
//  RatesView.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/10/22.
//

import SwiftUI

struct RatesView: View {
    
    @State var isActive : Bool = false
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var isLoading = false
    
    @ObservedObject var viewModel = RatesViewModel()
    
    var body: some View {
        ZStack {
            List(viewModel.cities, id:\.self) { city in
                NavigationLink(destination: SetLocationRateView(selectedCity: city)) {
                    Text(city.wrappedName)
                    /*HStack {
                        
                        Spacer()
                        Text("Php \(city.rate)")
                            .font(.callout)
                            .foregroundColor(.secondary)
                    }*/
                }
            }
            .navigationTitle("Coverage Area")
            .listStyle(InsetGroupedListStyle())
            .navigationBarItems(
                trailing:
                   NavigationLink (
                        destination: SelectCoverageView (
                            rootIsActive: self.$isActive
                        ),
                        isActive: self.$isActive
                   ) {
                Image(systemName: "plus.circle")
                     .resizable()
                     .frame(width: 24, height: 24)
                }
            )
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .onAppear(perform: loadSavedCoverage)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func loadSavedCoverage() {
        viewModel.loadSavedCoverage(viewContext: viewContext)
    }
}

struct RatesView_Previews: PreviewProvider {
    static var previews: some View {
        RatesView()
    }
}
