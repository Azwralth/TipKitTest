//
//  EnterUsername.swift
//  TipKitTest
//
//  Created by Владислав Соколов on 15.06.2024.
//

import Foundation
import TipKit

struct EnterUsername: Tip {
    var title: Text {
        Text("Your username")
    }
    
    var message: Text? {
        Text("Enter correct your username")
    }
    
    var image: Image? {
        Image(systemName: "person.fill.checkmark")
    }
    
    @Parameter
    static var hasViewedTip: Bool = false
    
    var rules: [Rule] {
        #Rule(Self.$hasViewedTip) { $0 == true }
    }
}
