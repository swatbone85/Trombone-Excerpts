//
//  ViewController.swift
//  Trombone Excerpts
//
//  Created by Thomas Swatland on 15/08/2017.
//  Copyright © 2017 Thomas Swatland. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

class TableViewController: UITableViewController {
    
    var database = Database()
    var storage = Storage()
    
    var chosenComposer = String()
    var chosenPiece = String()
    var excerpts = [Excerpt]()
    
    let cellId = "cellId"
    let segueId = "tenorSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        populateTableView()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)!
        
        cell.textLabel?.text = excerpts[indexPath.section].pieces[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return excerpts[section].pieces.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return excerpts.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(excerpts[section].composer), \(excerpts[section].firstName)"
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenComposer = excerpts[indexPath.section].composer
        chosenPiece = excerpts[indexPath.section].pieces[indexPath.row]
        
        performSegue(withIdentifier: segueId, sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        storage = Storage.storage()
        
        let destVC = segue.destination as? PDFViewer
        
        destVC?.title = "\(chosenPiece) (\(chosenComposer))"
        destVC?.filePath = "\(chosenComposer)/\(chosenPiece) (\(chosenComposer)).pdf"
        
        
    }
    
    func populateTableView() {
        database = Database.database()
        let databaseRef = database.reference()
        let composerRef = databaseRef.child("trombone")
    
        composerRef.observe(.childAdded, with: { snapshot in
            
            self.excerpts.append(Excerpt.init(composer: snapshot.key, firstName: "Harold", pieces: snapshot.value as! [String]))
            self.tableView.reloadData()
        })
    }
    
    func setupNavBar() {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
    }
}

