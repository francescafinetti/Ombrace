//
//  CardView.swift
//  challenge5
//
//  Created by Serena Pia Capasso on 24/02/25.
//

import SwiftUI

struct CardView: View {
    var title: LocalizedStringKey
    var subtitle: LocalizedStringKey
    var icon: String
    
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading, spacing: 25) {
                HStack {
                    Image(icon)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .foregroundColor(.accent2)
                        .padding(.top)
                        .padding(.leading, 15)
                    
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                        
                        HStack {
                            Image(systemName: "clock.fill")
                                .foregroundColor(.accent2)
                            Text(subtitle)
                                .fontWeight(.semibold)
                                .foregroundColor(.accent2)
                                .font(.subheadline)
                        }
                    }
                }
            }
            .padding()
            .background(
                Rectangle()
                    .fill(Color(.systemGray6))
                    .frame(width: 100, height: 150)
                    .cornerRadius(15) // Arrotonda i bordi
            )
            .padding(.horizontal)
        }
    }
}

#Preview {
    CardView(title: "example", subtitle: "MIN", icon: "aaa")
}


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
