//
//  MainView.swift
//  TipKitTest
//
//  Created by Владислав Соколов on 14.06.2024.
//

import SwiftUI
import TipKit

struct MainView: View {
    @State private var usernameTextField = ""
    @State private var passwordTextField = ""
    @State private var isBlur = true
    @State private var currentHint: Hints = .loginTF
    @State private var isDisabled = true
    
    var body: some View {
        VStack {
            Text("Sign In")
                .font(.largeTitle)
                .bold()
                .blur(radius: isBlur ? 3 : 0)
            VStack {
                Group {
                    HStack {
                        Text("Username")
                            .foregroundStyle(.darkerGray)
                        Spacer()
                    }
                    TextField("Enter Your Username", text: $usernameTextField)
                    Divider()
                        .padding(.bottom, 20)
                }
                .popoverTip(EnterUsername(), arrowEdge: .top)
                .disabled(isDisabled)
                .blur(radius: currentHint == .loginTF ? 0 : 3)
                
                Group {
                    HStack {
                        Text("Password")
                            .foregroundStyle(.darkerGray)
                        Spacer()
                    }
                    TextField("Enter Your Password", text: $usernameTextField)
                    Divider()
                }
                .popoverTip(EnterPassword(), arrowEdge: .top)
                .disabled(isDisabled)
                .blur(radius: currentHint == .passwordTF ? 0 : 3)
                
                Group {
                    Button(action: {}) {
                        Text("Sign In")
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(.lightGreen)
                            .foregroundStyle(.white)
                            .clipShape(.capsule)
                    }
                    .padding(.top, 40)
                    .padding([.leading, .trailing], 30)
                    Text("(or)")
                        .padding(.top, 20)
                        .foregroundStyle(.gray)
                        .opacity(0.5)
                    HStack {
                        Text("Don't Have An Account?")
                            .foregroundStyle(.gray)
                            .opacity(0.5)
                        Button(action: {}) {
                            Text("Sign In")
                        }
                    }
                    .padding(.top, 20)
                }
                .popoverTip(SignIn(), arrowEdge: .bottom)
                .disabled(isDisabled)
                .blur(radius: currentHint == .signIn ? 0 : 3)
            }
            .padding()
        }
        .onAppear {
            EnterUsername.hasViewedTip = true
        }
        .onTapGesture {
            switch currentHint {
            case .loginTF:
                EnterPassword.hasViewedTip = true
                currentHint = .passwordTF
            case .passwordTF:
                EnterUsername.hasViewedTip = false
                SignIn.hasViewedTip = true
                currentHint = .signIn
            case .signIn:
                EnterPassword.hasViewedTip = false
                currentHint = .none
            case .none:
                currentHint = .loginTF
                isBlur = false
            }
        }
    }
}

enum Hints {
    case loginTF
    case passwordTF
    case signIn
    case none
}

#Preview {
    MainView()
}
