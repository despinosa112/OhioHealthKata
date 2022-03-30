//
//  ContentView.swift
//  OhioHealthKata
//
//  Created by Daniel Espinosa on 3/26/22.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @EnvironmentObject var modelData: ModelData
    @Environment(\.managedObjectContext) var moc
    
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack {
                    FirstPage()
                    Spacer()
                }
                .navigationTitle("First Page")
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())

    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var contentItems = ModelData().contentItems

    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())

    }
}
