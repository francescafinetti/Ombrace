import SwiftUI
import CoreHaptics

struct CompletedView: View {    
    var body: some View {
        NavigationStack {
            
            VStack(spacing: 30) {
                AnimatedCircleView()
                    .frame(width: 500, height: 150)
                
                Text("Well done!")
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
                Text("You completed the session! \n You should be proud of what you have accomplished today.")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Text("Complete")
                    .font(.title2)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.accent2)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                    .padding(.horizontal, 40)
                    .padding(.top,200)
            }
        }
    }
}


#Preview {
    CompletedView()
}
