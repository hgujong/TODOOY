//
//  ProfileSummary.swift
//  TODO
//
//  Created by 서종현 on 2022/12/26.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

struct ProfileSummary: View {
    @Binding var isLoggedIn: Bool
    var image: Image
    var profile: Profile
    
    let email = Auth.auth().currentUser?.email ?? "UserEmail.com"
    let uid = Auth.auth().currentUser?.uid ?? "UID"
    let firebaseAuth = Auth.auth()
    
    
    
    var body: some View {
        VStack {
            image
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .padding(.bottom)
            
            Divider()
            
            HStack {
                VStack(alignment: .leading) {
                    Text("User Name: ")
                        .bold()
                    
                    Text("User Email: ")
                        .bold()
                }
                .padding([.horizontal])
                
                VStack(alignment: .leading) {
                    
                    Text(uid)
                        .bold()
                    
                    Text(email)
                        .bold()
                }
                .padding([.horizontal])
            }
            Button {
                do {
                    try firebaseAuth.signOut()
                    print("signout works")
                    isLoggedIn = false
                } catch let signOurError as NSError {
                    print("ERROR: signout \(signOurError.localizedDescription)")
                }
            } label: {
                Text("로그아웃")
                    .foregroundColor(.red)
                    .bold()
            }
            .padding()
            Spacer()
        }
        .padding()
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(isLoggedIn: .constant(false), image: Image("ProfilePic"), profile: Profile.default)
    }
}
