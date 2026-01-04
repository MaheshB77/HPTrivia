//
//  ContentView.swift
//  HPTrivia
//
//  Created by Mahesh Bansode on 04/01/26.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State private var player: AVAudioPlayer!
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
        .onAppear {
            playBackgroundMusic()
        }
    }
    
    private func playBackgroundMusic() {
        let sound = Bundle.main.path(forResource: "magic-in-the-air", ofType: "mp3")
        player = try! AVAudioPlayer(contentsOf: URL(filePath: sound!))
        player.numberOfLoops = -1
        player.play()
    }
}

#Preview {
    ContentView()
}
