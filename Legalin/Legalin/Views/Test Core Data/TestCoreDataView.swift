//
//  TestCoreDataView.swift
//  Legalin
//
//  Created by Jason Hartanto on 30/07/21.
//

import SwiftUI

struct TestCoreDataView: View {
    
    @StateObject var vm = CoreDataViewModel()
    
    var body: some View {
        VStack(spacing: 20){
            
            Button(action: {
                print(vm.getPihak1().count)
            }, label: {
                Text("Show Pihak 1")
            })
            
            Button(action: {
                
               var x =  vm.createPihak1(pinjamanPage: false)
                print(x.uuid)
//                vm.manager.context.delete(vm.getPihak1())
                
//                vm.createKredit()
//                print(vm.createKredit().uuid)
//                print(vm.getAllKredit().count)
//
//                for item in vm.getAllKredit() {
//                    vm.deleteKredit(kredit: item)
//                }
//
//                print(vm.getAllKredit().count)
                
//                print(vm.tesGetAllPinjaman().uuid)
//                if var tempPerjanjian = vm.getAllPinjaman() as? [Pinjaman]{
//
//                    for pinjaman in tempPerjanjian{
//
//                        vm.deletePinjaman(pinjaman: pinjaman)
//
////                        print(i)
////                        i=i+1
////                        print(pinjaman.uuid)
////                        print(pinjaman.pihak1?.uuid)
////                        print(pinjaman.pihak2?.uuid)
////                        print(pinjaman.agunan?.uuid)
////                        print(pinjaman.kredit?.uuid)
//                    }
//                }
            }, label: {
                Text("Show Perjanjian")
            })
        }
        
        
    }
}

struct TestCoreDataView_Previews: PreviewProvider {
    static var previews: some View {
        TestCoreDataView()
    }
}
