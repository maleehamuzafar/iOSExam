//
//  ImageCarousel.swift
//  iOSExam
//
//  Created by Maleeha Muzafar on 07/03/2025.
//

import SwiftUI

typealias CarouselImages = [String]

struct ImageCarousel: View {
    
    private var images: CarouselImages // could be image names or urls (with AsyncImage)
    
    @ScaledMetric var spacing = 10
    private var height: CGFloat = 200
    private var cardWidthFactor: CGFloat = 0.91
    
    @Binding var currentIndex: Int
    @GestureState private var dragOffset: CGFloat = .zero
    
    private var dragGesture: some Gesture {
        DragGesture()
            .updating($dragOffset) { value, state, _ in
                state = value.translation.width
            }
            .onEnded { value in
                let threshold: CGFloat = 50
                let translationWidth = value.translation.width
                
                withAnimation(.easeInOut) {
                    if translationWidth < -threshold {
                        currentIndex = min(currentIndex + 1, images.count - 1)
                    }
                    if translationWidth > threshold {
                        currentIndex = max(currentIndex - 1, 0)
                    }
                }
            }
    }
    
    init(index: Binding<Int>, images: CarouselImages) {
        self.images = images
        self._currentIndex = index
    }
    
    var body: some View {
        GeometryReader { geometry in
            
            let cardWidth = geometry.size.width * cardWidthFactor
            let totalOffset = (CGFloat(currentIndex) * -(cardWidth + spacing)) + dragOffset
            
            VStack(spacing: spacing*1.75) {
                
                // images
                HStack(spacing: spacing) {
                    ForEach(0..<images.count, id: \.self) { index in
                        
                        Image(images[index])
                            .resizable()
                            .scaledToFill()
                            .frame(width: cardWidth, height: height, alignment: .center)
                            .cornerRadius(Constants.cornerRadius)
                            .id(index)
                    }
                }
                .frame(width: geometry.size.width, height: height, alignment: .leading)
                .padding(.leading)
                .offset(x: totalOffset)
                .gesture(dragGesture)
                .animation(.smooth, value: dragOffset)
                
                // indicators
                HStack(spacing: spacing/1.5) {
                    ForEach(0..<images.count, id: \.self) { index in
                        Circle()
                            .fill(Color.primary.opacity(currentIndex == index ? 1 : 0.3))
                            .frame(width: 10, height: 10)
                            .padding(.bottom, Constants.padding)
                            .animation(.snappy, value: currentIndex == index)
                            .onTapGesture {
                                withAnimation(.spring) {
                                    currentIndex = index
                                }
                            }
                        
                    }
                }
            }
        }.frame(height: height+40)
    }
}
