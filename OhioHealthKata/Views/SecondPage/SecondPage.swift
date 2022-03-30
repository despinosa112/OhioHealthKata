//
//  SecondPage.swift
//  OhioHealthKata
//
//  Created by Daniel Espinosa on 3/28/22.
//

import SwiftUI

struct SecondPage: View {

    var body: some View {
        ScrollView{
            VStack {
                SecondPageList()
                RetrieveButton()
                Spacer()
            }
            .navigationTitle("Second Page")
        }
    }
}

struct SecondPage_Previews: PreviewProvider {
    static var previews: some View {
        SecondPage()
    }
}
