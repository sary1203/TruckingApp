//
//  LoginView.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/3/22.
//

import SwiftUI
import AuthenticationServices
//import CloudKit

struct LoginView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var viewModel = UserViewModel()
    @AppStorage("login") private var login = false
    
    var body: some View {
        VStack {
            
            Image(uiImage: UIImage(named: "LaunchScreen")!)
                .resizable()
                .frame(width: UIScreen.screenWidth,        height: UIScreen.screenWidth)
                .foregroundColor(.cyan)
            
            Spacer()
            
            SignInWithAppleButton(
                onRequest: configure,
                onCompletion: handle
            )
            .frame(width: 280, height: 44)
            .padding()
            .signInWithAppleButtonStyle(.white)
            
        }.background(.black).ignoresSafeArea()
    }
    
    func configure (_ request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.fullName, .email]
    }
    
    func handle (_ result: Result<ASAuthorization, Error>) {
        viewModel.onAuthSuccess(result)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
