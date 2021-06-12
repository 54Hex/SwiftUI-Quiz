//
//  ScoreView.swift
//  Quiz
//
//  Created by Conqueriings on 5/6/21.
//

import SwiftUI

struct ScoreView: View {
    
    var score: Int
    var totalQuestions: Int
    
    var body: some View {
        VStack{
            Text("Score:").font(Font.system(size: 30))
            Text("\(score)/\(totalQuestions)").font(Font.system(size: 30))
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: 4, totalQuestions: 4)
    }
}
