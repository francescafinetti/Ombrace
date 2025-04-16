import SwiftUI

struct GuidedStartView: View {
    @State private var navigateToSession = false
    
    var body: some View {
        NavigationView {
                    HStack {
                        VStack (alignment: .leading, spacing: 25) {
                            Text("Guided Session", comment: "Title that welcome the user after selecting Guided Session mode in the menu")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.white)
                            
                            
                                Text("Let the glowing dots guide your hands with mindfulness and intention.", comment: "Text that explains the user how to start the session")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.accent2)
                                    


                                Text("Take a deep breath and begin when you're ready.", comment: "Text that explains the user how to start the session")
                                    .font(.body)
                                    .foregroundColor(.gray)
                                    
                            
                            
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
                                   
                            }
                            
                        } .padding(.leading, 40.0)
                       
                        
                        
                        Image("body")
                            .resizable()
                            .scaledToFill()
                            .opacity(0.8)
                            .ignoresSafeArea()
                        
                    }
                    .padding(.trailing, -115.0)
            
        }
        .navigationDestination(isPresented: $navigateToSession) {
            GuidedSession()
        }
    }
}

#Preview {
    GuidedStartView()
}
