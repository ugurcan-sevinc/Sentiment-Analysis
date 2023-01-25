//
//  ModalViewController.swift
//  MLC Waikiki
//
//  Created by Uğurcan Sevinç on 25.12.2022.
//

import UIKit

protocol didSendTupleDelegate {
    func didSend(comment: Comment)
}
struct Comment: Codable {
    var title: String
    var description: String
    var result: Bool
}
class ModalViewController: UIViewController,UITextFieldDelegate {
    var delegate: didSendTupleDelegate?
    
    @IBOutlet weak var titleTextLabel: UITextField!
    @IBOutlet weak var descriptionTextLabel: UITextField!
    var tuple: (String,String,Bool) = (String(),String(),Bool())
    //let vc = ViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func addCommentClicked(_ sender: UIButton) {
        
        let comment = Comment(title: titleTextLabel.text ?? "", description: descriptionTextLabel.text ?? "", result: false)
        
        delegate?.didSend(comment: comment)
        
        self.dismiss(animated: true)
       // vc.viewWillAppear(false)
        
    }
    
}
