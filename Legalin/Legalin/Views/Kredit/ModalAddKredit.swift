//
//  ModalAddKredit.swift
//  Legalin
//
//  Created by Achmad Fathullah on 06/08/21.
//

import SwiftUI



struct ModalAddKredit: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            
            ScrollView {
                Text("Don't use .appearence()!")
            }
            .navigationBarTitle("Try It!", displayMode: .inline)
            .navigationBarItems(leading:
                                    Button("Tutup", action: {
                                        presentationMode.wrappedValue.dismiss()
                                    })
                                    .foregroundColor(.blue)
                                    .font(.system(size: 17))
            )
            .background(NavigationConfigurator { nc in
                nc.navigationBar.barTintColor = .blue
                nc.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.blue]
            })
        }.navigationBarColor(.green)
        
        
        
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

