import SwiftUI

struct CompletedView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 50) {
                AnimatedCircleView()
                    .padding(.bottom)

                Text("Well done!", comment: "I title that explains to the user that has completed the session")
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal)

                    .padding(.top)

                Text("You completed the session! \n You should be proud of what you have accomplished today.", comment: "A text that explains to the user that has completed the session")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.bottom)
                NavigationLink(destination: ContentView()) {
                    Text("Complete", comment: "A button that allows the user to go back to the home screen after completing the session, the button give the idea of had completed it.")
                        .font(.title2)
                        .bold()
                        .padding()
                        .frame(maxWidth: 250)
                        .background(
                            RoundedRectangle(cornerRadius: 28)
                                .fill(Color.accent2)
                        )
                        .foregroundColor(.white)
                }
            } .navigationBarBackButtonHidden(true)
        }
    }
}


#Preview {
    CompletedView()
}

//QUESTA VALE PER TUTTE E DUE LE SESSION QUANDO FINISCE LA SESSIONE - NON QUANDO ESCI TU
