//
//  ProfileSummary.swift
//  TODO
//
//  Created by 서종현 on 2022/12/26.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ProfileSummary: View {
    var image: Image
    var profile: Profile
    var imail = ""
    var psw = ""
    
    let email = Auth.auth().currentUser?.email ?? "User"
    
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
                    
                    Text(profile.mail)
                        .bold()
                    
                    Text(email)
                        .bold()
                }
                .padding([.horizontal])
            }
            Spacer()
        }
        .padding()
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(image: Image("ProfilePic"), profile: Profile.default)
    }
}
