import SwiftUI

struct GuidedStartView: View {
    @State private var navigateToSession = false
    
    var body: some View {

        NavigationView {
            ZStack {
                VStack(alignment: .trailing, spacing: 50) {
                    HStack {
                        VStack(alignment: .trailing, spacing: 15) {
                            Text("Guided Session", comment: "Title that welcome the user after selecting Guided Session mode in the menu")
                                .font(.largeTitle)
                                .bold()
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.white)
                                .frame(width: 220, alignment: .trailing)
                                .offset(x: -50)
                            
                            VStack(alignment: .trailing, spacing: 25) {
                                Text("Let the glowing dots guide your hands with mindfulness and intention.", comment: "Text that explains the user how to start the session")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.accent2)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: 200, alignment: .trailing)
                                    .offset(x: 20)


                                Text("Take a deep breath and begin when you're ready.", comment: "Text that explains the user how to start the session")
                                    .font(.body)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: 200, alignment: .trailing)
                                    .offset(x: 10)

                            }
                            
                            Button(action: {
                                navigateToSession = true
                            }) {
                                Text("Start", comment: "Button to start the session.")
                                    .font(.title2)
                                    .bold()
                                    .padding()
                                    .frame(width: 200)
                                    .background(
                                        RoundedRectangle(cornerRadius: 28)
                                            .fill(Color.accent2)
                                    )
                                    .foregroundColor(.white)
                                    .offset(x: 12)
                            }
                            .padding(.top, 50)
                        }
                        .padding(.bottom, 50)
                        .padding(.leading, 200)

                        Image("body") 
                            .resizable()
                            .scaledToFit()
                            .frame(width: 400)
                            .opacity(0.8)
                            .ignoresSafeArea()
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
