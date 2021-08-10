//
//  pengadilanNegeriDetailViewController.swift
//  Legalin
//
//  Created by Jason Hartanto on 03/08/21.
//

import SwiftUI

class PengadilanDetailController: ObservableObject {
    
    @Published var listSelected:[Bool] = []
    @Published var lastSelected:Int = -999
    @Published var listCount:Int!
    @Published var selectedPengadilan:String!
    
    init(){
        selectedPengadilan = ""
    }
    
    func setListSelected(total: Int){

        listCount = total
        
        for _ in 0...listCount{
            listSelected.append(false)
        }
    }
    
    func toggleView(index: Int){
        
        if (listSelected[index] == false){
            listSelected[index] = true
        }
        
        if (lastSelected != -999) && (lastSelected != index) {
            listSelected[lastSelected] = false
        }
        
        lastSelected = index
    }
    
    func setSelectedPengadilan(selected: String){
        selectedPengadilan = selected
    }
    
}
