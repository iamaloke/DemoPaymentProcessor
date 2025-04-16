//
//  PaymentMode.swift
//  DemoPaymentProcessor
//
//  Created by Alok Kumar on 16/04/25.
//

enum PaymentMode: String, Identifiable, CaseIterable {
    case none = "Select"
    case paypal
    case stripe
    case phonepe
    case googlepay
    case paytm
    case mock
    
    var id: PaymentMode {
        self
    }
    
    static var modes: [PaymentMode] {
        allCases
    }
}
