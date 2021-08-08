//
//  ListKredit.swift
//  Legalin
//
//  Created by Achmad Fathullah on 05/08/21.
//

import SwiftUI

class ListKreditVM: ObservableObject {
    @Published var object = ItemListKredit()
    @Published var list = [
        ItemListKredit(kreditTitle: "Nikah istri 1", tenor: "24", bunga: "6 %", jumlahPinjaman: "Rp. 12000000", cicilanPerbulan: "Rp 2500000", offset: 0, isSwiped: false),
        ItemListKredit(kreditTitle: "Nikah istri 2", tenor: "24", bunga: "6 %", jumlahPinjaman: "Rp. 12000000", cicilanPerbulan: "Rp 2500000", offset: 0, isSwiped: false),
        ItemListKredit(kreditTitle: "Nikah istri 3", tenor: "24", bunga: "6 %", jumlahPinjaman: "Rp. 12000000", cicilanPerbulan: "Rp 2500000", offset: 0, isSwiped: false),
        ItemListKredit(kreditTitle: "Nikah istri 4", tenor: "24", bunga: "6 %", jumlahPinjaman: "Rp. 12000000", cicilanPerbulan: "Rp 2500000", offset: 0, isSwiped: false),
    ]
}
