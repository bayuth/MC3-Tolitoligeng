//
//  PreviewViewController.swift
//  testPDF
//
//  Created by Jason Hartanto on 26/07/21.
//

import UIKit
import WebKit

var pageNumber:Int!

class PreviewViewController: UIViewController, WKNavigationDelegate{

    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    var invoiceComposer: InvoiceComposer!
    var HTMLContent: String!
    
    var nama1: String!
    var nama2: String!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        createInvoiceAsHTML()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createInvoiceAsHTML() {
        invoiceComposer = InvoiceComposer()
        
        let invoiceHTML = invoiceComposer.renderInvoice(nama1: nama1, nama2: nama2)
    
        webView.loadHTMLString(invoiceHTML!, baseURL: nil)
        
        HTMLContent = invoiceHTML
    }
    
    func setPageNumber(num:Int) {
        pageNumber = num
    }
    
    @IBAction func exportToPDF(_ sender: UIBarButtonItem) {
        
        let path=webView.exportAsPdfFromWebView()
        print(path)
        
        
        let alert = UIAlertController(title: "Success", message: "PDF has been saved at \(path)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: {action in
            self.navigationController?.popViewController(animated: true)
        }))
        
        present(alert, animated: true, completion: nil)
        
    }
}

extension WKWebView {
    
    // Call this function when WKWebView finish loading
    func exportAsPdfFromWebView() -> String {
        let pdfData = createPdfFile(printFormatter: self.viewPrintFormatter())
        return self.saveWebViewPdf(data: pdfData)
    }
    
    func createPdfFile(printFormatter: UIViewPrintFormatter) -> NSMutableData {
        
        let originalBounds = self.bounds
        
        self.bounds = CGRect(x: originalBounds.origin.x, y: bounds.origin.y, width: CGFloat(595.2), height: CGFloat(841.8))
        
        let pdfPageFrame = CGRect(x: 0, y: 0, width: CGFloat(595.2), height: CGFloat(841.8))
        
        let printPageRenderer = UIPrintPageRenderer()
        
        printPageRenderer.addPrintFormatter(printFormatter, startingAtPageAt: 0)
        
        let printable = pdfPageFrame.insetBy(dx: 0, dy: 0)
        
        printPageRenderer.setValue(NSValue(cgRect: pdfPageFrame), forKey: "paperRect")
        
        printPageRenderer.setValue(NSValue(cgRect: printable), forKey: "printableRect")
        
        self.bounds = originalBounds
        
        pageNumber = printPageRenderer.numberOfPages
        
        return printPageRenderer.generatePdfData()
    }
    
    // Save pdf file in document directory
    func saveWebViewPdf(data: NSMutableData) -> String {
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDirectoryPath = paths[0]
        let pdfPath = docDirectoryPath.appendingPathComponent("webViewPdf.pdf")
        if data.write(to: pdfPath, atomically: true) {
            return pdfPath.path
        } else {
            return ""
        }
    }
}

extension UIPrintPageRenderer {
    
    func generatePdfData() -> NSMutableData {
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, self.paperRect, nil)
        self.prepare(forDrawingPages: NSMakeRange(0, self.numberOfPages))
        let printRect = UIGraphicsGetPDFContextBounds()
        for pdfPage in 0...(pageNumber-2){
            UIGraphicsBeginPDFPage()
            self.drawPage(at: pdfPage, in: printRect)
        }
        UIGraphicsEndPDFContext();
        return pdfData
    }
}
