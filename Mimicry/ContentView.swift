//
//  ContentView.swift
//  Mimicry
//
//  Created by Романенко Иван on 19.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isExpand = false
    @Namespace private var animation
    
    private var alignment: Alignment {
        isExpand ? .center : .bottomTrailing
    }
    
    var body: some View {
        ZStack {
            if isExpand {
                Button {
                    isExpand.toggle()
                } label: {
                    HStack {
                        Image(systemName: "arrowshape.backward.fill")
                        
                        Text("Back")
                    }
                    .fontWeight(.bold)
                    .fixedSize()
                    .foregroundStyle(.white)
                    .frame(width: 100, height: 40, alignment: .leading)
                    .padding()
                    .matchedGeometryEffect(id: "text", in: animation)
                }
                .frame(width: 350, height: 400, alignment: .topLeading)
                .background(
                    Color.blue.cornerRadius(10)
                        .matchedGeometryEffect(id: "background", in: animation)
                )
            } else {
                Button {
                    isExpand.toggle()
                } label: {
                    Text("Open")
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .fixedSize()
                        .matchedGeometryEffect(id: "text", in: animation)
                        .frame(width: 100, height: 40)
                        .background(
                            Color.blue.cornerRadius(10)
                                .matchedGeometryEffect(id: "background", in: animation)
                        )
                }
            }
        }
        .padding()
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: alignment
        )
        .animation(.spring(duration: 0.4), value: isExpand)
    }
}

#Preview {
    ContentView()
}
