//
//  ListKredit.swift
//  Legalin
//
//  Created by Achmad Fathullah on 05/08/21.
//

import SwiftUI

class ListKreditVM: ObservableObject {
    
    @Published var list = [
        ItemListKredit(kreditTitle: "Nikah istri 1", tenor: 24, bunga: 0.06, jumlahPinjaman: 12000000, cicilanPerbulan: 2500000, offset: 0, isSwiped: false),
        ItemListKredit(kreditTitle: "Nikah istri 2", tenor: 12, bunga: 0.06, jumlahPinjaman: 12000000, cicilanPerbulan: 2500000, offset: 0, isSwiped: false),
        ItemListKredit(kreditTitle: "Nikah istri 3", tenor: 6, bunga: 0.06, jumlahPinjaman: 12000000, cicilanPerbulan: 2500000, offset: 0, isSwiped: false),
        ItemListKredit(kreditTitle: "Nikah istri 4", tenor: 3, bunga: 0.06, jumlahPinjaman: 12000000, cicilanPerbulan: 2500000, offset: 0, isSwiped: false),
    ]
}
