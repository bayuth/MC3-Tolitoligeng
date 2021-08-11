//
//  SliderViewWithForm.swift
//  Legalin
//
//  Created by Achmad Fathullah on 08/08/21.
//

import SwiftUI

struct SliderViewWithForm: View {
    @Binding var sliderValue: Double
    @State private var isEditing = false
    @State var text1 = "halo"
    @State var text2 = "halo lagi"
    @State var title = "kamu"
    @State var type: Int
    @State private var formattedText = ""
    @State private var rangeOfSlider = 0...50000000.0
    var valueMaxSlide: Double {
        if type == 0 {
            return 1000000.0
        }else if type == 1 {
            return 0.05
        }else {
            return 1.0
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title).font(.footnote).fontWeight(.light)
            TextField(title, text: $formattedText, onEditingChanged: { (isBegin) in
                if isBegin {
                    formattedText = ""
                } else {
                    textChanged(to: formattedText)
                }
            }
            ).keyboardType(.numberPad)
            Divider()
            Slider(
                value: $sliderValue,
                in: rangeOfSlider,
                step: valueMaxSlide,
                onEditingChanged: { editing in
                    isEditing = editing
                    getFormattedText()
                }
            ).padding(.bottom, 11).accentColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
			.padding(.horizontal,10)
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
		}.padding(.bottom,15)
        .onAppear{
            getFormattedText()
        }
        
    }
    
    func textChanged(to value: String) {
        let valueString = Double(value)
        sliderValue = valueString ?? 0.0
        getFormattedText()
    }
    
    func getFormattedText() {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "id_ID")
        let resultRupiah = formatter.string(from: NSNumber(value: sliderValue))!
        if type == 0 {
            rangeOfSlider = 0...50000000.0
            formattedText = resultRupiah
        }else if type == 1 {
            rangeOfSlider = 0...6.0
            formattedText = "\(String(format:"%.2f", sliderValue)) %"
        }else{
            rangeOfSlider = 0...24.0
            formattedText = "\(Int(sliderValue)) bulan"
        }
    }
}

//struct SliderViewWithForm_Previews: PreviewProvider {
//    static var previews: some View {
//        SliderViewWithForm()
//    }
//}
