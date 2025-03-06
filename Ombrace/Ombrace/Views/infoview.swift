import SwiftUI

struct InfoView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                
                Spacer()
                Image("heart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)

                
                Text("Welcome to Ombrace!")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                Group {
                    Text("A space designed to support individuals who are navigating body dysmorphia with self-awareness and a desire for change.")
                    
                    Divider().padding(.horizontal, 40)
                    
                    Text("Our mission is to help you cultivate a healthier connection with your body through self-compassion, body-focused exercises, and mindful practices.")
                    
                    Divider().padding(.horizontal, 40)

                    Text("Inspired by research on self-compassion and supportive touch, our approach encourages gentle, non-judgmental engagement with your body, helping you shift towards a more balanced and appreciative self-perception.")
                    
                    Divider().padding(.horizontal, 40)

                    Text("While we are not medical professionals, our methods are rooted in scientific studies that emphasize kindness, acceptance, and connection as tools for well-being.")
                    
                    Divider().padding(.horizontal, 40)

                    Text("This journey is personal, and progress looks different for everyone. Whether you're taking your first step or deepening your practice, Ombrace is here to guide you in fostering a more positive and compassionate relationship with yourself.")
                }
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                
                Text("You are worthy of kindness—especially from yourself.")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.accent2)
                    .multilineTextAlignment(.center)
                    .padding(.top, 8)

                .padding(.top, 20)
            }
            .padding()
        }
        .background(Color(.systemGray6).ignoresSafeArea()) 
    }
}

#Preview {
    InfoView()
}
