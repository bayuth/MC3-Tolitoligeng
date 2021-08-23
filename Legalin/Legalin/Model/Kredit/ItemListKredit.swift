//
//  ListKredit.swift
//  Legalin
//
//  Created by Achmad Fathullah on 05/08/21.
//

import SwiftUI

struct ItemListKredit : Identifiable{
    
    var id = UUID().uuidString
    var kreditTitle : String = ""
    var tenor : Double = 0.0
    var bunga : Double = 0.0
    var jumlahPinjaman : Double = 0.0
    var cicilanPerbulan : Double = 0.0
    var offset: CGFloat = 0.0
    var isSwiped : Bool = false
    

}
