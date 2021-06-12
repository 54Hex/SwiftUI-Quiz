//
//  ContentView.swift
//  Quiz
//
//  Created by Conqueriings on 5/6/21.
//

import SwiftUI

struct ContentView: View {
    var questions = [Question(title: "What day is it?",
                              option1: "Monday",
                              option2: "Saturday",
                              option3: "Wednesday",
                              option4: "Friday"),
                     Question(title: "What framework are we using?",
                              option1: "UIKit",
                              option2: "SwiftUI",
                              option3: "React Native",
                              option4: "Flutter"),
                     Question(title: "Which company created Swift?",
                              option1: "Orange",
                              option2: "Apple",
                              option3: "Google",
                              option4: "Tinkercademy"),
                     Question(title: "What is our Q&N Platform?",
                              option1: "#text-questions",
                              option2: "Ed",
                              option3: "Yelling on webex",
                              option4: "Screaming into the void")
    ]
    
    
    
    @State var currentQuestion = 0
    @State var isAlertPresented = false
    @State var isCorrect = false
    @State var correctAnswers = 0
    @State var isModalPresented = false
    @State var isModalPresented2 = false
    @State var modalCorrect = true
    
    
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            //vertical stack for title
            VStack{
                Text(questions[currentQuestion].title)
                    .padding()
                    .font(.system(size: 30, design: .default))
                // embed horizontal stack
                HStack{
                    ZStack {
                        VStack(alignment: .center){
                            Button(questions[currentQuestion].option1){
                                didTapOption(optionNumber: 1)
                            }
                            .padding()
                            .font(.system(size: 30, design: .default))
                            .overlay(
                                RoundedRectangle(cornerRadius:2).stroke(Color.red, lineWidth:5))
                            .background(Color.red)
                            .accentColor(.white)
                            
                            Button(questions[currentQuestion].option2){
                                didTapOption(optionNumber: 2)
                            }
                            .padding()
                            .font(.system(size: 30, design: .default))
                            .cornerRadius(5)
                            .overlay(
                                RoundedRectangle(cornerRadius:2).stroke(Color.orange, lineWidth:5))
                            .background(Color.orange)
                            .accentColor(.white)
                            
                        }
                        .padding(.vertical)
                    }
                    // second vstak question
                    ZStack {
                        VStack{
                            Button(questions[currentQuestion].option3){
                                didTapOption(optionNumber: 3)
                            }
                            .padding()
                            .font(.system(size: 30, design: .default))
                            .cornerRadius(5)
                            .overlay(
                                RoundedRectangle(cornerRadius:2).stroke(Color.blue, lineWidth:5))
                            .background(Color.blue)
                            .accentColor(.white)
                        
                            Button(questions[currentQuestion].option4){
                                didTapOption(optionNumber: 4)
                            }
                            .padding()
                            .font(.system(size: 30, design: .default))
                            .cornerRadius(5)
                            .overlay(
                                RoundedRectangle(cornerRadius:2).stroke(Color.gray, lineWidth:5))
                            .background(Color.green)
                            .accentColor(.white)
                        }
                        .padding()
                        
                    }
                    
                }
                .padding()
            }
            .alert(isPresented: $isAlertPresented, content: {
                Alert(title: Text(isCorrect ? "Correct" : "Wrong"), message: Text(isCorrect ? "Congrats, you are kinda smart." : "This is outrageous, with such easy questions, how can you be getting this wrong?!") , dismissButton: .default(Text("Ok")) {
                    currentQuestion += 1
                    
                    if currentQuestion == questions.count {
                        isModalPresented = true
                        currentQuestion = 0
                    }
                    
                })
                    
            })
            .sheet(isPresented: $isModalPresented, onDismiss: {
                correctAnswers = correctAnswers
            }, content: {
                CorrectView(end: modalCorrect)
                ScoreView(score: correctAnswers, totalQuestions: questions.count)
        })
            
        }
            
    }

    
    func didTapOption(optionNumber: Int){
        if optionNumber == 2 {
            print("Correct!")
            isCorrect = true
            correctAnswers += 1
        } else {
            print("Wrong!")
            isCorrect = false
        }
        isAlertPresented = true
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
