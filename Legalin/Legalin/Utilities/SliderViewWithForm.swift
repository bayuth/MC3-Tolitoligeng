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
    
    @ObservedObject var perjanjianController: PerjanjianController = .shared
    
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
            Text(title).font(.footnote).fontWeight(.light).padding(.horizontal)
            VStack{
                if type == 0 {
                    TFCurrencyField(urlString: $formattedText, onEndEditing: {
                        textChanged(to: formattedText.digits)
                    }, placeHolderText: title)
                    .padding(.horizontal)
                }else{
                    DoneKeyboard(text: $formattedText, hint: title, keyType: UIKeyboardType.numberPad, onEndEditing: {
                        textChanged(to: formattedText.digits)
                    }, clearOnStartEdit: true)
                    .keyboardType(.numberPad)
                    .padding(.horizontal)
                    .onTapGesture {}
                    .onLongPressGesture(
                        pressing: { isPressed in if isPressed { self.endEditing() } },
                        perform: {})
                }
                
                Divider()
                Slider(
                    value: Binding(
                        get: {
                            self.sliderValue
                        },
                        set: {(newValue) in
                            self.sliderValue = newValue
                            self.getFormattedText()
                        }),
                    in: rangeOfSlider,
                    step: valueMaxSlide
                ).padding(.bottom, 11).accentColor(Color("tabBarColor"))
                .padding(.horizontal)
                .onChange(of: self.sliderValue, perform: { value in
                    getFormattedText()
                })
                HStack{
                    Text(text1)
                        .foregroundColor(Color("labelColor"))
                        .font(.caption)
                    Spacer()
                    Text(text2)
                        .foregroundColor(Color("monthAndPriceColorStep3"))
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
                .padding(.horizontal)
                Divider()
            }.background(Color("emptyAlertColor").opacity(getRedIndicator() ? 0.15 : 0.0))
            
        }.padding(.bottom,10)
        .onAppear{
            getFormattedText()
        }
    }
    
    func getRedIndicator() -> Bool{
        if (title != "Bunga"){
            if ((sliderValue == 0) && (perjanjianController.endButtonPressed == true)){
                return true
            } else{
                return false
            }
        } else {
            return false
        }
        
    }
    
    func textChanged(to value: String) {
        let valueString = Double(value) ?? 0.0
        switch valueString {
        case rangeOfSlider:
            sliderValue = valueString
        default:
            sliderValue = rangeOfSlider.upperBound
        }
        getFormattedText()
    }
    
    func getFormattedText() {
        let resultRupiah = sliderValue.toRupiahString()
        
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
