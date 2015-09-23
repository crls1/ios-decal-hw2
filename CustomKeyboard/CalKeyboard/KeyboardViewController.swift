//
//  KeyboardViewController.swift
//  CalKeyboard
///Users/carloscaballero/Library/Developer/Xcode/UserData/FontAndColorThemes/Solarized-Dark.dvtcolortheme
//  Created by Gene Yoo on 9/15/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var smilyButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    var keyboardView: UIView!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }
    
    @IBAction func returnButtonPressed(sender: UIButton) {
        //resignFirstResponder()
        let proxy = textDocumentProxy as UITextDocumentProxy
        proxy.insertText("\n")
    }
    
    
    
    @IBAction func deleteOneStep(sender: UIButton) {
        let proxy = textDocumentProxy as UITextDocumentProxy
        proxy.deleteBackward()
    }
    
    let text = [0:"（ ^_^）o自自o（^_^ ）", 1:"ᕙ(⇀‸↼‶)ᕗ",
        2: "<('.'<)", 3:"(╯°□°）╯︵ ┻━┻", 4:"ʕ•ᴥ•ʔ",
        5:"ಠ_ಠ", 6:"¯\\_(ツ)_/¯", 7:"ლ(｀ー´ლ)", 8:"ʘ‿ʘ"]
    
    @IBAction func writetext(sender: UIButton) {
        let proxy = textDocumentProxy as UITextDocumentProxy
        proxy.insertText(text[sender.tag]!)
    }
    
    func loadInterface() {
        let keyboardNib = UINib(nibName: "Keyboard", bundle: nil)
        keyboardView = keyboardNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        keyboardView.frame = view.frame
        view.addSubview(keyboardView)
        view.backgroundColor = keyboardView.backgroundColor
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside) // advanceToNextInputMode is already defined in template
    }


}
