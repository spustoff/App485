//
//  LoadingView.swift
//  App485
//
//  Created by IGOR on 22/04/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color("black")
                .ignoresSafeArea()
            
            VStack {
                
                Image("llogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)

                ProgressView()
                    .padding(.top, 60)
            }
        }
    }
}

#Preview {
    LoadingView()
}
