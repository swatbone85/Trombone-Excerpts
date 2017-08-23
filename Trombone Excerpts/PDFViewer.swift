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
    
    @IBOutlet weak var pdfViewer: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = URL(fileURLWithPath: Bundle.main.path(forResource: pdfTitle, ofType: ".pdf")!)
        let request = URLRequest(url: path)
        
        pdfViewer.loadRequest(request)

    }

}
