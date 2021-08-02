//
//  TestCoreDataView.swift
//  Legalin
//
//  Created by Jason Hartanto on 30/07/21.
//

import SwiftUI

struct TestCoreDataView: View {
    
    @StateObject var vm = CoreDataViewModel()
    @State var username: String = ""
    
    var body: some View {
        VStack(spacing: 20){
            
            Text("Core data: \(getInitText(pihak1: vm.pihak1))")
//            Text("\(vm.pihak1[0].ktp?.nama ?? "no name found")")
            
            VStack(alignment: .center) {
                        TextField("Enter username...", text: $username)
                        Text("Your username: \(username)")
                    }.padding()
            
            
            Button(action: {
                
                if (vm.pihak1 == []){
                    vm.updateAkun(akun: vm.createPihak1(pinjamanPage: false)!, nama: username)
                } else {
                    vm.updateAkun(akun: vm.pihak1[0], nama: username)
                }
                
            }, label: {
                Text("\(getButtonText(pihak1: vm.pihak1))")
            })
        
        }
        
        
    }
}

func getInitText(pihak1:[Akun]) -> String{
    if (pihak1.count == 0) {
        return "No Profile found"
    } else{
        return pihak1[0].ktp?.nama ?? "Name is empty"
    }
}

func getButtonText(pihak1:[Akun]) -> String{
    if (pihak1.count == 0) {
        return "Create profile and update name"
    } else{
        return "Update profile name"
    }
}

struct TestCoreDataView_Previews: PreviewProvider {
    static var previews: some View {
        TestCoreDataView()
    }
}
