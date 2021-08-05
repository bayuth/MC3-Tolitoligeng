//
//  ListKredit.swift
//  Legalin
//
//  Created by Achmad Fathullah on 05/08/21.
//

import SwiftUI

struct ItemListKredit : Identifiable{
    
    var id = UUID().uuidString
    var kreditTitle : String
    var tenor : Int
    var bunga : Double
    var jumlahPinjaman : Double
    var cicilanPerbulan : Double
    var offset: CGFloat
    var isSwiped : Bool
    

}
