//
//  CurrenciewView.swift
//  App485
//
//  Created by IGOR on 24/04/2024.
//

import SwiftUI

struct CurrenciewView: View {

    @StateObject var viewModel: EarningsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Currency change")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color.black)
                                .font(.system(size: 18, weight: .semibold))
                            
                            Spacer()
                        }
                    })
                    .frame(maxWidth: .infinity, alignment: .leading)

                }
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 15) {
                        
                        ForEach(viewModel.currencies, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.currentCurrency = index
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isGraphic = true
                                }
                                
                            }, label: {
                                
                                VStack {
                                    
                                    HStack {
                                        
                                        Text(index)
                                            .foregroundColor(.black)
                                            .font(.system(size: 18, weight: .semibold))
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .trailing) {
                                            
                                            Text("$\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9)))).\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .semibold))
                                            
                                            HStack {
                                                
                                                Text("+$\(String(format: "%.f", Double(.random(in: 0...4))))\(String(format: "%.f", Double(.random(in: 1...9)))).\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))")
                                                    .foregroundColor(.green)
                                                    .font(.system(size: 11, weight: .regular))

                                            }
                                        }
                                    }
                                }
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .black.opacity(0.2), radius: 4))
                            .padding(3)
                        }
                    }
                }
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isGraphic, content: {
            
            DiagramView(viewModel: viewModel)
        })
    }
}

#Preview {
    CurrenciewView(viewModel: EarningsViewModel())
}
