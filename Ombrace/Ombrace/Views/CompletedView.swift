import SwiftUI

struct CompletedView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 50) {
                AnimatedCircleView()
                    .padding(.bottom)

                Text("Well done!")
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.top)

                Text("You completed the session! \n You should be proud of what you have accomplished today.")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.bottom)
                NavigationLink(destination: ContentView()) {
                    Text("Complete")
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
