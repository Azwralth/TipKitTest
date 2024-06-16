//
//  SignIn.swift
//  TipKitTest
//
//  Created by Владислав Соколов on 15.06.2024.
//

import TipKit

struct SignIn: Tip {
    var title: Text {
        Text("Tap to Sign In")
    }
    
    var image: Image? {
        Image(systemName: "cursorarrow.click")
    }
    
    @Parameter
    static var hasViewedTip: Bool = false
    
    var rules: [Rule] {
        #Rule(Self.$hasViewedTip) { $0 == true }
    }
}
