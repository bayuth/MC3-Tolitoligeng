//
//  ModalAddKredit.swift
//  Legalin
//
//  Created by Achmad Fathullah on 06/08/21.
//

import SwiftUI



struct ModalAddKredit: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var kreditData = ListKreditVM()
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                VStack{
                    FormView(title: "Tujuan Meminjam", profileValue: $kreditData.object.kreditTitle, keyboardNum: false).padding(.horizontal, 16)
                    FormView(title: "Jumlah Pinjaman", profileValue: $kreditData.object.jumlahPinjaman, keyboardNum: false).padding(.horizontal, 16)
                    SliderView(text1: "Pinjaman Maksimal", text2: "Rp. 50.000.000")
                    FormView(title: "Bunga", profileValue: $kreditData.object.jumlahPinjaman, keyboardNum: false).padding(.horizontal, 16)
                    SliderView(text1: "Bunga Maksimal", text2: "6 %")
                    FormView(title: "Tenor", profileValue: $kreditData.object.jumlahPinjaman, keyboardNum: false).padding(.horizontal, 16)
                    SliderView(text1: "Tenor Maksimal Maksimal", text2: "24 Bulan")
                }
                NavigationLink(
                    destination: KreditView(),
                    label: {
                        Text("Simulasikan").font(.body).fontWeight(.bold).foregroundColor(.white).multilineTextAlignment(.center).padding(.vertical,15).padding(.horizontal,120).background(Color(#colorLiteral(red: 0, green: 0.2837583721, blue: 0.423648268, alpha: 1))).cornerRadius(10)
                    }).padding(.top,10)
            }
            .navigationBarTitle("Kredit Baru", displayMode: .inline)
            .navigationBarItems(leading:
                                    Button("Tutup", action: {
                                        presentationMode.wrappedValue.dismiss()
                                    })
                                    .foregroundColor(Color.init(hex: "#E6FFFFFF"))
            )
        }.navigationBarColor(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1))
    }
}

extension UINavigationController{
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationBar.standardAppearance = appearance
    }
}


struct NavigationConfigurator: UIViewControllerRepresentable {
    
    var configure: (UINavigationController) -> Void = { _ in }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
    
}

