//
//  PDFViewer.swift
//  Trombone Excerpts
//
//  Created by Thomas Swatland on 15/08/2017.
//  Copyright © 2017 Thomas Swatland. All rights reserved.
//

import UIKit
import FirebaseStorage

class PDFViewer: UIViewController {
    
    var storage = Storage()
    var filePath = String()
    var pdfTitle = String()
    
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
        
        storage = Storage.storage()
        let fileRef = storage.reference().child("Trombone").child(filePath)
        
        fileRef.downloadURL { url, err in
            if err != nil {
                // Do error handling
                print("error")
            } else {
                guard let url = url else { return }
                let pdfRequest = URLRequest(url: url)
                self.pdfViewer.loadRequest(pdfRequest)
            }
        }
        
        
        
        
    }

}
