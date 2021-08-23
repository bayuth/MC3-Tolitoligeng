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
            
            let pathToHTMLTemplate = Bundle.main.path(forResource: "suratTanpaAgunanCicilan", ofType: "html")
            //Change HTML Content
            var HTMLContent = try String(contentsOfFile: pathToHTMLTemplate!)
            
            //Page 1 Content
            
            //Hari Tanggal
            HTMLContent = HTMLContent.replacingOccurrences(of: "#HARI#", with: "TBA")
            HTMLContent = HTMLContent.replacingOccurrences(of: "#TANGGAL#", with: "TBA")
            
            //General Content Pihak 1
            HTMLContent = HTMLContent.replacingOccurrences(of: "#NAMA_PIHAK_1#", with: perjanjianController.pihak1Nama)
            HTMLContent = HTMLContent.replacingOccurrences(of: "#UMUR_PIHAK_1#", with: "TBA")
            HTMLContent = HTMLContent.replacingOccurrences(of: "#PEKERJAAN_PIHAK_1#", with: perjanjianController.pihak1Pekerjaan)
            HTMLContent = HTMLContent.replacingOccurrences(of: "#KTP_PIHAK_1#", with: perjanjianController.pihak1NIK)
            HTMLContent = HTMLContent.replacingOccurrences(of: "#ALAMAT_PIHAK_1#", with: perjanjianController.pihak1Alamat)
            HTMLContent = HTMLContent.replacingOccurrences(of: "#TELP_PIHAK_1#", with: perjanjianController.pihak1NomorHP)
            
            //General Content Pihak 2
            HTMLContent = HTMLContent.replacingOccurrences(of: "#NAMA_PIHAK_2#", with: perjanjianController.pihak2Nama)
            HTMLContent = HTMLContent.replacingOccurrences(of: "#UMUR_PIHAK_2#", with: "TBA")
            HTMLContent = HTMLContent.replacingOccurrences(of: "#PEKERJAAN_PIHAK_2#", with: perjanjianController.pihak2Pekerjaan)
            HTMLContent = HTMLContent.replacingOccurrences(of: "#KTP_PIHAK_2#", with: perjanjianController.pihak2NIK)
            HTMLContent = HTMLContent.replacingOccurrences(of: "#ALAMAT_PIHAK_2#", with: perjanjianController.pihak2Alamat)
            HTMLContent = HTMLContent.replacingOccurrences(of: "#TELP_PIHAK_2#", with: perjanjianController.pihak2NomorHP)
            
            //Penjelasan di page 1
            HTMLContent = HTMLContent.replacingOccurrences(of: "#PINJAMAN_ANGKA#", with: String(perjanjianController.jumlahPinjaman))
            HTMLContent = HTMLContent.replacingOccurrences(of: "#PINJAMAN_HURUF#", with: "TBA")
            
            //Pasal 1
            HTMLContent = HTMLContent.replacingOccurrences(of: "#ANGSURAN_ANGKA#", with: "TBA")
            HTMLContent = HTMLContent.replacingOccurrences(of: "#ANGSURAN_HURUF#", with: "TBA")
            HTMLContent = HTMLContent.replacingOccurrences(of: "#TENOR#", with: "TBA")
            HTMLContent = HTMLContent.replacingOccurrences(of: "#BANK#", with: perjanjianController.pihak2NamaBank)
            HTMLContent = HTMLContent.replacingOccurrences(of: "#REKENING#", with: perjanjianController.pihak2NomorRekening)
            
            //Pasal 2
            HTMLContent = HTMLContent.replacingOccurrences(of: "#BUNGA_PERSEN#", with: "TBA")
            HTMLContent = HTMLContent.replacingOccurrences(of: "#BUNGA_HURUF#", with: "TBA")
            HTMLContent = HTMLContent.replacingOccurrences(of: "#BUNGA_ANGKA#", with: "TBA")
            
            //Pasal 7
            HTMLContent = HTMLContent.replacingOccurrences(of: "#KANTOR_PENGADILAN#", with: perjanjianController.pengadilanNegeri)
            
            return HTMLContent
        }
        
        catch {
            print("Unable to open and use HTML template files")
        }
        
        return nil
    }
    
//    func drawPDFUsingPrintPageRenderer(printPageRenderer: UIPrintPageRenderer) -> NSData! {
//        let data = NSMutableData()
//
//        UIGraphicsBeginPDFContextToData(data, CGRect.zero, nil)
//        printPageRenderer.prepare(forDrawingPages: NSMakeRange(0, printPageRenderer.numberOfPages))
//
//        let bounds = UIGraphicsGetPDFContextBounds()
//
//        for i in 0...(printPageRenderer.numberOfPages - 1) {
//            UIGraphicsBeginPDFPage()
//            printPageRenderer.drawPage(at: i, in: bounds)
//        }
//
//        UIGraphicsEndPDFContext();
//        return data
//    }
//
//    func exportHTMLContentToPDF(HTMLContent: String) {
//        let printPageRenderer = CustomPrintPageRenderer()
//
//        let printFormatter = UIMarkupTextPrintFormatter(markupText: HTMLContent)
//
//        printPageRenderer.addPrintFormatter(printFormatter, startingAtPageAt: 0)
//
//        let pdfData = drawPDFUsingPrintPageRenderer(printPageRenderer: printPageRenderer)
//
//        let pdfFilename = "\(AppDelegate.getAppDelegate().getDocDir())/InvoiceTest.pdf"
//
//        pdfData!.write(toFile: pdfFilename, atomically: true)
//
//        print(pdfFilename)
//        print("Kelar")
//    }
//
//    func createPDF(html: String, filename: String) -> String {
//            // From: https://gist.github.com/nyg/b8cd742250826cb1471f
//
////            print("createPDF: \(html)")
//
//            // 2. Assign print formatter to UIPrintPageRenderer
//
//        let formmatter = UIMarkupTextPrintFormatter(markupText: html)
//
//            render.addPrintFormatter(formmatter, startingAtPageAt: 0)
//
//            // 3. Assign paperRect and printableRect
//            let page = CGRect(x: 0, y: 0, width: 595.2, height: 841.8) // A4, 72 dpi
//            let printable = page.insetBy(dx: 0, dy: 0)
//
//            render.setValue(NSValue(cgRect: page), forKey: "paperRect")
//            render.setValue(NSValue(cgRect: printable), forKey: "printableRect")
//
//            // 4. Create PDF context and draw
//            let pdfData = NSMutableData()
//            UIGraphicsBeginPDFContextToData(pdfData, CGRect.zero, nil)
//
//            for i in 1...render.numberOfPages {
//
//                UIGraphicsBeginPDFPage();
//                let bounds = UIGraphicsGetPDFContextBounds()
//                render.drawPage(at: i - 1, in: bounds)
//            }
//
//            UIGraphicsEndPDFContext();
//
//            // 5. Save PDF file
//            let path = "\(NSTemporaryDirectory())\(filename).pdf"
//            pdfData.write(toFile: path, atomically: true)
//            print("open \(path)")
//
//            return path
//        }
//
}
