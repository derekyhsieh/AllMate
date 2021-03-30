//
//  UserViewModel.swift
//  AllMate
//
//  Created by Derek Hsieh on 3/26/21.
//

import SwiftUI
import Firebase

class UserData: Identifiable {
    var userEmail: String
    var userUID: String
    var userName: String
    
    init(userEmail: String, userUID: String, userName: String) {
        self.userEmail = userEmail
        self.userUID = userUID
        self.userName = userName
    }
}

class UserViewModel: ObservableObject {
    let db = Firestore.firestore()
    @Published var userData: UserData = UserData(userEmail: "", userUID: "", userName: "")
    @Published var classes: [String] = []
    
    func fetchUserData() {
        self.userData.userUID = Auth.auth().currentUser!.uid
        self.userData.userEmail = Auth.auth().currentUser!.email!
        self.userData.userEmail = Auth.auth().currentUser!.displayName!
        
        self.db.collection("users").getDocuments { (snapshot, error) in
            // error handling
            if let error = error {
                print(error.localizedDescription)
            } else {
                for document in snapshot!.documents {
                    self.classes = document.get("UserClasses") as! [String]
                    print(self.classes)
                    ClassDataModel().loadUserPickedClasses()
                }
            }
        }
    }
    
    //func readArray()
//    self.db.collection("places").getDocuments { (snapshot, err) in
//        if let err = err {
//            print("Error getting documents: \(err)")
//        } else {
//            for document in snapshot!.documents {
//               let docId = document.documentID
//               let latMax = document.get("latMax") as! String
//               let latMin = document.get("latMin") as! String
//               let lonMax = document.get("lonMax") as! String
//               let lonMin = document.get("lonMin") as! String
//               print(docId, latMax, latMin, lonMax, lonMin)
//            }
//        }
// }

}
