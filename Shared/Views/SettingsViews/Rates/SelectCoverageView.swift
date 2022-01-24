//
//  SelectCoverageView.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/11/22.
//

import SwiftUI
import SwiftyJSON
import CoreData

struct SelectCoverageView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var isLoading = false
    
    @ObservedObject var viewModel = SelectCoverageViewModel()
    
    @Binding var rootIsActive : Bool
    
    var body: some View {
        ZStack {
            List(viewModel.provinces, id: \.self) { province in
                NavigationLink(destination: CitiesView(regionString: province.region, provinceString: province.province, shouldPopToRootView: self.$rootIsActive)){
                    Text(province.province)
                }
            }
            .navigationTitle("Select Province")
            .listStyle(InsetGroupedListStyle())
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .onAppear(perform: loadProvinces)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func loadProvinces() {
        viewModel.loadProvinces(viewContext: viewContext)
    }
}
