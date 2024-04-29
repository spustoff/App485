//
//  TabBar.swift
//  App485
//
//  Created by IGOR on 22/04/2024.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("lbg") : Color("lbg").opacity(0.5))
                            .frame(maxWidth: .infinity)
                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 38)
        .background(Color.white)
    }
}

enum Tab: String, CaseIterable {
    
    case Goals = "Goals"
    
    case Earnings = "Earnings"
    
    case Settings = "Settings"
                
}
