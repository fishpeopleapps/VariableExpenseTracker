//
//  ContentView.swift
//  VariableExpenseTracker
//
//  Created by KBrewer on 7/12/23.
//
// TODO: I want to add totals to the section title, so it displays the total of each section
// TODO: Can we use the new SwiftData for this?
// TODO: Improve Look/more fun interface
// TODO: Have a total Budget amount
// TODO: Splash Screen

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    /// Displays the current month (not abbreviated)
    let month = Text(Date.now, format: .dateTime.month(.wide))

    var body: some View {
        NavigationView {
            List {
                ExpenseSection(
                    title: "Food",
                    expenses: expenses.foodExpenses,
                    deleteItems: expenses.removeFoodExpenses
                )
                ExpenseSection(
                    title: "Fun",
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
