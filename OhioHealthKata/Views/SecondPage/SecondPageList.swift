//
//  SecondPageList.swift
//  OhioHealthKata
//
//  Created by Daniel Espinosa on 3/27/22.
//

import SwiftUI

struct SecondPageList: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack {
            ForEach(modelData.contentItems){ contentItem in
                SecondPageRow(contentItem: contentItem)
            }
        }
    }
}

struct SecondPageList_Previews: PreviewProvider {
    static var previews: some View {
        SecondPageList()
            .environmentObject(ModelData())

    }
}
