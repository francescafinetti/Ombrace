import SwiftUI
struct MovingDotView: View {
    let pathPoints: [CGPoint] = [
        CGPoint(x: 285, y: 0),
        CGPoint(x: 224, y: 32),
        CGPoint(x: 195, y: 123),
        CGPoint(x: 242, y: 292),
        CGPoint(x: 92, y: 390),
        CGPoint(x: 51, y: 460),
        CGPoint(x: 6, y: 777),
        CGPoint(x: 2, y: 1171),
        CGPoint(x: 52, y: 1260),
        CGPoint(x: 39, y: 1020),
        CGPoint(x: 100, y: 1400),
        CGPoint(x: 200, y: 1600),
        CGPoint(x: 250, y: 1800),
        CGPoint(x: 300, y: 2000),
        CGPoint(x: 350, y: 2200)
    ]
    
    @State private var currentIndex = 0
    @State private var position = CGPoint(x: 285, y: 0)
    
    var body: some View {
        ZStack {
            ForEach(0..<pathPoints.count - 1, id: \ .self) { index in
                Path { path in
                    path.move(to: pathPoints[index])
                    path.addLine(to: pathPoints[index + 1])
                }
                .stroke(Color.gray, lineWidth: 2)
            }
            
            Circle()
                .fill(Color.red)
                .frame(width: 20, height: 20)
                .position(position)
                .onAppear {
                    moveDot()
                }
        }
    }
    
    func moveDot() {
        guard currentIndex < pathPoints.count - 1 else {
            currentIndex = 0
            position = pathPoints[0]
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                moveDot()
            }
            return
        }
        
        let nextIndex = currentIndex + 1
        let nextPoint = pathPoints[nextIndex]
        
        withAnimation(.linear(duration: 1)) {
            position = nextPoint
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            currentIndex = nextIndex
            moveDot()
        }
    }
}

#Preview {
    MovingDotView()
}
