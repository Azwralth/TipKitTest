//
//  TipKitTestApp.swift
//  TipKitTest
//
//  Created by Владислав Соколов on 14.06.2024.
//

import SwiftUI
import TipKit

@main
struct TipKitTestApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .task {
                    try? Tips.resetDatastore()
                    
                    try? Tips.configure([
                        .displayFrequency(.immediate),
                        .datastoreLocation(.applicationDefault)
                    ])
                }
        }
    }
}
