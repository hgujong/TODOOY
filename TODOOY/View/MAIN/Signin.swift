//
//  Signin.swift
//  TODOOY
//
//  Created by 서종현 on 2023/01/06.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

struct Signin: View {
    @Binding var isLoggedIn: Bool
    @State private var email = ""
    @State private var password = ""
    @State private var passwordCheck = ""
    @State private var userName = ""
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .foregroundStyle(.linearGradient(colors: [.blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing))

            VStack {
                Text("회원가입")
                    .foregroundColor(.white)
                    .bold()
                    .padding(.bottom)
                    .offset(y: -230)
                
                
                
                TextField("이메일", text: $email)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty) {
                        Text("이메일")
                            .foregroundColor(.accentColor)
                            .bold()
                    }
                    .autocapitalization(.none)
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.accentColor)
                
//password 입력 textfield
                SecureField("비밀번호", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty) {
                        Text("비밀번호")
                            .foregroundColor(.accentColor)
                            .bold()
                    }
                    .autocapitalization(.none)
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.accentColor)
                
// password check
                SecureField("비밀번호 확인", text: $passwordCheck)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: passwordCheck.isEmpty) {
                        Text("비밀번호 확인")
                            .foregroundColor(.accentColor)
                            .bold()
                    }
                    .autocapitalization(.none)
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.accentColor)
                
//이름 입력
                TextField("이름", text: $userName)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: userName.isEmpty) {
                        Text("이름")
                            .foregroundColor(.accentColor)
                            .bold()
                    }
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.accentColor)
                

                
                Button {
                    register()
                } label: {
                    Text("회원가입")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [.white, .white], startPoint: .top, endPoint: .bottom))
                        )
                }
                .padding(.top)
                .offset(y: 100)
            }
            .padding()
        }
        .ignoresSafeArea()
    }
    
    func register() {
        if(password == passwordCheck){
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if error != nil {
                    print(error!.localizedDescription)
                }
                else {
                    isLoggedIn = true
                    let uid = Auth.auth().currentUser?.uid ?? "UserID"
                    let db = Firestore.firestore()
                    let ref = db.collection("Users").document(uid)
                    ref.setData(["Email": email, "UserName": userName]) { error in
                        if let error = error {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
        } else {
            passwordCheck = ""
        }
        
    }
}

struct Signin_Previews: PreviewProvider {
    static var previews: some View {
        Signin(isLoggedIn: .constant(false))
    }
}

