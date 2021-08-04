//
//  KreditView.swift
//  Legalin
//
//  Created by Achmad Fathullah on 02/08/21.
//

import SwiftUI

struct KreditView: View {
    var bayu = 1
    
    var body: some View {
        if bayu == 0 {
            EmptyState()
        }else{
            Text("yoo")
        }
    }
}

struct KreditView_Previews: PreviewProvider {
    static var previews: some View {
        KreditView()
    }
}
