//
//  ModelData.swift
//  OhioHealthKata
//
//  Created by Daniel Espinosa on 3/27/22.
//

import Foundation

final class ModelData: ObservableObject {
    
    @Published var isRecording = false
        
    @Published var contentItems: [ContentItem] = LocalFetcher.fetchLocalData(model: ContentItem.self, filename: "ContentItems") ?? [ContentItem]()
    
    @Published var dataValues: [Int: String] = [Int: String]()
    
    
    
}
