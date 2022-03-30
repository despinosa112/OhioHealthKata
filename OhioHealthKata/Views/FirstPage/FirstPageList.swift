//
//  FirstPageList.swift
//  OhioHealthKata
//
//  Created by Daniel Espinosa on 3/26/22.
//

import SwiftUI

struct FirstPageList: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack {
            ForEach(modelData.contentItems){ contentItem in
                FirstPageRow(contentItem: contentItem)
            }
        }
    }
}

struct FirstPageList_Previews: PreviewProvider {
    static var previews: some View {
        FirstPageList()
            .environmentObject(ModelData())
    }
}
