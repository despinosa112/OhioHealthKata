//
//  FirstPage.swift
//  OhioHealthKata
//
//  Created by Daniel Espinosa on 3/27/22.
//

import SwiftUI

struct FirstPage: View {
    
    var body: some View {
        VStack {
            RecordingDisplay()
                .background(Color.pink)
                .padding(EdgeInsets(top: 1, leading: 0, bottom: 0, trailing: 0))
            FirstPageList()
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            NextButton()
            Spacer()
        }
    }
}

struct FirstPage_Previews: PreviewProvider {
    static var previews: some View {
        FirstPage()
    }
}
