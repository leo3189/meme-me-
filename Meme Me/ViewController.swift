//
//  ViewController.swift
//  Meme Me
//
//  Created by leonard on 2/11/19.
//  Copyright © 2019 leonard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var cameraBtn: UIBarButtonItem!
    @IBOutlet weak var pickImageView: UIImageView!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        topTextField.defaultTextAttributes = memeTextAttributes
//        bottomTextField.defaultTextAttributes = memeTextAttributes
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        cameraBtn.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        subscribeToKeyboardNotifications()
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        unsubscribeFromKeyboardNotifications()
//    }

    @IBAction func pickPicture(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func pickPictureFromCamera(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .camera
        present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            pickImageView.image = image
            
            dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func keyboardWillShow(_ notification:Notification) {
        view.frame.origin.y -= getKeyboardHeight(notification)
    }

    func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }

    @objc func keyboardWillHide(_ notification:Notification) {
        view.frame.origin.y += getKeyboardHeight(notification)
    }
    
//    @objc func keyboardWillShow(notif: NSNotification) {
//        if let keyboardSize = (notif.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y == 0 {
//                self.view.frame.origin.y -= keyboardSize.height / 4
//            }
//        }
//    }
//
//    @objc func keyboardWillHide(notif: NSNotification) {
//        if let keyboardSize = (notif.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y != 0 {
//                self.view.frame.origin.y += keyboardSize.height / 4
//            }
//        }
//    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

