//
//  ChatViewController.swift
//  etonchat
//
//  Created by Juheb on 07/03/2018.
//  Copyright © 2018 Juheb. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    
    @IBAction func logOutPressed(_ sender: Any) {
        
        do{
            try Auth.auth().signOut()
            navigationController?.popViewController(animated: true)
        }catch{
            print("Error Signing Out")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
