//
//  FormatStyle-LocalCurrency.swift
//  VariableExpenseTracker
//
//  Created by KBrewer on 7/12/23.
//

import Foundation

extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
    static var localCurrency: Self {
        .currency(code: Locale.current.currency?.identifier ?? "USD")
    }
}
