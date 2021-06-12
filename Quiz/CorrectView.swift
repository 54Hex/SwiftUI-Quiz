//
//  CorrectView.swift
//  Quiz
//
//  Created by Conqueriings on 5/6/21.
//

import SwiftUI

struct CorrectView: View {
    
    var end: Bool
    
    var body: some View {
        Image("end")
            .resizable()
            .aspectRatio(contentMode: .fit)
            
        Text("Quiz completed").font(Font.system(size: 30))
            .padding()
    }
}

struct CorrectView_Previews: PreviewProvider {
    static var previews: some View {
        CorrectView(end: true)
        CorrectView(end: false)
    }
}
