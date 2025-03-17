//
//  WatchCardView.swift
//  Ombrace
//
//  Created by Francesca Finetti on 17/03/25.
//



import SwiftUI


struct WatchCardView: View {
    var title: LocalizedStringKey
    var subtitle: LocalizedStringKey
    var icon: String
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading, spacing: 15) {
                HStack {
                    Image(icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: .infinity, height: 60)
                        .font(.largeTitle)
                        .foregroundColor(Color.orange)
                        .padding(.top)
                    Spacer()
                    VStack(alignment: .leading, spacing: 15) {
                        Text(title)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        HStack {
                            Image(systemName: "clock.fill")
                                .foregroundColor(.orange)
                            Text(subtitle)
                                .fontWeight(.semibold)
                                .foregroundColor(.orange)
                                .font(.subheadline)
                               
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                } 
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(UIColor.darkGray))
            
            )             .buttonStyle(PlainButtonStyle())

        }
    }
}

#Preview {
    WatchContentView()
}



