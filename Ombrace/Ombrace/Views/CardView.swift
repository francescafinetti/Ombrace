//
//  CardView.swift
//  challenge5
//
//  Created by Serena Pia Capasso on 24/02/25.
//

import SwiftUI

struct CardView: View {
    var title: String
    var subtitle: String
    var icon: String
    var description: String
   
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading, spacing: 25) {
                HStack {
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 45)
                        .foregroundColor(.accent1)
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
                                .foregroundColor(.accent1)
                            Text(subtitle)
                                .fontWeight(.semibold)
                                .foregroundColor(.accent1)
                                .font(.subheadline)
                            
                        }
                    }
                }
                
                Text(description)
                    .font(.footnote)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .padding(.bottom)
                    .padding(.leading, 15)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(15)
            .padding(.horizontal)
            
        }
    }
}

#Preview {
    CardView(title: "example", subtitle: "MIN", icon: "hand.tap.fill", description: "Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry.")
}

