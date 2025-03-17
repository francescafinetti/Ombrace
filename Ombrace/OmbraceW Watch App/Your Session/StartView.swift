import SwiftUI

struct WatchStartView: View {
    @State private var isAnimating = false
    @State private var animate = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .trailing) {
                HStack {
                    Text("Your Session")
                        .font(.title3)
                        .multilineTextAlignment(.trailing)
                        .bold()
                        .foregroundColor(.accent2)
                        .padding(.leading, 50)
                }
                .padding(.top, -35)
            }
            
            ScrollView {
                VStack(alignment: .center, spacing: 8) {
                    Text("A self-guided space where you can select exercises, reflections, and practices that support your journey.")
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 10)
                    
                    Text("Take a deep breath and begin when you're ready.")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                    
                    Spacer()
                    
                    NavigationLink(destination: WatchIntertwinedCirclesView()) {
                        Text("Start")
                            .font(.headline)
                            .bold()
                            .padding(12)
                            .frame(maxWidth: 150)
                            .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color.accent2)
                            )
                            .foregroundColor(.black)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.bottom, 10)
                }
            }
        }
    }
}

#Preview {
    WatchStartView()
}
