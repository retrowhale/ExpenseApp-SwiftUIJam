//
//  ContentView.swift
//  ExpenseApp-SwiftUIJam
//
//  Created by Deniz Donmezer on 2021-11-05.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var balance = 1
    @State private var income = 2000
    @State private var expense = 200
    
    @State var showingSheet = false
    
//    @State var storage: [Transaction] = []

    @State var transactions: Transaction

    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel = AppViewModel()
    
    
    
    var body: some View {
        VStack {
            
            Text("Expnse")
            
            HStack {
                VStack{
                    Text("Expense")
                        .padding()
                    Text("\(expense)")
                }.padding()
                VStack{
                    Text("Income")
                        .padding()
                    Text("\(income)")
                    
                }.padding()
                
                VStack{
                    Text("Balance")
                        .padding()
                    Text("\(balance)")
                }.padding()
            }
//            List(transactions) { transaction in
//                TransactionRow(transaction: transaction)
//
//            }
            
            
            
            .toolbar{
                ToolbarItem(placement: .bottomBar){
                    HStack {
                        Spacer()
                        Button(action: {
                            showingSheet.toggle()
                        }){
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 44, height: 44)
                                .foregroundColor(.pink)
                        }
                    }
                    .sheet(isPresented: $showingSheet, content: {
                        AddView( viewModel: AppViewModel())
                    })
                }
            }
        }
    }
}
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                ContentView(transactions: Transaction(type: "", description: "", amount: 0.0))
                    .previewLayout(.sizeThatFits)
            }
        }
    }
    //
    //struct TransactionRow: View {
    //
    //    var transaction : Transaction
    //
    //    @StateObject var viewModel = AppViewModel()
    //
    //    let viewTransactions = [
    //        Transaction(type: "Expense", description: "Golf", amount: 200.00)
    //    ]
    //
    //
    //    var body: some View {
    //
    //        List(viewTransactions){ transactions in
    //            Text(transactions.type)
    //            Text(transactions.description)
    //            Text("\(transactions.amount)")
    //        }
    //    }
    //}
    
