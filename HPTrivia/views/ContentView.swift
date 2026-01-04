//
//  ContentView.swift
//  HPTrivia
//
//  Created by Mahesh Bansode on 04/01/26.
//

import AVKit
import SwiftUI

struct ContentView: View {
    @State private var player: AVAudioPlayer!
    @State private var playButtonAnimation = false
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

                VStack {
                    Image(systemName: "wand.and.stars")
                        .imageScale(.large)
                        .font(.largeTitle)
                        .padding(.bottom, 20)
                    Text("HP")
                        .font(.custom("PartyLetPlain", size: 80))
                        .padding(.bottom, -20)
                    Text("Trivia")
                        .font(.custom("PartyLetPlain", size: 72))

                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()

                    Button {

                    } label: {
                        Text("Play")
                            .font(.largeTitle)
                            .padding(.horizontal)
                    }
                    .buttonStyle(.glass)
                    .scaleEffect(playButtonAnimation ? 1.1 : 0.9)
                    .onAppear {
                        withAnimation(
                            .easeInOut(duration: 1.6).repeatForever()
                        ) {
                            playButtonAnimation.toggle()
                        }
                    }
                    .transition(.offset(y: geo.size.height / 4))

                    Spacer()
                }
                .padding(.top, 72)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
        .onAppear {
            //            playBackgroundMusic()
        }
    }

    private func playBackgroundMusic() {
        let sound = Bundle.main.path(
            forResource: "magic-in-the-air",
            ofType: "mp3"
        )
        player = try! AVAudioPlayer(contentsOf: URL(filePath: sound!))
        player.numberOfLoops = -1
        player.play()
    }
}

#Preview {
    ContentView()
}
