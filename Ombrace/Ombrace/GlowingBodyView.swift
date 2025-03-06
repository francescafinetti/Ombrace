import SwiftUI

 
struct FluidHumanFigureView: View {
    @State private var activeStep = 0
    @State private var textVisible = false
    @State private var highlightedPoint: BodyPoint? = nil // Punto attivo che si illumina
    var instructionVM = InstructionViewModel()

    var body: some View {
       
        GeometryReader { geometry in
            ZStack {
                
                // 2. Aggiungere i punti predefiniti sul corpo
                BodyPointsView(highlightedPoint: $highlightedPoint, geometry: geometry)

                // Testo delle istruzioni
                VStack {
                    
                    Image("body")
                    
                        .resizable()
                    
                        .scaledToFit()
                        .frame(width: 400.0, height: 500.0)
                        .opacity(0.2)
                    
                    Spacer()
                    Text(instructionVM.instructions[activeStep].text)
                        .font(.title2)
                        .foregroundColor(.white.opacity(0.9))
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(Color.black.opacity(0.3))
                        .cornerRadius(12)
                        .shadow(radius: 5)
                        .opacity(textVisible ? 1 : 0)
                        .transition(.opacity)
                        .animation(.easeInOut(duration: 1), value: textVisible)
                        .padding(.horizontal, 30)
                }
                .padding(.bottom, 60)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear {
                advanceStep()
            }
        }
    }

    // 3. Funzione per passare al passo successivo e attivare il punto corrispondente
    private func advanceStep() {
        if activeStep < instructionVM.instructions.count - 1 {
            withAnimation(.easeInOut(duration: 0.5)) {
                textVisible = false
                highlightedPoint = nil // Disattiva qualsiasi punto precedente
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                activeStep += 1
                highlightedPoint = instructionVM.instructions[activeStep].bodyPoint // Attiva il punto del nuovo step

                withAnimation(.easeInOut(duration: 1)) {
                    textVisible = true
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + instructionVM.instructions[activeStep].duration) {
                    advanceStep()
                }
            }
        }
    }
}

// 4. Vista per i punti predefiniti
struct BodyPointsView: View {
    @Binding var highlightedPoint: BodyPoint?
    var geometry: GeometryProxy

    private let points: [BodyPoint: CGPoint] = [
         
        .head: CGPoint(x: 0.38, y: 0.25), // Testa
        .leftShoulder: CGPoint(x: 0.4, y: 0.38), // Spalla sinistra
        .rightShoulder: CGPoint(x: 0.6, y: 0.38), // Spalla destra
        .heart: CGPoint(x: 0.5, y: 0.75), // Cuore
        .stomach: CGPoint(x: 0.5, y: 0.9), // Stomaco
        .out: CGPoint(x: -10.0, y: -10.0)
    ]

    var body: some View {
        ForEach(BodyPoint.allCases, id: \.self) { point in
            AnimatedCircleView()
                .opacity(self.highlightedPoint == point ? 1 : 0) // Mostra solo il punto evidenziato
                .position(x: points[point]!.x * geometry.size.width,
                          y: points[point]!.y * geometry.size.height)
                .animation(.easeInOut(duration: 0.5), value: highlightedPoint)
        }
    }

}





#Preview {
    FluidHumanFigureView()
}
