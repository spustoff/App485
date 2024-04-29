//
//  R2.swift
//  App485
//
//  Created by IGOR on 22/04/2024.
//

import SwiftUI

struct R2: View {
    
    @AppStorage("status") var status = false
    
    var body: some View {
 
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("R2")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 10) {
                    
                    Text("Convenient operation")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .semibold))
                        .padding(.top)
                    
                    Text("All in one place")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .regular))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 30).fill(Color("lbg")))
                            .padding()
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .frame(height: 260)
            }
        }
    }
}

#Preview {
    R2()
}
