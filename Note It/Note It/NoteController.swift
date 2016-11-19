//
//  NoteController.swift
//  Note It
//
//  Created by Salieu Kamara on 10/11/2016.
//  Copyright © 2016 Coventry University. All rights reserved.
//

import UIKit

class NoteController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    public var noteID:Int = 0
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var noteField: UITextView!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    @IBAction func dismissKeyboard(_ sender: UIBarButtonItem) {
        self.titleField.resignFirstResponder()
        self.noteField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doneButton.tintColor = UIColor.clear
        self.titleField.delegate = self
        self.noteField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
        
        if let id:Int = self.noteID {
            print("view did load with note \(id)")
            if let note:Note = try? Notes.sharedInstance.getNote(atIndex: id) {
                self.title = note.title
                self.titleField.text = note.title
                self.noteField.text = note.text
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("finished editing the title")
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        print("finished editing the note")
    }
    
    func keyboardWillShow(_ notification: NSNotification) {
        print("keyboard will show")
        self.doneButton.tintColor = nil
        if let info = notification.userInfo {
            if let keyboardInfo = info[UIKeyboardFrameBeginUserInfoKey] as! NSValue? {
                let height = keyboardInfo.cgRectValue.height
                print("keyboard is currently \(height) dp high")
                self.bottomConstraint.constant = height + 10
            }
        }
    }
    
    func keyboardWillHide(_ notification: NSNotification) {
        print("keyboard will hide")
        self.doneButton.tintColor = UIColor.clear
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
