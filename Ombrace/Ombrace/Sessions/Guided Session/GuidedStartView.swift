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

                        VStack(alignment: .leading, spacing: 15) {
                            Text("Guided Session")
                                .font(.largeTitle)
                                .bold()
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.white)
                                .frame(width: 200, alignment: .leading)
                            
                            Text("Find A Calm Space\nFor You Focus On Yourself And Start Your Journey")
                                .font(.headline)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.white)
                                .frame(width: 200, alignment: .leading)
                            
                            Text("Take a deep breath and begin when you're ready.")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .frame(width: 200, alignment: .leading)
                            Button(action: {
                                navigateToSession = true
                            }) {
                                Text("Start session")
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
                            .padding(.top, 10)
                        }
                        .padding(.trailing, 200)
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
        .navigationDestination(isPresented: $navigateToSession) {
            GlowingBodyView()
        }
    }
}

#Preview {
    GuidedStartView()
}
