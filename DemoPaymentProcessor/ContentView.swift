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
            VStack(spacing: 2) {
                HStack {
                    Text("Choose payment mode:")
                        .font(.system(size: 16, weight: .medium))
                        .lineLimit(1)
                    
                    Spacer()
                    
                    Button {
                        viewModel.showModes.toggle()
                    } label: {
                        SelectPaymentModeView(viewModel: viewModel, width: geo.size.width / 3)
                    }
                    .buttonStyle(.plain)
                }
                
                ZStack(alignment: .topTrailing) {
                    VStack {
                        Button {
                            viewModel.pay(amount: 10)
                        } label: {
                            Text("Pay Now")
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(viewModel.paymentMode == .none)
                        
                        Text(viewModel.message)
                            .opacity(viewModel.message.isEmpty ? 0 : 1)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 500)
                    
                    VStack {
                        if viewModel.showModes {
                            PaymentModeView(viewModel: viewModel, width: geo.size.width / 2)
                        }
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
    
    @ObservedObject var viewModel: PaymentViewModel
    
    var width: CGFloat
    var body: some View {
        VStack(alignment: .trailing) {
            VStack {
                HStack {
                    HStack {
                        Spacer()
                        
                        Text(viewModel.paymentMode.rawValue.capitalized)
                            .font(.system(size: 16))
                        
                        Spacer()
                        
                        Image(systemName: "arrowtriangle.down.fill")
                            .font(.system(size: 16))
                    }
                    .padding(.vertical, 6)
                    .padding(.horizontal, 8)
                }
                .background(.white)
                .clipShape(.rect(cornerRadius: 6))
                .padding(5)
            }
            .background(.gray.opacity(0.3))
            .clipShape(.rect(cornerRadius: 6))
        }
    }
}

struct PaymentModeView: View {
    
    @ObservedObject var viewModel: PaymentViewModel
    var width: CGFloat
    let modes = Array(PaymentMode.modes.enumerated())
    
    var body: some View {
        VStack {
            VStack {
                ForEach(modes, id: \.element) { (index, mode) in
                    Button {
                        viewModel.selectMode(mode: mode)
                    } label: {
                        VStack {
                            HStack {
                                Text(mode.rawValue.capitalized)
                                
                                Spacer()
                            }
                            
                            if (modes.count - 1) != index {
                                Divider()
                            }
                        }
                        .padding(.horizontal)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.vertical, 10)
            .background()
            .clipShape(.rect(cornerRadius: 10))
        }
        .padding(5)
        .background(.gray.opacity(0.1))
        .clipShape(.rect(cornerRadius: 10))
        .frame(width: width)
    }
}
