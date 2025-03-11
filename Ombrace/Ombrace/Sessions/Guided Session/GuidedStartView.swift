import SwiftUI

struct GuidedStartView: View {
    @State private var navigateToSession = false

    var body: some View {
        NavigationStack {
            ZStack {
                VStack(alignment: .leading, spacing: 50) {
                   

                    HStack {
                        Image("body")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 400)
                            .opacity(0.8)

                        VStack(alignment: .leading, spacing: 15) {
                            Text("Guided \nSession")
                                .font(.largeTitle)
                                .bold()
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.white)
                                .frame(width: 220, alignment: .leading)
                            
                            VStack(alignment: .leading, spacing: 15) {
                                Text("Step-by-step exercises combining mindfulness, breathing, and body-awareness techniques to help shift perception and build self-compassion.")
                                    .font(.body)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.gray)
                                    .frame(width: 180, alignment: .leading)

                                Text("Let the glowing dots guide your hands with mindfulness and intention.")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.accent2)
                                    .frame(width: 200, alignment: .leading)

                                Text("Take a deep breath and begin when you're ready.")
                                    .font(.body)
                                    .foregroundColor(.gray)
                                    .frame(width: 200, alignment: .leading)
                            }
                            Button(action: {
                                navigateToSession = true
                            }) {
                                Text("Start")
                                    .font(.title2)
                                    .bold()
                                    .padding()
                                    .frame(width: 180)
                                    .background(
                                        RoundedRectangle(cornerRadius: 28)
                                            .fill(Color.accent2)
                                    )
                                    .foregroundColor(.white)
                            }
                            .padding(.top, 50)
                        }
                        .padding(.trailing, 200)
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
        .navigationDestination(isPresented: $navigateToSession) {
            GlowingBodyContainerView()
        }
    }
}

#Preview {
    GuidedStartView()
}
