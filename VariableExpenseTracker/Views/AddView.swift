//
//  AddView.swift
//  VariableExpenseTracker
//
//  Created by KBrewer on 7/12/23.
//

import SwiftUI

struct AddView: View {
    // we aren't creating it, we're saying it exists
    var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    /// Variables we are temporarily storing the user entered data into, then placing it into a new ExpenseItem on save
    @State private var name = ""
    @State private var category = "Food"
    @State private var amount: Double = 0

    var body: some View {
        NavigationView {
                Form {
                    TextField("Name", text: $name)

                    Picker("Category", selection: $category) {
                        ForEach(expenses.categories, id: \.self) {
                            Text($0)
                        }
                    }

                    TextField("Amount", value: $amount, format: .localCurrency)
                        .keyboardType(.decimalPad)
            }

            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, category: category, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}
