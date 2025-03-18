import SwiftUI
import AVFoundation

struct GlowingBodyContainerView: View {
    @State private var activeStep = 0
    @State private var textVisible = true
    @State private var leftPosition = CGPoint(x: 80, y: 600)
    @State private var rightPosition = CGPoint(x: 320, y: 600)
    @State private var scale: CGFloat = 1.0
    @State private var offset: CGSize = .zero
    @AppStorage("voiceEnabled") private var voiceEnabled: Bool = true
    @AppStorage("soundEnabled") private var soundEnabled: Bool = true
    @State private var sessionCompleted = false
    @State private var showExitConfirmation = false
    @State private var navigateToContentView = false
    @AppStorage("soundVolume") private var soundVolume: Double = 0.5
    @AppStorage("voiceVolume") private var voiceVolume: Double = 0.5

    var instructionVM = InstructionViewModel()

    private var bodyPointPositions: [BodyPoint: CGPoint] = [
        .leftcheek: CGPoint(x: 170, y: 155),
        .rightcheek: CGPoint(x: 230, y: 155),
        .leftShoulder: CGPoint(x: 110, y: 250),
        .rightShoulder: CGPoint(x: 290, y: 250),
        .heart: CGPoint(x: 170, y: 300),
        .stomach: CGPoint(x: 200, y: 450),
        .rightelbow: CGPoint(x: 320, y: 430),
        .leftelbow: CGPoint(x: 80, y: 430),
        .righthand: CGPoint(x: 320, y: 600),
        .lefthand: CGPoint(x: 80, y: 600),
        .rightarm: CGPoint(x: 310, y: 360),
        .leftarm: CGPoint(x: 90, y: 360)
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        showExitConfirmation = true
                    }) {
                        Image(systemName: "arrow.forward.circle.fill")
                            .resizable()
                            .frame(width: 23, height: 23)
                            .foregroundColor(.accent2)
                            .bold()
                    }
                    .alert("Are you sure you want to leave?", isPresented: $showExitConfirmation) {
                        Button("Cancel", role: .cancel) { }
                        Button("Leave", role: .destructive) {
                            exitSession()
                        }
                    } message: {
                        Text("It's okay to take a break.\nYou can always come back whenever you're ready.")
                    }
                    .padding(10)
                }
                .padding(.horizontal)
                .padding(.top, 20)
                .onDisappear {
                    SoundManager.shared.stopSound()
                    SoundManager.shared.stopGuidedAudio()
                }
                
                BodyView(leftPosition: $leftPosition, rightPosition: $rightPosition, scale: $scale, offset: $offset)
                    .gesture(MagnificationGesture()
                        .onChanged { value in
                            scale = value.magnitude
                        })
                
                InstructionView(text: instructionVM.instructions[activeStep].text, textVisible: $textVisible)
                    .onAppear {
                        startSession()
                    }
            }
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $sessionCompleted) {
                CompletedView()
            }
            .navigationDestination(isPresented: $navigateToContentView) {
                ContentView()
            }
        }
    }
    
    private func startSession() {
        advanceStep()
        
        if soundEnabled {
            SoundManager.shared.playSelectedSound(volume: soundVolume)
        }
        
        if voiceEnabled {
            SoundManager.shared.playGuidedAudio(volume: voiceVolume)
        }
    }
    
    private func advanceStep() {
        if activeStep < instructionVM.instructions.count - 1 {
            let instructionDuration = instructionVM.instructions[activeStep].duration

            // 🔹 Il testo rimane visibile per tutta la durata dell'istruzione
            DispatchQueue.main.asyncAfter(deadline: .now() + instructionDuration - 1.0) {
                withAnimation(.easeInOut(duration: 1)) {
                    textVisible = false
                }
            }

            // 🔹 Passa alla prossima istruzione dopo la durata completa
            DispatchQueue.main.asyncAfter(deadline: .now() + instructionDuration) {
                activeStep += 1
                let instruction = instructionVM.instructions[activeStep]

                let leftBodyPoint = instruction.handsposition.left
                let rightBodyPoint = instruction.handsposition.right

                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation(.easeInOut(duration: 3)) {
                        leftPosition = bodyPointPositions[leftBodyPoint] ?? leftPosition
                        rightPosition = bodyPointPositions[rightBodyPoint] ?? rightPosition
                        scale = instruction.scale
                        offset = instruction.offset
                    }
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    textVisible = true
                }

                advanceStep() // Continua con la prossima istruzione
            }
        } else {
            endSession()
        }
    }

    private func endSession() {
        SoundManager.shared.stopSound()
        SoundManager.shared.stopGuidedAudio()

        withAnimation {
            sessionCompleted = true
        }
    }

    private func exitSession() {
        SoundManager.shared.stopSound()
        navigateToContentView = true // 🔹 Naviga a ContentView
    }
}

#Preview {
    GlowingBodyContainerView()
}
