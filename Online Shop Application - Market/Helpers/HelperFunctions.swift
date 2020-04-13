//
//  HelperFunctions.swift
//  Online Shop Application - Market
//
//  Created by Erdem Özgür on 13.04.2020.
//  Copyright © 2020 Erdem Özgür. All rights reserved.
//

import Foundation
//V35

func convertToCurrency(_ number: Double) -> String {
    
    let currencyFormatter = NumberFormatter()
    currencyFormatter.usesGroupingSeparator = true
    currencyFormatter.numberStyle = .currency
    currencyFormatter.locale = Locale.current
    
    let priceString = currencyFormatter.string(from: NSNumber(value: number))!
    return priceString
    
}
