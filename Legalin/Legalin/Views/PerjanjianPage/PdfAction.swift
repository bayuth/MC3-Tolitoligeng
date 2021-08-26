//
//  PdfAction.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 06/08/21.
//

import SwiftUI
import UserNotifications

class NotificationManager{
    static let instance = NotificationManager()
    @ObservedObject var perjanjianController: PerjanjianController = .shared
//    @ObservedObject var coreDataVM: CoreDataViewModel = .shared
    
    
    func requestAuthorization(){
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options){ (success, error) in
            if let error = error{
                print("Error: \(error)")
            }
            else{
                print("success")
            }
            
        }
    }
    func notification(){
        let content = UNMutableNotificationContent()
        content.title = perjanjianController.tujuanPeminjaman
        content.subtitle = "BAYAR UTANG OY UDAH TANGGAL \(perjanjianController.tanggalJatuhTempo)"
        content.sound = .default
//        content.badge = 1
        
        var dateComponent = DateComponents()
        dateComponent.hour = 22
        dateComponent.minute = 20
//        dateComponent.day = Int(perjanjianController.tanggalJatuhTempo)
        
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
        
        //notification
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        print("notifikasi jalan")
    }
}

struct PdfAction: View {
    @Environment(\.presentationMode) var masterPresentationMode8
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var perjanjianController: PerjanjianController = .shared
    @ObservedObject var coreDataVM: CoreDataViewModel = .shared
    @State var pinjaman : Pinjaman
//    @State var alertIsPresented = false
    var hideSwitch: Bool = false
    
    @State private var showShareSheet: Bool = false
    var body: some View {
        
        VStack{
            
            NavigationLink(
                destination: GeneratePDF(),
                label: {
                    VStack{
                        Image("pdf")
                            .padding(.bottom, 24)
                        
                        Text("Surat perjanjian hutang - Modal proyek katering - 25/07/2021")
                            .font(.headline)
                            .foregroundColor(Color("textColor"))
                            .multilineTextAlignment(.center)
                    }
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: 228, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal, 24)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color("tabBarColor"))
                    )
                })
            
            Text("Surat perjanjian hutang anda telah dibuat. Anda dapat mencetak atau menandatanganinya secara digital dengan PrivyID")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(.vertical, 32)
                .padding(.horizontal, 32)
            
            Button(action:{
                shareAction()
            }){
                HStack{
                    Image(systemName: "square.and.arrow.up")
                        .font(.title2)
                        .foregroundColor(Color("tabBarColor"))
                    Text("Bagikan atau Cetak")
                        .foregroundColor(Color("tabBarColor"))
                }
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color("tabBarColor"))
                )
                
            }
            
            if hideSwitch == true{
                Spacer()
                Button(action: {
                    masterPresentationMode8.wrappedValue.dismiss()
                    print("cobaaas")
                }, label: {
                    Text("Selesai")
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .foregroundColor(.white)
                    
                })
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color("tabBarColor"))
                .specCornerRadius(8, corners: .allCorners)
                .padding()
                .padding(.bottom,30)
                
            }
            else{
                List{
                    HStack{
                        Text("Tanda Tangan")
                        Spacer()
                        if pinjaman.status == "notSigned"{
                            SignBtn(pinjaman: pinjaman)
                        }
                        else{
                            SignBtn(pinjaman: pinjaman)
                                .disabled(true)
                        }
                    }
                    if pinjaman.status == "onGoing"{
                        Toggle(isOn: $pinjaman.reminder, label: {
                            Text("Pengingat")
                        })
                        .toggleStyle(SwitchToggleStyle(tint: Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1))))
                        .onChange(of: pinjaman.reminder, perform: { value in
                            if value{
                                NotificationManager.instance.notification()
                                coreDataVM.updatePinjaman(pinjaman: pinjaman, reminder: value)
                                print(value)
                                
                            }
                            else{
                                coreDataVM.updatePinjaman(pinjaman: pinjaman, reminder: value)
                                print(value)
                            }
                            
                        })
                    }
                    else{
                        Toggle(isOn: .constant(false), label: {
                            Text("Pengingat")
                        })
                        .toggleStyle(SwitchToggleStyle(tint: Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1))))
                    }
                    
                }
                .padding(.top, 76)
            }
            
            
        }
        .padding()
    }
    
    private func shareAction(){
        showShareSheet.toggle()
        
        let url = URL(string: "https://apple.com")
        let av = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
    }
}

struct SignBtn: View{
    @State var alertIsPresented = false
    @State var isSigned = false
    @ObservedObject var coreDataVM: CoreDataViewModel = .shared
    @State var pinjaman : Pinjaman
    var body: some View{
        Button(action: {
            self.alertIsPresented = true
        }, label: {
            if pinjaman.status == "onGoing"{
                HStack{
                    Text("Sudah")
                        .foregroundColor(Color("tabBarColor"))
                    Image(systemName: "checkmark")
                        .foregroundColor(Color("tabBarColor"))
                }
            }
            else{
                Text("Belum")
                    .foregroundColor(Color("tabBarColor"))
            }
            
        })
        .alert(isPresented: $alertIsPresented, content: {
            Alert(title: Text("Surat Perjanjian Sudah di Tanda Tangan"), message: Text("Surat sudah ditanda tangan kedua belah pihak diatas materai?"), primaryButton: .default(Text("Sudah"),
                                                                                                                                                                                action: {
                                                                                                                                                                                    pinjaman.status = "onGoing"
                                                                                                                                                                                }), secondaryButton: .cancel(Text("Belum")))
        })
    }
}


//struct PdfAction_Previews: PreviewProvider {
//    static var previews: some View {
//        PdfAction(hideSwitch: false)
//    }
//}
