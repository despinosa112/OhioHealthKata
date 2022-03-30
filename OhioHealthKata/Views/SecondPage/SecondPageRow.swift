//
//  SecondPageRow.swift
//  OhioHealthKata
//
//  Created by Daniel Espinosa on 3/27/22.
//

import SwiftUI
import AVFoundation

struct SecondPageRow: View {

    @State private var isRecording = false
    @EnvironmentObject var modelData: ModelData
    
    var contentItem: ContentItem

    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text(contentItem.title)
                        .font(.title3)
                    Spacer()
                }
                HStack {
                    Text(modelData.dataValues[contentItem.id] ?? "")
                        .frame(width: 200, height: 50, alignment: .leading)
                        .font(.title3)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.black, lineWidth: 2)
                        )
                    Spacer()
                    Button("Translate") {
                        let utterance = AVSpeechUtterance(string: modelData.dataValues[contentItem.id] ?? "")
                        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                        utterance.rate = 0.1

                        let synthesizer = AVSpeechSynthesizer()
                        synthesizer.speak(utterance)
                    }
                    .frame(width: 130, height: 50)
                    .foregroundColor(Color.white)
                    .font(.title3)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(5)
                    
                }
            }
            .frame(height: 70, alignment: .leading)
            .padding(4)
        }
        .frame(height: 100)
    }
}

struct SecondPageRow_Previews: PreviewProvider {
    static var contentItem = ModelData().contentItems[0]
    static var previews: some View {
        SecondPageRow(contentItem: contentItem)
    }
}
