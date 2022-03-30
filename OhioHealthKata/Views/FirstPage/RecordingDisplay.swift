//
//  RecordingDisplay.swift
//  OhioHealthKata
//
//  Created by Daniel Espinosa on 3/27/22.
//

import SwiftUI

struct RecordingDisplay: View {
    
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        if (modelData.isRecording) {
            HStack {
                Spacer()
                Image(systemName: "mic")
                    .font(.subheadline)
                Text("You are Recording")
                    .padding(5)
                Spacer()

            }
            .background(Color.blue)
        }
    }
}

struct RecordingDisplay_Previews: PreviewProvider {
    static var previews: some View {
        RecordingDisplay()
            .environmentObject(ModelData())
    }
}
