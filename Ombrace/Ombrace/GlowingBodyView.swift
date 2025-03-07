import SwiftUI

 
struct GlowingBodyView: View {
    @State private var activeStep = 0
    @State private var textVisible = false
    @State private var highlightedPoints: [BodyPoint] = []
    var instructionVM = InstructionViewModel()

    var body: some View {
       
        GeometryReader { geometry in
            ZStack {
                
              //punti predefiniti sul corpo
                
                BodyPointsView(highlightedPoints: $highlightedPoints, geometry: geometry)

                // Testo delle istruzioni e immagine
                VStack(alignment: .center) {
                    
                    
                    Image("body")
                        .resizable()
                        .scaledToFit()
                        .opacity(0.4)
                        .padding()
                        
                       
                    
                    Spacer()
                    
                    Text(instructionVM.instructions[activeStep].text)
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                        .opacity(textVisible ? 1 : 0)
                        .transition(.opacity)
                        .animation(.easeInOut(duration: 1), value: textVisible)
                       
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
            
            let nextStep = activeStep + 1
            let nextBodyPoints = instructionVM.instructions[nextStep].bodyPoints
            
            withAnimation(.easeInOut(duration: 0.5)) {
                textVisible = false
                if nextBodyPoints != highlightedPoints {
                highlightedPoints = [] // Disattiva qualsiasi punto precedente
                }
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                activeStep += 1
                highlightedPoints = instructionVM.instructions[activeStep].bodyPoints // Attiva il punto del nuovo step

                withAnimation(.easeInOut(duration: 1)) {
                    textVisible = true
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + instructionVM.instructions[activeStep].duration) {
                    advanceStep()
                }
            }
        } else if activeStep == instructionVM.instructions.count - 1 {
            //chiudi la sessione
        }
    }
}








#Preview {
    GlowingBodyView()
    
}
