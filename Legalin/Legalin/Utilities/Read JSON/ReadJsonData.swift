//
//  ReadJsonData.swift
//  Legalin
//
//  Created by Jason Hartanto on 02/08/21.
//

import Foundation

class ReadData: ObservableObject{
    
    @Published var regionData = [RegionData]()

    init(){
        loadData()
    }

    func loadData()  {
        guard let url = Bundle.main.url(forResource: "regions", withExtension: "json")
            else {
                print("Json file not found")
                return
            }

        let data = try? Data(contentsOf: url)
        let regionDatas = try? JSONDecoder().decode([RegionData].self, from: data!)
        self.regionData = regionDatas!

    }
    
    
//    func readLocalJSONFile(forName name: String) -> Data? {
//        do {
//            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
//                let fileUrl = URL(fileURLWithPath: filePath)
//                let data = try Data(contentsOf: fileUrl)
//                return data
//            }
//        } catch {
//            print("error: \(error)")
//        }
//        return nil
//    }
//
//    func parse(jsonData: Data) -> [RegionData]? {
//        do {
//            let decodedData = try JSONDecoder().decode([RegionData].self, from: jsonData)
//            return decodedData
//        } catch {
//            print("error: \(error)")
//        }
//        return nil
//    }
     
}
