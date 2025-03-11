import SwiftUI

struct GuidedStartView: View {
    @State private var navigateToSession = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading, spacing: 50) {
                    HStack {
                        Image("body")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 400)
                            .opacity(0.8)
                            .ignoresSafeArea()
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Guided Session")
                                .font(.largeTitle)
                                .bold()
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.white)
                                .frame(width: 220, alignment: .leading)
                                .offset(x: -20)
                            
                            
                            VStack(alignment: .leading, spacing: 25) {
                                
                                
                                Text("Let the glowing dots guide your hands with mindfulness and intention.")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.accent2)
                                    .frame(width: 200, alignment: .leading)
                                
                                Text("Take a deep breath and begin when you're ready.")
                                    .font(.body)
                                    .foregroundColor(.gray)
                                    .frame(width: 200, alignment: .leading)
                            } .offset(x: -20)
                            Button(action: {
                                navigateToSession = true
                            }) {
                                Text("Start")
                                    .font(.title2)
                                    .bold()
                                    .padding()
                                    .frame(width: 220)
                                    .background(
                                        RoundedRectangle(cornerRadius: 28)
                                            .fill(Color.accent2)
                                        
                                    )
                                    .foregroundColor(.white)
                                    .offset(x: -35)
                            }
                            .padding(.top, 50)
                        }.padding(.bottom, 50)
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
