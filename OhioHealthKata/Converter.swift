//
//  Converter.swift
//  OhioHealthKata
//
//  Created by Daniel Espinosa on 3/29/22.
//

import Foundation
import CoreData

class Converter: ObservableObject {
    
    static func returnDataItems(dataValues: [Int: String], context: NSManagedObjectContext) -> [DataItem] {
        var dataItems: [DataItem] = [DataItem]()
        for (key, val) in dataValues {
            let dataItem = DataItem(context: context)
            dataItem.id = Int16(key)
            dataItem.value = val
            dataItems.append(dataItem)
        }
        return dataItems
    }
}
