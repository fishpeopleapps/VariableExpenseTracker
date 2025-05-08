//
//  ExpenseSection.swift
//  VariableExpenseTracker
//
//  Created by KBrewer on 7/12/23.
//

import SwiftUI

struct ExpenseSection: View {
    let title: String
    let expenses: [ExpenseItem]
    let deleteItems: (IndexSet) -> Void
    var body: some View {
        Section(title) {
            // we do not need the parameter for id, because we are using the Identifiable protocol with UUID
            ForEach(expenses) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name).bold()
                            .font(.headline)
                            .style(for: item)
                        Text(item.category)
                    }
                    
                    Spacer()
                    Text(item.amount, format: .localCurrency)
                }
            }
            .onDelete(perform: deleteItems)
        }
    }
}
