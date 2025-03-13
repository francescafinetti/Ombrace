//NON FUNZIONA COME DOVREBBE UFF


import SwiftUI
import AVFoundation
import Vision

struct HandTrackingView: View {
    @StateObject private var cameraModel = HandTrackingCameraModel()
    
    var body: some View {
        ZStack {
            Image("body")
                .resizable()
                .scaledToFit()
            
            ForEach(cameraModel.handTrackingPoints, id: \..self) { point in
                SessionCircleView(gradientColors: [
                    Color.orange.opacity(0.7),
                           Color.orange.opacity(0.8),
                           Color.red.opacity(0.9),
                           Color.white.opacity(0.6)
                ])
                    .position(point)
            }
        }
        .onAppear {
            cameraModel.startHandTrackingSession()
        }
    }
}

class HandTrackingCameraModel: NSObject, ObservableObject, AVCaptureVideoDataOutputSampleBufferDelegate {
    @Published var handTrackingPoints: [CGPoint] = []
    let handTrackingSession = AVCaptureSession()
    private let videoOutput = AVCaptureVideoDataOutput()
    private var previousHandPoints: [CGPoint] = []
    private let maxStoredFrames = 5 // Stabilizzazione media mobile
    
    override init() {
        super.init()
        setupHandTrackingCamera()
    }
    
    private func setupHandTrackingCamera() {
        guard let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) else {
            return
        }
        
        do {
            let input = try AVCaptureDeviceInput(device: device)
            if handTrackingSession.canAddInput(input) {
                handTrackingSession.addInput(input)
            }
        } catch {
            return
        }
        
        videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        if handTrackingSession.canAddOutput(videoOutput) {
            handTrackingSession.addOutput(videoOutput)
        }
    }
    
    func startHandTrackingSession() {
        DispatchQueue.global(qos: .background).async {
            self.handTrackingSession.startRunning()
        }
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        let request = VNDetectHumanBodyPoseRequest()
        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: .up, options: [:])
        try? handler.perform([request])
        
        guard let observations = request.results as? [VNHumanBodyPoseObservation] else {
            return
        }
        
        DispatchQueue.main.async {
            var newPoints: [CGPoint] = []
            
            for observation in observations {
                if let rightWrist = try? observation.recognizedPoint(.rightWrist), rightWrist.confidence > 0.3 {
                    let convertedPoint = self.convertHandTrackingToViewCoordinates(rightWrist.location)
                    newPoints.append(convertedPoint)
                }
                if let leftWrist = try? observation.recognizedPoint(.leftWrist), leftWrist.confidence > 0.3 {
                    let convertedPoint = self.convertHandTrackingToViewCoordinates(leftWrist.location)
                    newPoints.append(convertedPoint)
                }
            }
            
            self.updateHandTrackingPoints(newPoints)
        }
    }
    
    private func updateHandTrackingPoints(_ newPoints: [CGPoint]) {
        previousHandPoints.append(contentsOf: newPoints)
        if previousHandPoints.count > maxStoredFrames {
            previousHandPoints.removeFirst(previousHandPoints.count - maxStoredFrames)
        }
        
        let stabilizedPoints = previousHandPoints.reduce(CGPoint.zero) { (result, point) in
            return CGPoint(x: result.x + point.x, y: result.y + point.y)
        }
        
        if previousHandPoints.count > 0 {
            handTrackingPoints = [
                CGPoint(x: stabilizedPoints.x / CGFloat(previousHandPoints.count),
                        y: stabilizedPoints.y / CGFloat(previousHandPoints.count))
            ]
        }
    }
    
    private func convertHandTrackingToViewCoordinates(_ visionPoint: CGPoint) -> CGPoint {
        return CGPoint(x: visionPoint.x * UIScreen.main.bounds.width, y: (1 - visionPoint.y) * UIScreen.main.bounds.height)
    }
}

struct HandTrackingView_Previews: PreviewProvider {
    static var previews: some View {
        HandTrackingView()
    }
}
