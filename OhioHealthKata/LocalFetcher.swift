//
//  LocalFetcher.swift
//  OhioHealthKata
//
//  Created by Daniel Espinosa on 3/29/22.
//

import Foundation

class LocalFetcher: NSObject {
    
    static func fetchLocalData<T: Decodable>(model: T.Type, filename: String) -> [T]? {
        if let filePath = Bundle.main.path(forResource: filename, ofType: "json"),
           let fileContent = try? Data(contentsOf: URL(fileURLWithPath: filePath)) {
            let decoder = JSONDecoder()
            do {
                let modelArray = try decoder.decode([T].self, from: fileContent)
                return modelArray
            } catch {
                print(error.localizedDescription)
                return nil
            }
        }
        return nil
    }
    
}
