//
//  BassTromboneTableVC.swift
//  Trombone Excerpts
//
//  Created by Thomas on 22.08.2017.
//  Copyright © 2017 Thomas Swatland. All rights reserved.
//

import UIKit

class BassTromboneTableVC: UITableViewController {
    
    var chosenComposer = String()
    var chosenPiece = String()
    
    let cellId = "cellId"
    let segueId = "bassSegue"

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
    }

    // cellForRow
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.textLabel?.text = bassTromboneArray[indexPath.section].pieces[indexPath.row]
        
        return cell
    }
    
    // numberOfRows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bassTromboneArray[section].pieces.count
    }
    
    // numberOfSections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return bassTromboneArray.count
    }
    
    // titleForHeader
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(bassTromboneArray[section].composer.uppercased()), \(bassTromboneArray[section].firstName)"
    }
    
    // didSelectRow
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenComposer = bassTromboneArray[indexPath.section].composer
        chosenPiece = bassTromboneArray[indexPath.section].pieces[indexPath.row]
        
        performSegue(withIdentifier: segueId, sender: self)
        
    }

    // prepareSegue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        let destVC = segue.destination as? PDFViewer
        
        destVC?.title = "\(chosenPiece) (\(chosenComposer))"
        destVC?.pdfTitle = "\(chosenPiece) (\(chosenComposer)) Bass"
    }
    
    func setupNavBar() {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
    }

}
