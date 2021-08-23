//
//  PerjanjianModel.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 02/08/21.
//

import SwiftUI

struct Agreements : Identifiable{
    
    var id = UUID().uuidString
    var agreementTitle : String
    var amountOfLoan : String
    var Date : String
    var lenderName : String
    var signStatus : Bool
    var offset: CGFloat
    var isSwiped : Bool
//    var pinjaman: Pinjaman

}

