import SwiftUI

struct StartView: View {
    @State private var isAnimating = false
    @State private var animate = false

    var body: some View {
        NavigationStack {
                 VStack(spacing: 30) {
                     animazione2()
                     Spacer()

                     Text("Your Session", comment: "Title that welcome the user after selecting Your Session mode in the menu")
                         .font(.largeTitle)
                         .bold()
                         .multilineTextAlignment(.center)
                         .foregroundColor(.white)
                         .padding(.horizontal, 30)

                     VStack (spacing: 20){
                         Text("A self-guided and personal space where you can select exercises, reflections, and practices that best support your journey toward self-acceptance. \n You're free to end the session anytime you need and repeat it whenever you want.", comment: "Text that explains the user how to start the session")
                             .font(.body)
                             .fixedSize(horizontal: false, vertical: true)
                             .layoutPriority(1)
                         
                         Text("Take a deep breath and begin when you're ready.", comment: "Text that explains the user how to start the session")
                             .font(.headline)
                             .fixedSize(horizontal: false, vertical: true)
                             .layoutPriority(1)
                     }
                     .frame(maxWidth: .infinity)
                     .foregroundColor(.white.opacity(0.8))
                     .multilineTextAlignment(.center)
                     .padding(.horizontal, 30)

                     Spacer()

                     NavigationLink(destination: IntertwinedCirclesView()) {
                         Text("Start", comment: "Button to start the session.")
                             .font(.title2)
                             .bold()
                             .padding()
                             .frame(maxWidth: 220)
                             .background(
                                 RoundedRectangle(cornerRadius: 28)
                                     .fill(Color.accent2)
                             )
                             .foregroundColor(.white)
                     }
                     .padding(.bottom, 160)
                 }
             }
        }
    }


#Preview {
    StartView()
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
