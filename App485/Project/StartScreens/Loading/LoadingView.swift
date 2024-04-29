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
            
            Color("lbg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("llogo")

                ProgressView()
                    .padding(.top, 60)
            }
        }
    }
}

#Preview {
    LoadingView()
}
