import SwiftUI
import AVFoundation

struct GlowingBodyContainerView: View {
    @State private var activeStep = 0
    @State private var textVisible = true
    @State private var leftPosition = CGPoint(x: 80, y: 600)
    @State private var rightPosition = CGPoint(x: 320, y: 600)
    @State private var scale: CGFloat = 1.0
    @State private var offset: CGSize = .zero
    @State private var isSoundOn = true
    @State private var sessionCompleted = false
    @State private var showExitConfirmation = false
    @State private var navigateToContentView = false // 🔹 Per navigare a ContentView

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
                CompletedView() // 🔹 Se la sessione finisce, va a CompletedView
            }
            .navigationDestination(isPresented: $navigateToContentView) {
                ContentView() // 🔹 Se si esce, va a ContentView
            }
        }
    }
    
    private func startSession() {
        advanceStep()
        if isSoundOn {
            SoundManager.shared.playSelectedSound()
        }
    }
    
    private func advanceStep() {
        if activeStep < instructionVM.instructions.count - 1 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation(.easeInOut(duration: 1)) {
                    textVisible = false
                }
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
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
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + instructionVM.instructions[activeStep].duration) {
                advanceStep()
            }
        } else {
            endSession()
        }
    }

    private func endSession() {
        SoundManager.shared.stopSound()
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
