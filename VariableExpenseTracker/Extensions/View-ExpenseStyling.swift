//
//  View-ExpenseStyling.swift
//  VariableExpenseTracker
//
//  Created by KBrewer on 7/12/23.
//

import SwiftUI

extension View {
    func style(for item: ExpenseItem) -> some View {
        if item.category == "Fun" {
            return self.foregroundStyle(Color(.orange))
        } else if item.category == "Food" {
            return self.foregroundStyle(Color(.systemMint))
        } else if item.category == "House" {
            return self.foregroundStyle(Color(.systemIndigo))
        } else if item.category == "Personal" {
            return self.foregroundStyle(Color(.systemTeal))
        } else if item.category == "Car" {
            return self.foregroundStyle(Color(.systemPink))
        } else {
            return self.foregroundStyle(Color(.black))
        }
    }
}
