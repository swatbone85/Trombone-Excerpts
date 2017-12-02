//
//  ViewController.swift
//  Trombone Excerpts
//
//  Created by Thomas Swatland on 15/08/2017.
//  Copyright © 2017 Thomas Swatland. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var chosenComposer = String()
    var chosenPiece = String()
    
    let cellId = "cellId"
    let segueId = "tenorSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)!
        
        cell.textLabel?.text = excerptArray[indexPath.section].pieces[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return excerptArray[section].pieces.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return excerptArray.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(excerptArray[section].composer.uppercased()), \(excerptArray[section].firstName)"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenComposer = excerptArray[indexPath.section].composer
        chosenPiece = excerptArray[indexPath.section].pieces[indexPath.row]
        
        performSegue(withIdentifier: segueId, sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destVC = segue.destination as? PDFViewer
        
        destVC?.title = "\(chosenPiece) (\(chosenComposer))"
        destVC?.pdfTitle = "\(chosenPiece) (\(chosenComposer)) tenor"
        
        
    }
    
    func setupNavBar() {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
    }
}

