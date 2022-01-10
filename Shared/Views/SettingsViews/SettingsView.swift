//
//  SettingsView.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/7/22.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        List {
            firstSection
            secondSection
            thirdSection
            fourthSection
            fifthSection
            sixthSection
        }
        .navigationBarTitle("Settings")
        .listStyle(InsetGroupedListStyle())
        .environment(\.horizontalSizeClass, .compact)
    }
    
    var firstSection: some View {
        Section {
            NavigationLink(destination: Text("Hello")) {
                HStack {
                    ZStack {
                        RoundedRectangle(
                            cornerRadius: 5,
                            style: .continuous
                        )
                            .fill(.blue)
                            .frame(width: 30, height: 30)
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                    }
                    VStack(alignment: .leading) {
                        Text("Randy Flores Jr")
                            .font(.body)
                            .padding(.top)
                        Text("floresrandyjr@gmail.com")
                            .font(.subheadline)
                            .padding(.bottom)
                    }
                }
            }
        }
    }
    
    var secondSection: some View {
        Section {
            NavigationLink(destination: ClientsView()) {
                HStack() {
                    ZStack {
                        RoundedRectangle(
                            cornerRadius: 5,
                            style: .continuous
                        )
                            .fill(.orange)
                            .frame(width: 30, height: 30)
                        Image(systemName: "person.crop.rectangle.stack")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                    }
                    Text("Clients")
                        .font(.callout)
                }
            }
            NavigationLink(destination: RatesView()) {
                HStack() {
                    ZStack {
                        RoundedRectangle(
                            cornerRadius: 5,
                            style: .continuous
                        )
                            .fill(.green)
                            .frame(width: 30, height: 30)
                        Image(systemName: "dollarsign.circle.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                    }
                    Text("Rates")
                        .font(.callout)
                }
            }
        }
    }
    
    var thirdSection: some View {
        Section {
            NavigationLink(destination: Text("Hello")) {
                HStack() {
                    ZStack {
                        RoundedRectangle(
                            cornerRadius: 5,
                            style: .continuous
                        )
                            .fill(.blue)
                            .frame(width: 30, height: 30)
                        Image(systemName: "fuelpump.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                    }
                    Text("Fuel History")
                        .font(.callout)
                }
            }
            NavigationLink(destination: Text("Hello")) {
                HStack() {
                    ZStack {
                        RoundedRectangle(
                            cornerRadius: 5,
                            style: .continuous
                        )
                            .fill(.red)
                            .frame(width: 30, height: 30)
                        Image(systemName: "fuelpump")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                    }
                    Text("Fuel Formula")
                        .font(.callout)
                }
            }
            NavigationLink(destination: VehiclesView()) {
                HStack() {
                    ZStack {
                        RoundedRectangle(
                            cornerRadius: 5,
                            style: .continuous
                        )
                            .fill(.orange)
                            .frame(width: 30, height: 30)
                        Image(systemName: "car.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                    }
                    Text("Vehicles")
                        .font(.callout)
                }
            }
            NavigationLink(destination: VehicleTypeView()) {
                HStack() {
                    ZStack {
                        RoundedRectangle(
                            cornerRadius: 5,
                            style: .continuous
                        )
                            .fill(.blue)
                            .frame(width: 30, height: 30)
                        Image(systemName: "bicycle")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                    }
                    Text("Vehicle Type")
                        .font(.callout)
                }
            }
        }
    }
    
    var fourthSection: some View {
        Section {
            NavigationLink(destination: EmployeesView()) {
                HStack() {
                    ZStack {
                        RoundedRectangle(
                            cornerRadius: 5,
                            style: .continuous
                        )
                            .fill(.orange)
                            .frame(width: 30, height: 30)
                        Image(systemName: "person.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                    }
                    Text("Employees")
                        .font(.callout)
                }
            }
            NavigationLink(destination: PositionsView()) {
                HStack() {
                    ZStack {
                        RoundedRectangle(
                            cornerRadius: 5,
                            style: .continuous
                        )
                            .fill(.blue)
                            .frame(width: 30, height: 30)
                        Image(systemName: "person.text.rectangle")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                    }
                    Text("Positions")
                        .font(.callout)
                }
            }
            NavigationLink(destination: Text("Hello")) {
                HStack() {
                    ZStack {
                        RoundedRectangle(
                            cornerRadius: 5,
                            style: .continuous
                        )
                            .fill(.green)
                            .frame(width: 30, height: 30)
                        Image(systemName: "dollarsign.square.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                    }
                    Text("Salary")
                        .font(.callout)
                }
            }
        }
    }
    
    var fifthSection: some View {
        Section {
            NavigationLink(destination: Text("Hello")) {
                HStack() {
                    ZStack {
                        RoundedRectangle(
                            cornerRadius: 5,
                            style: .continuous
                        )
                            .fill(.purple)
                            .frame(width: 30, height: 30)
                        Image(systemName: "newspaper.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                    }
                    Text("Trips History")
                        .font(.callout)
                }
            }
            NavigationLink(destination: Text("Hello")) {
                HStack() {
                    ZStack {
                        RoundedRectangle(
                            cornerRadius: 5,
                            style: .continuous
                        )
                            .fill(.red)
                            .frame(width: 30, height: 30)
                        Image(systemName: "chart.bar.xaxis")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                    }
                    Text("Reports")
                        .font(.callout)
                }
            }
        }
    }
    
    var sixthSection: some View {
        Section {
            NavigationLink(destination: Text("Hello")) {
                HStack() {
                    ZStack {
                        RoundedRectangle(
                            cornerRadius: 5,
                            style: .continuous
                        )
                            .fill(.gray)
                            .frame(width: 30, height: 30)
                        Image(systemName: "questionmark.diamond.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                    }
                    Text("FAQs")
                        .font(.callout)
                }
            }
            NavigationLink(destination: Text("Hello")) {
                HStack() {
                    ZStack {
                        RoundedRectangle(
                            cornerRadius: 5,
                            style: .continuous
                        )
                            .fill(.gray)
                            .frame(width: 30, height: 30)
                        Image(systemName: "exclamationmark.square.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                    }
                    Text("Help us Improve")
                        .font(.callout)
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
