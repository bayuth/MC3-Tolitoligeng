//
//  PerjanjianViewModel.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 02/08/21.
//

import SwiftUI

class PerjanjianViewModel: ObservableObject {
    
    @Published var list = [
        Agreements(agreementTitle: "Perjanjian 1", amountOfLoan: "Rp. 25.000.000", Date: "25/07/2021", lenderName: "Bambang oke", signStatus: false, offset: 0, isSwiped: false),
        Agreements(agreementTitle: "Perjanjian 2", amountOfLoan: "Rp. 25.000.000", Date: "25/07/2021", lenderName: "Bambang oke", signStatus: false, offset: 0, isSwiped: false),
        Agreements(agreementTitle: "Perjanjian 3", amountOfLoan: "Rp. 25.000.000", Date: "25/07/2021", lenderName: "Bambang oke", signStatus: false, offset: 0, isSwiped: false),
        Agreements(agreementTitle: "Perjanjian 4", amountOfLoan: "Rp. 25.000.000", Date: "25/07/2021", lenderName: "Bambang oke", signStatus: false, offset: 0, isSwiped: false),
        Agreements(agreementTitle: "Perjanjian 5", amountOfLoan: "Rp. 25.000.000", Date: "25/07/2021", lenderName: "Bambang oke", signStatus: false, offset: 0, isSwiped: false),
    ]
}
