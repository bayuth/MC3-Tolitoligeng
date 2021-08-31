//
//  InvoiceComposer.swift
//  testPDF
//
//  Created by Jason Hartanto on 26/07/21.
//

import UIKit
import SwiftUI

class InvoiceComposer: NSObject {
    
    @ObservedObject var perjanjianController: PerjanjianController = .shared
    
    override init() {
        super.init()
    }
    
    func renderInvoice() -> String! {
        
        do{
            
            var pathToHTMLTemplate = Bundle.main.path(forResource: "suratTanpaAgunanCicilan", ofType: "html")
            
            //Kondisi gapunya agunan
            if perjanjianController.tipeBarangAgunan == "Detail" {
                
                //pembayaran kontan
                if perjanjianController.metodePembayaran == "Kontan" {
                    pathToHTMLTemplate = Bundle.main.path(forResource: "suratTanpaAgunanKontan", ofType: "html")
                }
                
                //pembayaran cicilan
                else  {
                    pathToHTMLTemplate = Bundle.main.path(forResource: "suratTanpaAgunanCicilan", ofType: "html")
                }
                
                //Agunan Elektronik
            } else if perjanjianController.tipeBarangAgunan == "Elektronik" {
                
                //pembayaran kontan
                if perjanjianController.metodePembayaran == "Kontan" {
                    pathToHTMLTemplate = Bundle.main.path(forResource: "suratElektronikKontan", ofType: "html")
                }
                
                //pembayaran cicilan
                else  {
                    pathToHTMLTemplate = Bundle.main.path(forResource: "suratElektronikCicilan", ofType: "html")
                }
                
                //Agunan Umum
            } else if perjanjianController.tipeBarangAgunan == "Umum" {
                
                //pembayaran kontan
                if perjanjianController.metodePembayaran == "Kontan" {
                    pathToHTMLTemplate = Bundle.main.path(forResource: "suratNonElektronikKontan", ofType: "html")
                }
                
                //pembayaran cicilan
                else  {
                    pathToHTMLTemplate = Bundle.main.path(forResource: "suratNonElektronikCicilan", ofType: "html")
                }
                
            }
            
            //Change HTML Content
            var HTMLContent = try String(contentsOfFile: pathToHTMLTemplate!)
            
            //Date Controller
            let currentDate = Date()
            
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "id_ID")
            formatter.setLocalizedDateFormatFromTemplate("EEEE")
            
            let dayName = formatter.string(from: currentDate)
            
            formatter.setLocalizedDateFormatFromTemplate("dd MMMM yyyy")
            
            let tanggal = formatter.string(from: currentDate)
            
            //Calculate user 1 age
            var date1 =  perjanjianController.pihak1TanggalLahir
            let date2 = Date()
            var diffs = Calendar.current.dateComponents([.year, .month, .day], from: date1, to: date2)
            let umur1 = diffs.year
            
            //Calculate user 2 age
            date1 = perjanjianController.pihak1TanggalLahir
            diffs = Calendar.current.dateComponents([.year, .month, .day], from: date1, to: date2)
            let umur2 = diffs.year
            
            //Page 1 Content
            
            //Hari Tanggal
            HTMLContent = HTMLContent.replacingOccurrences(of: "#HARI#", with: dayName)
            HTMLContent = HTMLContent.replacingOccurrences(of: "#TANGGAL#", with: tanggal)
            
            //General Content Pihak 1
            HTMLContent = HTMLContent.replacingOccurrences(of: "#NAMA_PIHAK_1#", with: perjanjianController.pihak1Nama)
            HTMLContent = HTMLContent.replacingOccurrences(of: "#UMUR_PIHAK_1#", with: "\(umur1!) tahun")
            HTMLContent = HTMLContent.replacingOccurrences(of: "#PEKERJAAN_PIHAK_1#", with: perjanjianController.pihak1Pekerjaan)
            HTMLContent = HTMLContent.replacingOccurrences(of: "#KTP_PIHAK_1#", with: perjanjianController.pihak1NIK)
            HTMLContent = HTMLContent.replacingOccurrences(of: "#ALAMAT_PIHAK_1#", with: "\(perjanjianController.pihak1Alamat), RT \(perjanjianController.pihak1RT) RW \(perjanjianController.pihak1RW), \(perjanjianController.pihak1Kelurahan), \(perjanjianController.pihak1Kecamatan), \(perjanjianController.pihak1Kota), \(perjanjianController.pihak1Provinsi)")
            HTMLContent = HTMLContent.replacingOccurrences(of: "#TELP_PIHAK_1#", with: perjanjianController.pihak1NomorHP)
            
            //General Content Pihak 2
            HTMLContent = HTMLContent.replacingOccurrences(of: "#NAMA_PIHAK_2#", with: perjanjianController.pihak2Nama)
            HTMLContent = HTMLContent.replacingOccurrences(of: "#UMUR_PIHAK_2#", with: "\(umur2!) tahun")
            HTMLContent = HTMLContent.replacingOccurrences(of: "#PEKERJAAN_PIHAK_2#", with: perjanjianController.pihak2Pekerjaan)
            HTMLContent = HTMLContent.replacingOccurrences(of: "#KTP_PIHAK_2#", with: perjanjianController.pihak2NIK)
            HTMLContent = HTMLContent.replacingOccurrences(of: "#ALAMAT_PIHAK_2#", with: "\(perjanjianController.pihak2Alamat), RT \(perjanjianController.pihak2RT) RW \(perjanjianController.pihak2RW), \(perjanjianController.pihak2Kelurahan), \(perjanjianController.pihak2Kecamatan), \(perjanjianController.pihak2Kota), \(perjanjianController.pihak2Provinsi)")
            HTMLContent = HTMLContent.replacingOccurrences(of: "#TELP_PIHAK_2#", with: perjanjianController.pihak2NomorHP)
            
            //Penjelasan di page 1
            HTMLContent = HTMLContent.replacingOccurrences(of: "#PINJAMAN_ANGKA#", with: String(perjanjianController.jumlahPinjaman.toRupiahString()))
            HTMLContent = HTMLContent.replacingOccurrences(of: "#PINJAMAN_HURUF#", with: "\(perjanjianController.convertNumToWord(bil: perjanjianController.jumlahPinjaman))")
            
            //Pasal 1
            HTMLContent = HTMLContent.replacingOccurrences(of: "#ANGSURAN_ANGKA#", with: "\(generateCicilanPerbulan().toRupiahString())")
            HTMLContent = HTMLContent.replacingOccurrences(of: "#ANGSURAN_HURUF#", with: perjanjianController.convertNumToWord(bil: generateCicilanPerbulan()))
            HTMLContent = HTMLContent.replacingOccurrences(of: "#TENOR#", with: String(format: "%.0f", perjanjianController.tenor))
            HTMLContent = HTMLContent.replacingOccurrences(of: "#BANK#", with: perjanjianController.pihak2NamaBank)
            HTMLContent = HTMLContent.replacingOccurrences(of: "#REKENING#", with: perjanjianController.pihak2NomorRekening)
            
            //Pasal 2
            HTMLContent = HTMLContent.replacingOccurrences(of: "#BUNGA_PERSEN#", with: String(format: "%.2f", perjanjianController.bunga) + "%")
            HTMLContent = HTMLContent.replacingOccurrences(of: "#BUNGA_HURUF#", with: convertBungaToWord(bil: perjanjianController.bunga*100, firstTime: true))
            HTMLContent = HTMLContent.replacingOccurrences(of: "#BUNGA_ANGKA#", with: generateCicilanPerbulan2().toRupiahString())
            HTMLContent = HTMLContent.replacingOccurrences(of: "#BUNGA_HURUF2#", with: String(perjanjianController.convertNumToWord(bil: generateCicilanPerbulan2())))
            
            //Agunan
            HTMLContent = HTMLContent.replacingOccurrences(of: "#NAMA_BARANG#", with: perjanjianController.namaBarang)
            HTMLContent = HTMLContent.replacingOccurrences(of: "#NOMOR_SERI#", with: perjanjianController.nomorSeri)
            HTMLContent = HTMLContent.replacingOccurrences(of: "#WARNA_BARANG#", with: perjanjianController.warnaBarang)
            HTMLContent = HTMLContent.replacingOccurrences(of: "#AGUNAN_ANGKA#", with: "\(String(describing: getHargaAgunan().toRupiahString()))")
            HTMLContent = HTMLContent.replacingOccurrences(of: "#AGUNAN_HURUF#", with: perjanjianController.convertNumToWord(bil: Double(perjanjianController.hargaBarang) ?? 0))
            
            //Kantor Pengadilan
            HTMLContent = HTMLContent.replacingOccurrences(of: "#KANTOR_PENGADILAN#", with: perjanjianController.pengadilanNegeri)
            
            return HTMLContent
        }
        
        catch {
            print("Unable to open and use HTML template files")
        }
        
        return nil
    }
    
    func getHargaAgunan() -> Double {
        if perjanjianController.hargaBarang == "" {
            return 0
        } else {
            return Double(perjanjianController.hargaBarang) ?? 0
        }
    }
    
    func generateTotalBunga() -> Double {
        return (perjanjianController.bunga / 100) / 12 * perjanjianController.tenor
    }
    
    func generateTotalPinjaman() -> Double {
        return perjanjianController.jumlahPinjaman * (1 + generateTotalBunga())
    }
    
    func generateCicilanPerbulan() -> Double {
        return generateTotalPinjaman() / perjanjianController.tenor
    }
    
    func generateCicilanPerbulan2() -> Double {
        return (generateTotalPinjaman() - perjanjianController.jumlahPinjaman) / perjanjianController.tenor
    }
    
    func convertBungaToWord(bil: Double, firstTime: Bool) -> String {
        
        let angka = ["","Satu","Dua","Tiga","Empat","Lima","Enam",
                     "Tujuh","Delapan","Sembilan","Sepuluh","Sebelas"]
        var Hasil = " "
        
        let n = bil
        
        if (n >= 0 && n <= 11){
            Hasil = angka[Int(n)]
        }
        else if (n < 20){
            Hasil = convertBungaToWord(bil: n-10, firstTime: false) + " Belas "
        }
        else if (n < 100){
            
            if (firstTime == true){
                Hasil = "Nol" + " Koma " + convertBungaToWord(bil: n, firstTime: false)
            }else {
                Hasil = convertBungaToWord(bil: n/10, firstTime: false) + " Puluh " + convertBungaToWord(bil: n.truncatingRemainder(dividingBy: 10), firstTime: false)
            }
        }
        else if (n.truncatingRemainder(dividingBy: 100) == 0) {
            Hasil = angka[Int(n)/100]
        }
        else {
            Hasil = angka[Int(n)/100] + " Koma " + convertBungaToWord(bil: n.truncatingRemainder(dividingBy: 100), firstTime: false)
        }
        
        return Hasil
        
    } 
}
