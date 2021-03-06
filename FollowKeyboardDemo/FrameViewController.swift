//
//  FrameViewController.swift
//  FollowKeyboardDemo
//
//  Created by Danis on 16/1/21.
//  Copyright © 2016年 danis. All rights reserved.
//

import UIKit
import FollowKeyboard

class FrameViewController: UIViewController {

    let bottomBar = UIView()
    let inputTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bottomBar.backgroundColor = UIColor.purpleColor()
        bottomBar.frame = CGRect(x: 0, y: view.frame.height - 60, width: view.frame.width, height: 60)
        
        inputTextField.placeholder = "Please say Hi"
        inputTextField.backgroundColor = UIColor.clearColor()
        inputTextField.frame = CGRectInset(bottomBar.bounds, 5, 5)
        inputTextField.textColor = UIColor.whiteColor()
        
        let tapBackground = UITapGestureRecognizer(target: self, action: "onTapBackground:")
        view.userInteractionEnabled = true
        view.addGestureRecognizer(tapBackground)
    
        view.addSubview(bottomBar)
        bottomBar.addSubview(inputTextField)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let fk = FollowKeyboard()
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        fk.followKeyboard(withAnimations: { (keyboardFrame, duration, type) -> Void in
            
            switch type {
            case .Show:
                self.bottomBar.frame = CGRectOffset(self.bottomBar.frame, 0, -keyboardFrame.height)
            case .Hide:
                self.bottomBar.frame = CGRectOffset(self.bottomBar.frame, 0, keyboardFrame.height)
            }
            
            }) { (finished) -> Void in
                
        }
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        fk.unfollowKeyboard()
    }
    func onTapBackground(tap: UITapGestureRecognizer) {
        inputTextField.resignFirstResponder()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
