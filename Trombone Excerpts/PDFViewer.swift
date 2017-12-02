//
//  PDFViewer.swift
//  Trombone Excerpts
//
//  Created by Thomas Swatland on 15/08/2017.
//  Copyright © 2017 Thomas Swatland. All rights reserved.
//

import UIKit

class PDFViewer: UIViewController {

    var pdfTitle = String()
    var videoCode = String()
    
    @IBOutlet weak var pdfViewer: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadPDF()

    }
    
    @IBAction func shareButtonPressed(_ sender: UIBarButtonItem) {
        let activityVC = UIActivityViewController(activityItems: [(pdfViewer.request?.url?.absoluteURL)! as URL], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
        
    }
    
    func loadPDF() {
        let pdfPath = URL(fileURLWithPath: Bundle.main.path(forResource: pdfTitle, ofType: ".pdf")!)
        let pdfRequest = URLRequest(url: pdfPath)
        pdfViewer.loadRequest(pdfRequest)
        
    }

}
