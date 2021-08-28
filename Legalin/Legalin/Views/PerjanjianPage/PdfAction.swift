//
//  PdfAction.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 06/08/21.
//

import SwiftUI
import UserNotifications
import WebKit
import UIKit

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
        dateComponent.day = Int(perjanjianController.tanggalJatuhTempo)
        
        
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
    var hideSwitch: Bool = false
    
    
    @State private var showShareSheet: Bool = false
    @State var items : [Any] = []
    @State var pdf = InvoiceComposer()
    var body: some View {
        
        VStack{
            
            NavigationLink(
                destination: GeneratePDF(),
                label: {
                    VStack{
                        Image("pdf")
                            .padding(.bottom, 24)
                        
                        Text("\(perjanjianController.tujuanPeminjaman) - \(perjanjianController.tanggalTandaTangan)")
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
//                items.removeAll()
//                items.append(pdf.renderInvoice())
                shareAction(item: pdf.renderInvoice())
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
                        if perjanjianController.statusSurat == "notSigned"{
                            SignBtn(pinjaman: perjanjianController.detailPinjaman!)
                        }
                        else{
                            SignBtn(pinjaman: perjanjianController.detailPinjaman!)
                                .disabled(true)
                        }
                    }
                    if perjanjianController.statusSurat == "onGoing"{
                        Toggle(isOn: $perjanjianController.reminder, label: {
                            Text("Pengingat")
                        })
                        .toggleStyle(SwitchToggleStyle(tint: Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1))))
                        .onChange(of: perjanjianController.reminder, perform: { value in
                            if value{
                                NotificationManager.instance.notification()
                                coreDataVM.updatePinjaman(pinjaman: perjanjianController.detailPinjaman!, reminder: value)
                                print(value)
                                
                            }
                            else{
                                coreDataVM.updatePinjaman(pinjaman: perjanjianController.detailPinjaman!, reminder: value)
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
    
    private func shareAction(item: String){
        showShareSheet.toggle()
        
       var filePdf = [Any]()
        filePdf.append(testPdf(html: item))
        
        let av = UIActivityViewController(activityItems: filePdf, applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
    }
    
    func testPdf(html:String) -> URL{
        
        let fmt = UIMarkupTextPrintFormatter(markupText: html)

        // 2. Assign print formatter to UIPrintPageRenderer
        let render = UIPrintPageRenderer()
        render.addPrintFormatter(fmt, startingAtPageAt: 0)

        // 3. Assign paperRect and printableRect
        let page = CGRect(x: 0, y: 0, width: 595.2, height: 841.8) // A4, 72 dpi
        render.setValue(page, forKey: "paperRect")
        render.setValue(page, forKey: "printableRect")

        // 4. Create PDF context and draw
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, .zero, nil)

        for i in 0..<render.numberOfPages {
            UIGraphicsBeginPDFPage();
            render.drawPage(at: i, in: UIGraphicsGetPDFContextBounds())
        }

        UIGraphicsEndPDFContext();

        // 5. Save PDF file
        guard let outputURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("output").appendingPathExtension("pdf")
            else { fatalError("Destination URL not created") }

        pdfData.write(to: outputURL, atomically: true)
        
        print("open \(outputURL.path)") // command to open the generated file
        return outputURL
    }
}

struct SignBtn: View{
    @State var alertIsPresented = false
    @State var isSigned = false
    @ObservedObject var coreDataVM: CoreDataViewModel = .shared
    @State var pinjaman : Pinjaman
    @ObservedObject var perjanjianController: PerjanjianController = .shared
//    @State var pinjaman : Pinjaman
    var body: some View{
        Button(action: {
            self.alertIsPresented = true
        }, label: {
            if perjanjianController.statusSurat == "onGoing"{
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
                                                                                                                                                                                    coreDataVM.updatePinjaman(pinjaman: pinjaman, status: StatusSurat.onGoing)
                                                                                                                                                                                    perjanjianController.setStatusSurat(status: StatusSurat.onGoing.rawValue)
                                                                                                                                                                                }), secondaryButton: .cancel(Text("Belum")))
        })
    }
}



//struct PdfAction_Previews: PreviewProvider {
//    static var previews: some View {
//        PdfAction(hideSwitch: false)
//    }
//}
