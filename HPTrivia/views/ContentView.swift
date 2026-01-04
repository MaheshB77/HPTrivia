//
//  ContentView.swift
//  HPTrivia
//
//  Created by Mahesh Bansode on 04/01/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(.hogwarts)
                    .resizable()
                    .frame(width: geo.size.width * 4, height: geo.size.height)
                    .padding(.top, 4)
                    .border(.blue)
                    .phaseAnimator([false, true]) { content, phase in
                        content
                            .offset(
                                x: phase
                                    ? geo.size.width / 1.1
                                    : -geo.size.width / 1.1
                            )
                    } animation: { _ in
                        .linear(duration: 80)
                    }
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
