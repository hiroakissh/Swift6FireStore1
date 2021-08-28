//
//  LoginViewController.swift
//  Swift6FireStore1
//
//  Created by HiroakiSaito on 2021/08/27.
//

import UIKit
import Firebase
import FirebaseFirestore


class LoginController: UIViewController {
    
    @IBOutlet weak var odaiLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    //DBの場所を指定
    let db1 = Firestore.firestore().collection("Odai").document("DwajCi9H9PkhA1aBVPwL")
    let db2 = Firestore.firestore()
    
    var userName = String()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "userName") != nil{
            
            userName = UserDefaults.standard.object(forKey: "userName") as! String
            
            
        }

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        
        //load
        
    }

    
    func loadQuestiondata(){
        
        db1.getDocument { (snapShot, error) in
            
            
            if error != nil{
                return
            }
            let data = snapShot?.data()
            self.odaiLabel.text = data!["odaiText"] as! String
            
        }
        
    }
    
    @IBAction func send(_ sender: Any) {
        
        db2.collection("Answers").document().setData(["answer":textView.text,"userName":userName,"postDate":Date().timeIntervalSince1970]
        )
        
    }
    

}
