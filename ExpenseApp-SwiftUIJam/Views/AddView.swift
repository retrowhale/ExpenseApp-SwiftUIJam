//
//  AddView.swift
//  ExpenseApp-SwiftUIJam
//
//  Created by Deniz Donmezer on 2021-11-05.
//

import SwiftUI

struct AddView: View {
    
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel: AppViewModel
    
    var pickerOptions = ["Expense", "Income"]
    @State private var textFieldText: String = ""
    @State private var amountText: Double = 0.0
    @State private var pickerSelection: String = "Expense"
    
    var body: some View {
        VStack {
            //Headline
            Text("Add Transaction 💰")
                .font(.title)
                .padding()
            
            
            //Picker Stack
            HStack {
                Text("Select Transaction Type: ")
                    .padding()
                Picker (
                    selection: $pickerSelection,
                    label: Text("")
                    ,
                    content: {
                        ForEach(pickerOptions, id: \.self) { option in
                            Text(option)
                                .tag(option)
                        }
                    })
                
                
                
            }.padding(.horizontal)
                .border(Color.gray, width: 5)
                .cornerRadius(10)
                .padding()
            
            // Transaction Desc
            TextField("", text: $textFieldText)
                .placeholder(when: textFieldText.isEmpty) {
                    Text("Transaction Description").foregroundColor(.black)
                }
                .padding()
                .frame(height: 55)
                .background(Color.gray)
                .cornerRadius(10)
                .padding(.horizontal)
                .padding()
            
            // Number Input
            TextField("", value: $amountText, formatter:
                        currencyFormatter)
            .placeholder(when: textFieldText.isEmpty) {
                Text("")
            }
                         
            .padding()
            .keyboardType(.decimalPad)
            .frame(height: 55)
            .background(Color.gray)
            .cornerRadius(10)
            .padding(.horizontal)
            .padding()
            // Add Button
            
            Button(action: {
                
                viewModel.transactions.append(Transaction(type: pickerSelection, description: textFieldText, amount: amountText))
                
                dismiss()
                
            }, label: {
                Text("Add")
                
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(8)
            })
        }
    }
    
    // for number input so there can be only numbers on textfield
    private var currencyFormatter: NumberFormatter = {
        let f = NumberFormatter()
        f.isLenient = true
        f.numberStyle = .currency
        return f
    }()
    
    //for canvas error
    init(viewModel: AppViewModel) {
        self._viewModel = ObservedObject(initialValue: viewModel)
    }
    
}



struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView(viewModel: AppViewModel())
        }
        .previewInterfaceOrientation(.portrait)
    }
}


//To show different color on placeholder
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}


