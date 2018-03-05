//
//  PDFViewer.swift
//  Trombone Excerpts
//
//  Created by Thomas Swatland on 15/08/2017.
//  Copyright © 2017 Thomas Swatland. All rights reserved.
//

import UIKit
import WebKit
import FirebaseStorage
import NVActivityIndicatorView

class PDFViewer: UIViewController, WKNavigationDelegate {
    
    var storage = Storage()
    var filePath = String()
    var pdfTitle = String()
    var instrument = String()
    
    let container = ActivityIndicator.container
    let activityIndicator = ActivityIndicator.activityIndicator
    
    let wkWebView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupWebView()
        loadPDF()

    }
    
    @IBAction func shareButtonPressed(_ sender: UIBarButtonItem) {
        let activityVC = UIActivityViewController(activityItems: [(wkWebView.url)! as URL], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    
    func loadPDF() {
        
        showActivityIndicator()
        storage = Storage.storage()
        
        let fileRef = storage.reference().child(instrument).child(filePath)
        
        fileRef.downloadURL { url, err in
            if err != nil {
                let alert = UIAlertController(title: "Alert", message: "File not found!", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(alertAction)
                self.present(alert, animated: true, completion: nil)
            } else {
                guard let url = url else { return }
                let pdfRequest = URLRequest(url: url)
                self.wkWebView.load(pdfRequest)
            }
        }
    }
    
    func showActivityIndicator() {
        
        container.center = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2 - 100)
        container.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        container.layer.cornerRadius = 10
        view.clipsToBounds = true
        
        activityIndicator.center = CGPoint(x: container.frame.size.width / 2, y: container.frame.size.height / 2)
        
        ActivityIndicator.start()
        
        container.addSubview(activityIndicator)
        wkWebView.addSubview(container)
    }
    
    func hideActivityIndicator() {
        ActivityIndicator.stop()
        container.removeFromSuperview()
    }
    
    func setupWebView() {
        wkWebView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - 100)
        
        wkWebView.navigationDelegate = self
        view.addSubview(wkWebView)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        hideActivityIndicator()
    }
}
