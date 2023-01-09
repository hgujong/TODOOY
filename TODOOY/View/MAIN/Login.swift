//
//  Login.swift
//  TODOOY
//
//  Created by 서종현 on 2022/12/27.
//

import SwiftUI
import Firebase

struct Login: View {
    var content: Content = Content(isLoggedIn: .constant(false))
    @Binding var isLoggedIn: Bool
    @State private var email = ""
    @State private var password = ""
    @State private var showPopup = false

    var body: some View {
        ZStack {
            Color.black
            
//design
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.black, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
            
            VStack(spacing: 20) {
                Text("TODOY")
                    .foregroundColor(.white)
                    .font(.system(size:40, weight: .bold))
                    .offset(x: -100, y: -100)

//email 입력 textfield
                TextField("이메일", text: $email)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty) {
                        Text("이메일")
                            .foregroundColor(.white)
                            .bold()
                    }
                    .autocapitalization(.none)
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
//password 입력 textfield
                SecureField("비밀번호", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty) {
                        Text("비밀번호")
                            .foregroundColor(.white)
                            .bold()
                    }
                    .autocapitalization(.none)
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                

// 로그인 버튼
                Button {
                    login()
                } label: {
                    Text("로그인")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [.white, .white], startPoint: .top, endPoint: .bottom))
                        )
                        .foregroundColor(.black)
                }
                .padding(.top)
                .offset(y: 100)
                


//Sign in
                Button {
                    showPopup.toggle()
                } label: {
                    Text("회원가입")
                        .foregroundColor(.white)
                        .underline()
                        .bold()
                }
                .sheet(isPresented: $showPopup){
                    Signin(isLoggedIn: .constant(false))
                }
                .padding(.top)
                .offset(y: 110)


            }
            .frame(width: 350)
            .onAppear {
                Auth.auth().addStateDidChangeListener { auth, user in
                    if user != nil {
                        isLoggedIn.toggle()
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
    
    
// Login 함수
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) {result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
            else {
                print("login button works")
                isLoggedIn = true
                
            }
        }
        
    }
    
//    func register() {
//        Auth.auth().createUser(withEmail: email, password: password) {result, error in
//            if error != nil {
//                print(error!.localizedDescription)
//            }
//        }
//    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login( isLoggedIn: .constant(false))
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

