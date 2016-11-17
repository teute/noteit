//
//  NoteController.swift
//  Note It
//
//  Created by Salieu Kamara on 10/11/2016.
//  Copyright © 2016 Coventry University. All rights reserved.
//

import UIKit

class NoteController: UIViewController {
    
    public var noteID:Int?
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var noteField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let id:Int = self.noteID {
            print("view did load with note \(id)")
            if let note:Note = try? Notes.sharedInstance.getNote(atIndex: id) {
                self.title = note.title
                self.titleField.text = note.title
                self.noteField.text = note.text
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
