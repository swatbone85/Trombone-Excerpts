//
//  BassTromboneTableVC.swift
//  Trombone Excerpts
//
//  Created by Thomas on 22.08.2017.
//  Copyright © 2017 Thomas Swatland. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase

class BassTromboneTableVC: UITableViewController {
    
    var storage = Storage()
    var database = Database()
    
    var chosenComposer = String()
    var chosenPiece = String()
    var excerpts = [Excerpt]()
    
    let cellId = "cellId"
    let segueId = "bassSegue"

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
        populateTableView()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
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
        return "\(excerpts[section].composer)"
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
        destVC?.instrument = "Bass Trombone"
    }
    
    func setupNavBar() {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
    }
    
    func populateTableView() {
        database = Database.database()
        let databaseRef = database.reference()
        let composerRef = databaseRef.child("bass_trombone")
            
        composerRef.observe(.childAdded, with: { snapshot in
                
            self.excerpts.append(Excerpt.init(composer: snapshot.key, pieces: snapshot.value as! [String]))
            self.tableView.reloadData()
        })
    }
}
