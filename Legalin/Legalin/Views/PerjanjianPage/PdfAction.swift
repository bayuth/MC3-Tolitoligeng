//
//  PdfAction.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 06/08/21.
//

import SwiftUI

struct PdfAction: View {
    @Environment(\.presentationMode) var masterPresentationMode8
    @Environment(\.presentationMode) var presentationMode
    var hideSwitch: Bool = true
    @State var toggleIsOn: Bool = false
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
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                    }
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: 228, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal, 24)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
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
                        .foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
                    Text("Bagikan atau Cetak")
                        .foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
                }
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
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
                .background(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
                .specCornerRadius(8, corners: .allCorners)
                .padding()
                .padding(.bottom,30)
                
            }
            else{
                List{
                    HStack{
                        Text("Tanda Tangan")
                        Spacer()
                        if SignBtn().isSigned{
                            SignBtn()
                                .disabled(true)
                        }
                        else{
                            SignBtn()
                        }
                    }
                    Toggle(isOn: $toggleIsOn, label: {
                        Text("Pengingat")
                    })
                    .toggleStyle(SwitchToggleStyle(tint: Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1))))
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
    var body: some View{
        Button(action: {
            self.alertIsPresented = true
        }, label: {
            if isSigned{
                HStack{
                    Text("Sudah")
                        .foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
                    Image(systemName: "checkmark")
                        .foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
                }
            }
            else{
                Text("Belum")
                    .foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
            }
            
        })
        .alert(isPresented: $alertIsPresented, content: {
            Alert(title: Text("Surat Perjanjian Sudah di Tanda Tangan"), message: Text("Surat sudah ditanda tangan kedua belah pihak diatas materai?"), primaryButton: .default(Text("Sudah"),
                                                                                                                                                                                action: {
                                                                                                                                                                                    self.isSigned = true
                                                                                                                                                                                }), secondaryButton: .cancel(Text("Belum")))
        })
    }
}


struct PdfAction_Previews: PreviewProvider {
    static var previews: some View {
        PdfAction(hideSwitch: false)
    }
}
