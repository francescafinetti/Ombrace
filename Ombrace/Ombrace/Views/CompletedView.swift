import SwiftUI

struct CompletedView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Image("prova")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150 )
                Text("Well done!", comment: "I title that explains to the user that has completed the session")
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                Text("You completed the session! \n You should be proud of what you have accomplished today.", comment: "A text that explains to the user that has completed the session")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                NavigationLink(destination: ContentView()) {
                    Text("Complete", comment: "A button that allows the user to go back to the home screen after completing the session, the button give the idea of had completed it.")
                        .font(.title2)
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accent2)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                        .padding(.horizontal, 40)
                        .padding(.top,120)
                }
            } .navigationBarBackButtonHidden(true)
        }
    }
}


#Preview {
    CompletedView()
}
