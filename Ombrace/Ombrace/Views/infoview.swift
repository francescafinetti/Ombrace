import SwiftUI

struct InfoView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Welcome to [App Name]")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                Text("A space designed to support individuals who are navigating body dysmorphia with self-awareness and a desire for change.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Text("Our mission is to help you cultivate a healthier connection with your body through self-compassion, body-focused exercises, and mindful practices.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Text("Inspired by research on self-compassion and supportive touch, our approach encourages gentle, non-judgmental engagement with your body, helping you shift towards a more balanced and appreciative self-perception.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Text("While we are not medical professionals, our methods are rooted in scientific studies that emphasize kindness, acceptance, and connection as tools for well-being.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Text("This journey is personal, and progress looks different for everyone. Whether you're taking your first step or deepening your practice, [App Name] is here to guide you in fostering a more positive and compassionate relationship with yourself.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Text("You are worthy of kindness—especially from yourself.")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding(.top, 8)
            }
            .padding()
        }
        .navigationTitle("About")
    }
}

#Preview {
    InfoView()
}
