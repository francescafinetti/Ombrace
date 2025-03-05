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
    var onMoreTapped: (() -> Void)?
    
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
                            .multilineTextAlignment(.center)
                        
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
                
                Text("Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry.")
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
            
            Button(action: {
                onMoreTapped?()
            }) {
                Circle()
                    .fill(Color(.accent1))
                    .opacity(15/100)
                    .frame(width: 30, height: 30)
                    .overlay(
                        Image(systemName: "ellipsis")
                            .foregroundColor(.accent1)
                    )
                    .padding(10)
            }
        }
    }
}

#Preview {
    CardView(title: "example", subtitle: "MIN", icon: "hand.tap.fill", onMoreTapped: {})
}
