//
//  ContentView.swift
//  SwiftUI-KeyAnimationApp
//
//  Created by Saumil Shah on 24/06/24.
//

import SwiftUI

let screenWidth = UIScreen.main.bounds.size.width
struct ContentView: View {
    
    // MARK: - variables -
    @StateObject var viewModel = ViewModel()
    // State variable to track the rotation angle
    @State private var rotationAngle: Double = 0
    // State variable to count the number of flips
    @State private var flipCount: Int = 0
    
    // MARK: - functions -
    ///
    /// The func is `animateTag` will animate tag
    ///  A ContentView's `animateTag` method
    ///
    fileprivate func animateTag () {
        // Increase the flip count and reset if it reaches 5
        if flipCount < 2 {
            flipCount += 1
            rotationAngle += 360
        } else {
            // Reset flip count and rotation angle
            flipCount = 0
            rotationAngle = 0
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack() {
                Spacer()
                Text(StringConstants.designInspiredFromApple)
                    .font(.title3)
                    .padding(.trailing, 10)
                    .padding(.bottom, 7)
                    .foregroundColor(.black)
            }
            
            VStack {
                // Key with Apple Tag
                ZStack {
                    // Key
                    Image(viewModel.selectedKeyVarinat.id)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: screenWidth - 40, height: 400)
                    
                    // Apple Tag
                    Button(action: {
                        self.animateTag()
                    }, label: {
                        Image(systemName: Images.appleLogo)
                            .foregroundColor(.black)
                            .frame(width: 45, height: 45)
                            .font(.system(size: 40))
                            .padding()
                            .blendMode(.plusDarker)
                            .background(LinearGradient(colors: [.secondary, .white], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .cornerRadius(50)
                            .shadow(color: .gray.opacity(0.7), radius: 10, x: -15, y: 15)
                            .rotation3DEffect(
                                .degrees(rotationAngle), axis: (x: 0.0, y: 1.0, z: 0.0)
                            )
                    })
                    .padding(.top, 172)
                    .padding(.trailing, 25)
                    .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                        .onEnded({ _ in
                            animateTag()
                        })
                    )
                }
                
                // Variants
                HStack(spacing: 0) {
                    ForEach(0..<self.viewModel.variants.count, id: \.self) { index in
                        VariantView(index: index, viewModel: viewModel)
                            .padding(5)
                    }
                }
                .padding(.bottom, 10)
            }
            .background(.white)
            .cornerRadius(10)
            .shadow(radius: 10)
        }
        .padding(.horizontal, 20)
        .clipped()
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        // change background as per variant selection
        .background(
            LinearGradient(colors: [Color(hex: viewModel.selectedKeyVarinat.color).opacity(0.2), Color(hex: viewModel.selectedKeyVarinat.color)], startPoint: UnitPoint(x: 0.6, y: 0.2), endPoint: UnitPoint(x: 0.2, y: 0.6))
        )
    }
}

#Preview {
    ContentView()
}
