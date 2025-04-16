//
//  PaymentViewModel.swift
//  DemoPaymentProcessor
//
//  Created by Alok Kumar on 16/04/25.
//

import Combine
import SwiftUI

final class PaymentViewModel: ObservableObject {
    
    @Published var paymentMode: PaymentMode = .none
    @Published var showModes: Bool = false
    @Published var message: String = ""
    
    private var paymentService: PaymentService?
    
    func selectMode(mode: PaymentMode) {
        showModes = false
        paymentMode = mode
        
        switch paymentMode {
            case .paypal: paymentService = Paypal()
            case .stripe: paymentService = Stripe()
            case .phonepe: paymentService = PhonePe()
            case .googlepay: paymentService = GooglePay()
            case .paytm: paymentService = PayTm()
            case .mock: paymentService = MockPay()
            default: break
        }
    }
    
    func pay(amount: Double) {
        message = paymentService?.pay(amount: amount) ?? "No payment done!"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.message = ""
        }
    }
}

protocol PaymentService {
    func pay(amount: Double) -> String
}

final class Paypal: PaymentService {
    func pay(amount: Double) -> String {
        "Paypal payment of amount: \(String(format: "%.2f", amount)) is successful!"
    }
}

final class Stripe: PaymentService {
    func pay(amount: Double) -> String {
        "Stripe payment of amount: \(String(format: "%.2f", amount)) is successful!"
    }
}

final class PhonePe: PaymentService {
    func pay(amount: Double) -> String {
        "Phonepe payment of amount: \(String(format: "%.2f", amount)) is successful!"
    }
}

final class GooglePay: PaymentService {
    func pay(amount: Double) -> String {
        "GooglePay payment of amount: \(String(format: "%.2f", amount)) is successful!"
    }
}

final class PayTm: PaymentService {
    func pay(amount: Double) -> String {
        "PayTm payment of amount: \(String(format: "%.2f", amount)) is successful!"
    }
}

final class MockPay: PaymentService {
    func pay(amount: Double) -> String {
        "MockPay payment of amount: \(String(format: "%.2f", amount)) is successful!"
    }
}
