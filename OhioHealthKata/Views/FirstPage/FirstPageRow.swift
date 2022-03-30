//
//  FirstPageRowView.swift
//  OhioHealthKata
//
//  Created by Daniel Espinosa on 3/26/22.
//

import SwiftUI
import AVFoundation

struct FirstPageRow: View {
    
    @State private var val: String = ""
    @State private var rowIsRecording = false
    @StateObject var speechRecognizer = SpeechRecognizer()
    
    @EnvironmentObject var modelData: ModelData

    var contentItem: ContentItem
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text(contentItem.title)
                        .font(.title3)
                        //.background(Color.red)
                    Spacer()
                }
                TextField(
                    " Type or Talk",
                    text: $val
                )
                    .onChange(of: val, perform: { newValue in
                        modelData.dataValues[contentItem.id] = newValue
                    })
                    .frame(height: 50)
                    .font(.title3)
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.black, lineWidth: 2)
                    )
            }
            .frame(height: 70, alignment: .leading)
            .padding(4)

            VStack {
                Spacer()
                Button(rowIsRecording ? "Done" : "Voice") {
                    if (modelData.isRecording) {
                        speechRecognizer.stopTranscribing()
                        val = speechRecognizer.transcript
                    } else {
                        speechRecognizer.reset()
                        speechRecognizer.transcribe()
                    }
                    rowIsRecording.toggle()
                    modelData.isRecording.toggle()
                }
                .frame(width: 130, height: 50)
                .foregroundColor(Color.white)
                .font(.title3)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(5)
            }


        }
        .frame(height: 100)
    }
}

struct FirstPageRow_Previews: PreviewProvider {
    static var contentItems = ModelData().contentItems
    static var previews: some View {
        FirstPageRow(contentItem: contentItems[0])
            .environmentObject(ModelData())
    }
}
