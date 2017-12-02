//
//  PDFViewer.swift
//  Trombone Excerpts
//
//  Created by Thomas Swatland on 15/08/2017.
//  Copyright © 2017 Thomas Swatland. All rights reserved.
//

import UIKit

class PDFViewer: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var pdfTitle = String()
    var videoCode = String()
    
    @IBOutlet weak var pdfViewer: UIWebView!
    @IBOutlet weak var videoCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadPDF()

    }
    
    @IBAction func shareButtonPressed(_ sender: UIBarButtonItem) {
        let activityVC = UIActivityViewController(activityItems: [(pdfViewer.request?.url?.absoluteURL)! as URL], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCell
        
        cell.videoViewer.loadHTMLString("<iframe width=\"\(cell.videoViewer.frame.width)\" height=\"\(cell.videoViewer.frame.height)\" src=\"https://www.youtube.com/embed/B3wRYURYbwo?&playsinline=1\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
        cell.videoViewer.scrollView.isScrollEnabled = false
        cell.videoViewer.scrollView.contentInset = UIEdgeInsetsMake(-8.0, -8.0, -8.0, -8.0)
        videoCV.isPagingEnabled = true
        
        return cell
        
    }
    
    func loadPDF() {
        let pdfPath = URL(fileURLWithPath: Bundle.main.path(forResource: pdfTitle, ofType: ".pdf")!)
        let pdfRequest = URLRequest(url: pdfPath)
        pdfViewer.loadRequest(pdfRequest)
        
    }

}
