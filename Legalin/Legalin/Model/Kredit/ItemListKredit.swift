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
    var tenor : String = ""
    var bunga : String = ""
    var jumlahPinjaman : String = ""
    var cicilanPerbulan : String = ""
    var offset: CGFloat = 0.0
    var isSwiped : Bool = false
    

}
