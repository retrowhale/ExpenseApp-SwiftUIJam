//
//  Transactions.swift
//  ExpenseApp-SwiftUIJam
//
//  Created by Deniz Donmezer on 2021-11-07.
//

import SwiftUI


struct Transaction : Identifiable {
    
    var id = UUID()
    var type: String
    var description: String
    var amount: Double
    var income: [Double]?
    var expense: [Double]?
    
}

struct TransactionRow: View {
    var transactions: Transaction
    
    var body: some View {
        
        HStack {
            Text(transactions.description)
            Text(transactions.type)
            Text("\(transactions.amount)")
        }
    }
}



class AppViewModel: ObservableObject {

    @Published var transactions = [Transaction](){
        didSet{
            print(transactions)
        }
    }
}


