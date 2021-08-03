//
//  pinjamanCellStateController.swift
//  Legalin
//
//  Created by Jason Hartanto on 03/08/21.
//

import SwiftUI

class selectedController: ObservableObject {
    
    @Published var selected: Bool!
    @Published var selected2: Bool!
    
    init(){
        selected = false
        selected2 = false
    }
    
    func setSelectedState(sender: String){
        
        if (sender == "selected"){
            if ((selected == false) && (selected2 == false)){
                selected = !selected
            } else {
                if (selected == false){
                selected = !selected
                selected2 = !selected2
                }
            }
        } else if (sender == "selected2"){
            if ((selected == false) && (selected2 == false)){
                selected2 = !selected2
            } else {
                if (selected2 == false){
                selected = !selected
                selected2 = !selected2
                }
            }
        }
    }
    
}
