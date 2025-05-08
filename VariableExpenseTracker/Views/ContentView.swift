//
//  ContentView.swift
//  VariableExpenseTracker
//
//  Created by KBrewer on 7/12/23.
//
// TODO: Improve Look/more fun interface
// TODO: Have a total Budget amount
// TODO: Splash Screen

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    var categories = Expenses().categories
    /// Displays the current month (not abbreviated)
    let month = Text(Date.now, format: .dateTime.month(.wide))

    var body: some View {
        NavigationView {
            List {
                ExpenseSection(
                    title: "Food..Total Spent: \(expenses.totalSpent(in: categories[0]))",
                    expenses: expenses.foodExpenses,
                    deleteItems: expenses.removeFoodExpenses
                )
                ExpenseSection(
                    title: "Fun..Total Spent: \(expenses.totalSpent(in: categories[1]))",
                    expenses: expenses.funExpenses,
                    deleteItems: expenses.removeFunExpenses
                )
                ExpenseSection(
                    title: "House",
                    expenses: expenses.houseExpenses,
                    deleteItems: expenses.removeHouseExpenses
                )
                ExpenseSection(
                    title: "Personal",
                    expenses: expenses.personalExpenses,
                    deleteItems: expenses.removePersonalExpenses
                )
                ExpenseSection(
                    title: "Car",
                    expenses: expenses.carExpenses,
                    deleteItems: expenses.removeCarExpenses
                )
            }
            .navigationTitle(month)
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                        .foregroundStyle(.primary)
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            // they are both sharing the same object (expenses) to monitor for changes
            AddView(expenses: expenses)
        }
    }
}
