//
//  ExpenseApp_SwiftUIJamApp.swift
//  ExpenseApp-SwiftUIJam
//
//  Created by Deniz Donmezer on 2021-11-05.
//

import SwiftUI

@main
struct ExpenseApp_SwiftUIJamApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(transactions: Transaction(type: "", description: "", amount: 0.0))
                
            }
        }
    }
}
