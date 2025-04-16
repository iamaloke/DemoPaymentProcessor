//
//  ContentView.swift
//  DemoPaymentProcessor
//
//  Created by Alok Kumar on 16/04/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = PaymentViewModel()
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack {
                    Text("Choose your payment mode:")
                        .font(.system(size: 18, weight: .medium))
                    
                    Spacer()
                    
                    SelectPaymentModeView(modes: $viewModel.paymentMode, width: geo.size.width / 3)
                        .overlay(alignment: .bottomTrailing) {
                            Text("here")
                        }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

struct SelectPaymentModeView: View {
    
    @Binding var modes: PaymentMode
    
    var width: CGFloat
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Spacer()
                    
                    Text(modes.rawValue)
                    
                    Spacer()
                    
                    Image(systemName: "arrowtriangle.down.fill")
                        .font(.system(size: 16))
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 8)
            }
            .background(.white)
            .padding(4)
        }
        .background(.gray.opacity(0.5))
        .clipShape(.rect(cornerRadius: 4))
        .frame(width: width)
    }
}

struct PaymentModeView: View {
    var body: some View {
        ForEach(PaymentMode.allCases, id: \.self) { mode in
            HStack {
                Text(mode.rawValue.capitalized)
                
                Spacer()
            }
        }
    }
}
