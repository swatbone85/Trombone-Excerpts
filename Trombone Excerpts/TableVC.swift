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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // cellForRow
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        cell.textLabel?.text = excerptArray[indexPath.section].pieces[indexPath.row]
        
        return cell
    }
    
    // numberOfRows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return excerptArray[section].pieces.count
    }
    
    // numberOfSections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return excerptArray.count
    }

    // titleForHeader
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return excerptArray[section].composer
    }
    
    // didSelectRow
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenComposer = excerptArray[indexPath.section].composer
        chosenPiece = excerptArray[indexPath.section].pieces[indexPath.row]
        
        performSegue(withIdentifier: "tenorSegue", sender: self)
        
    }
    
    // prepareSegue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destVC = segue.destination as? PDFViewer
        
        destVC?.title = "\(chosenPiece) (\(chosenComposer))"
        destVC?.pdfTitle = "\(chosenPiece) (\(chosenComposer)) tenor"
        
    }

}

