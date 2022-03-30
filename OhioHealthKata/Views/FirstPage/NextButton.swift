//
//  NextButton.swift
//  OhioHealthKata
//
//  Created by Daniel Espinosa on 3/30/22.
//

import SwiftUI

struct NextButton: View {
    
    @Environment(\.managedObjectContext) var moc
    @EnvironmentObject var modelData: ModelData
    @FetchRequest(sortDescriptors: []) var dataItems: FetchedResults<DataItem>
    
    
    var body: some View {
        
        
        NavigationLink(destination: {
            SecondPage()
        }, label: {
            Text("Next")
        }).simultaneousGesture(TapGesture().onEnded{
            //Delete CoreData Items
            dataItems.forEach { dataItem in
                do {
                    try moc.delete(dataItem)
                    print("Deleted Item")

                } catch {
                    print("FAILURE")
                }
            }
            
            //Save New Items
            let newDataItems = Converter.returnDataItems(dataValues: modelData.dataValues, context: moc)
            
            newDataItems.forEach { dataItem in
                do {
                    try moc.save()
                    print("SUCCESS")
                } catch {
                    print("FAILURE")
                }
            }
            modelData.dataValues = [Int: String]()
            
        })
        .frame(width: 350, height: 50)
        .foregroundColor(Color.white)
        .font(.title3)
        .background(Color.blue)
        .cornerRadius(10)
        .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
    }
}

struct NextButton_Previews: PreviewProvider {
    static var previews: some View {
        NextButton()
            .environmentObject(ModelData())

    }
}
