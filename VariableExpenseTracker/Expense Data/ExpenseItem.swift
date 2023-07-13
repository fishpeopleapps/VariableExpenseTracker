//
//  ExpenseItem.swift
//  VariableExpenseTracker
//
//  Created by KBrewer on 7/12/23.
//

import Foundation

/// Represents a single expense that can be identified uniquely (Identifiable),
/// Encoded with a JSON encoder (Codable), and
/// Compared items to see if they are the same (to allow items to be deleted) (Equatable)
struct ExpenseItem: Codable, Identifiable, Equatable {
    /// Swift makes a new UUID for us each time
    var id = UUID()
    let name: String
    let category: String
    let amount: Double
}
