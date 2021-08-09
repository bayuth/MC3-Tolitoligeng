//
//  SliderView.swift
//  Legalin
//
//  Created by Achmad Fathullah on 08/08/21.
//

import SwiftUI

struct SliderView: View {
    @State private var speed = 50.0
    @State private var isEditing = false
    @State var text1 = "halo"
    @State var text2 = "halo lagi"
    
    var body: some View {
        VStack {
            Slider(
                value: $speed,
                in: 0...100,
                onEditingChanged: { editing in
                    isEditing = editing
                }
            ).padding(.bottom, 11)
            HStack{
                Text(text1)
                    .foregroundColor(Color.init(hex: "#707070"))
                    .font(.caption)
                Spacer()
                Text(text2)
                    .foregroundColor(Color.init(hex: "#707070"))
                    .font(.caption)
            }
            .frame(
                  minWidth: 0,
                  maxWidth: .infinity,
                  minHeight: 0,
                  maxHeight: 0,
                  alignment: .topLeading
                )
            .padding(.bottom, 10)
            Divider()
        }
        .padding(.horizontal, 16)
        
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
