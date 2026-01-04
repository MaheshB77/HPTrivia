//
//  Instructions.swift
//  HPTrivia
//
//  Created by Mahesh Bansode on 04/01/26.
//

import SwiftUI

struct Instructions: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                Image(.appiconwithradius)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                
                ScrollView {
                    Text("How to play")
                        .font(.largeTitle)
                        .padding(.bottom, 4)
                        .fontWeight(.bold)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Welcome to HP Trivia! In this game you will be asked random questions from the HP books and you must guess the right answer or you will lose points!😱")
                        Text("Each question is worth 5 points, but if you guess a wrong answer, you lose 1 point.")
                        
                        Text("If you are struggling with a question, there is an option to reveal a hint or reveal the book that answers the question. But beware! Using these also removes 1 point each.")
                        
                        Text("When you select the correct answer, you will be awarded all the points left for that question and they will be added to your total score.")
                    }
                    .padding(.horizontal)
                    .font(.title3)
                    
                    Text("Good Luck!")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                .foregroundStyle(.black)
                
                Button("Done") {
                    dismiss()
                }
                .font(.title)
                .padding()
                .buttonStyle(.glass)
            }
        }
    }
}

#Preview {
    Instructions()
}
