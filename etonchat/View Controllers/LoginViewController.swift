//
//  ViewController.swift
//  etonchat
//
//  Created by Juheb on 28/02/2018.
//  Copyright © 2018 Juheb. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    let validation = Validation()
    let alert = Alert()

    var valid: Bool = false
    var isInput: Bool = false
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func LoginButton(_ sender: Any) {
        
        if emailField.text == "" {
            present(alert.defaultAlert(alertTitle: "Warning", alertMessage: "Please enter email"), animated: true, completion: nil)
            valid = false
            isInput = false
        }
        else if passField.text == "" {
            present(alert.defaultAlert(alertTitle: "Warning", alertMessage: "Please enter password"), animated: true, completion: nil)
            valid = false
            isInput = false
        }
        else{
            isInput = true
        }
        if isInput == true{
            if validation.isValidEmail(emailStr: emailField.text!) == false{
                present(alert.defaultAlert(alertTitle: "Error", alertMessage: "Invalid username or password \n Please try again"), animated: true, completion: nil)
                valid = false
            }
            else if validation.isValidPass(passStr: passField.text!) == false{
                present(alert.defaultAlert(alertTitle: "Error", alertMessage: "Invalid username or password \n Please try again"), animated: true, completion: nil)
                valid = false
            }
            else{
                valid = true
            }
        }
        
        if valid == true{
            
            Auth.auth().signIn(withEmail: emailField.text!, password: passField.text!, completion: { (user, error) in
                
                if error != nil {
                    print(error!)
                    self.present(self.alert.defaultAlert(alertTitle: "Error", alertMessage: "Invalid username or password \n Please try again"), animated: true, completion: nil)
                    //output error message
                }
                else {
                    print("Login Success")
                    self.performSegue(withIdentifier: "toChat", sender: nil)
                    self.valid = false
                }

            })
            
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}

