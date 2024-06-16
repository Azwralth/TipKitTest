//
//  EnterPassword.swift
//  TipKitTest
//
//  Created by Владислав Соколов on 15.06.2024.
//

import TipKit

struct EnterPassword: Tip {
    var title: Text {
        Text("Your password")
    }
    
    var message: Text? {
        Text("Enter correct your password")
    }
    
    var image: Image? {
        Image(systemName: "lock.fill")
    }
    
    @Parameter
    static var hasViewedTip: Bool = false
    
    var rules: [Rule] {
        #Rule(Self.$hasViewedTip) { $0 == true }
    }
}
