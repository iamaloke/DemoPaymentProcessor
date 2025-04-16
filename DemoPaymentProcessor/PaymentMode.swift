//
//  PaymentMode.swift
//  DemoPaymentProcessor
//
//  Created by Alok Kumar on 16/04/25.
//

enum PaymentMode: String, Identifiable, CaseIterable {
    case paypal
    case stripe
    case phonepe
    case googlepay
    case paytm
    case mock
    case none = "Select"
    
    var id: PaymentMode {
        self
    }
}
