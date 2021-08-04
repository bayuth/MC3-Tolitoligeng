//
//  RegionDataModel.swift
//  Legalin
//
//  Created by Jason Hartanto on 02/08/21.
//

import Foundation

struct RegionData: Codable{
    
    //property
    var provinsi: String
    var kota:[String]
    
    //enum
    enum CodingKeys: String, CodingKey{
        case provinsi = "provinsi"
        case kota = "kota"
    }
}
