//
//  DiagramView.swift
//  App485
//
//  Created by IGOR on 24/04/2024.
//

import SwiftUI

struct DiagramView: View {

    @StateObject var viewModel: EarningsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg3")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("\(viewModel.currentCurrency)")
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
                .padding(.bottom, 20)

                
                HStack {
                    
                    VStack(alignment: .leading) {
                        
                        Text("Currency value")
                            .foregroundColor(.black.opacity(0.3))
                            .font(.system(size: 13, weight: .semibold))
                        
                        Text("$\(String(format: "%.f", Double(.random(in: 0...4))))\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9)))).\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))")
                            .foregroundColor(.black)
                            .font(.system(size: 26, weight: .semibold))
                        
                    }
                    
                    Spacer()
                    
                    Text("+ $\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9)))).\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))")
                        .foregroundColor(.green)
                        .font(.system(size: 13, weight: .semibold))
                                        
                    Text("(\(String(format: "%.f", Double(.random(in: 1...9)))).\(String(format: "%.f", Double(.random(in: 1...9))))%)")
                        .foregroundColor(.green)
                        .font(.system(size: 13, weight: .medium))
                    
                }
                .padding(.vertical)
                
                Image("diagram")
                    .resizable()
                    .padding(.bottom, 30)
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Back")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.red))
                    })
                    
                    Button(action: {
                        
                        viewModel.pair = viewModel.currentCurrency
      
                            viewModel.isGraphic = false

                            viewModel.isCurrencies = false
                            
                    }, label: {
                        
                        Text("Apply")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.green))
                    })
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    DiagramView(viewModel: EarningsViewModel())
}
