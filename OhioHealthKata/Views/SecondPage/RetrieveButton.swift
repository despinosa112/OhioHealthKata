//
//  RetrieveButton.swift
//  OhioHealthKata
//
//  Created by Daniel Espinosa on 3/30/22.
//

import SwiftUI

struct RetrieveButton: View {
    
    @EnvironmentObject var modelData: ModelData
    @FetchRequest(sortDescriptors: []) var dataItems: FetchedResults<DataItem>
    
    var body: some View {
        Button ("Retrieve"){
            //Retrieve Data from CoreData
            var dataValues: [Int: String] = [Int: String]()
            dataItems.forEach { dataItem in
                dataValues[Int(dataItem.id)] = dataItem.value
            }
            modelData.dataValues = dataValues
        }
        .frame(width: 350, height: 50)
        .foregroundColor(Color.white)
        .font(.title3)
        .background(Color.blue)
        .cornerRadius(10)
        .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0 ))
    }
}

struct RetrieveButton_Previews: PreviewProvider {
    static var previews: some View {
        RetrieveButton()
            .environmentObject(ModelData())
    }
}
