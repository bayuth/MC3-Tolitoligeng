//
//  InvoiceComposer.swift
//  testPDF
//
//  Created by Jason Hartanto on 26/07/21.
//

import UIKit

class InvoiceComposer: NSObject {
    
    let pathToHTMLTemplate = Bundle.main.path(forResource: "templateSurat", ofType: "html")
    
    var nama1: String!
    var nama2: String!
    
    override init() {
        super.init()
    }
    
    func renderInvoice(nama1: String? = "", nama2: String? = "") -> String! {
        
        do{
            var HTMLContent = try String(contentsOfFile: pathToHTMLTemplate!)
            
            HTMLContent = HTMLContent.replacingOccurrences(of: "#nama1#", with: nama1!)
            
            HTMLContent = HTMLContent.replacingOccurrences(of: "#nama2#", with: nama2!)
            
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
