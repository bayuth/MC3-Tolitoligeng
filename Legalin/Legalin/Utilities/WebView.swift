import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {
    
    var invoiceComposer = InvoiceComposer()
    var nama1: String = "Ayam"
    var nama2: String = "Babi"
    var webView = WKWebView()
    
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        let invoiceHTML = invoiceComposer.renderInvoice()
        
        uiView.loadHTMLString(invoiceHTML!, baseURL: nil)
    }
}
