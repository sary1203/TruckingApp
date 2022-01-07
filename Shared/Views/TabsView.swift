//
//  TabView.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/7/22.
//

import SwiftUI

struct TabButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.9 : 1)
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
    }
}

struct TabsView: View {
    var body: some View {
        TabView {
            NavigationView {
                TripsView()
            }
            .tabItem {
                Label("Trips", systemImage: "car")
            }
            
            NavigationView {
                ReceivablesView()
            }
            .tabItem {
                Label("Receivables", systemImage: "dollarsign.circle")
            }
            
            Spacer()
            
            NavigationView {
                ReportsView()
            }
            .tabItem {
                Label("Reports", systemImage: "chart.pie")
            }
            
            NavigationView {
                SettingsView()
            }
            .tabItem {
                Label("Settings", systemImage: "gearshape")
            }
        }
        .overlay(
            Button {
                
            } label: {
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .shadow(radius: 3)
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 38, height: 38)
                }
                .offset(y: -10)
            }
            .buttonStyle(TabButtonStyle())
            ,alignment: .bottom
        )
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
