import SwiftUI

struct GuidedStartView: View {
    @State private var selectedPath = "Top to Bottom"
    @State private var navigateToSession = false
    
    
    
    let paths = ["Top to Bottom", "Bottom to Top"]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Text("Welcome to Your Guided Session")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Image("body")
                    .resizable()
                    .scaledToFit()

                Text("Choose a path and take a deep breath before we begin.")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Picker("Path", selection: $selectedPath) {
                    ForEach(paths, id: \.self) { path in
                        Text(path)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                                Button(action: {
                                    navigateToSession = true
                                }) {
                                    Text("Start")
                                        .font(.title2)
                                        .bold()
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.accent2)
                                        .foregroundColor(.white)
                                        .cornerRadius(12)
                                        .shadow(radius: 5)
                                        .padding(.horizontal, 40)
                                }
                                .padding(.top, 100)
                            }
                            .navigationDestination(isPresented: $navigateToSession) {
                                GlowingBodyView()
                            }
                        }
                    }
                }

                #Preview {
                    GuidedStartView()
                }
