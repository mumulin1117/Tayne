//
//  TayneBaseViewController.swift
//  Tayne
//
//  Created by Tayne on 2025/2/10.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx
import RTRootNavigationController

class TayneBaseViewController: UIViewController {
    
    
    var tayneTransLucent = true

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        if tayneTransLucent {
            navigationController?.navigationBar.isTranslucent = true
            
            navigationController?.navigationBar.titleTextAttributes = [
                .foregroundColor: UIColor.white,
                .font: UIFont.systemFont(ofSize: 15, weight: .semibold)
            ]
            navigationController?.navigationBar.backgroundColor = .clear
        }
        
    }
    
    override func rt_customBackItem(withTarget target: Any!, action: Selector!) -> UIBarButtonItem! {
        let tayneBackItem = "tayneBackItem"
        
        if tayneBackItem.count > 0 {
            let tayneBack = UIBarButtonItem(image: UIImage(named: tayneBackItem)!.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(customBackItemEvent))
            return tayneBack
        }
        return UIBarButtonItem()
    }
    
    func tayneNavigationTitle(tayneTitle:String){
        self.title = tayneTitle
    }
    
    @objc func customBackItemEvent(){
        navigationController?.popViewController(animated: tayneTransLucent)
    }
    
    

    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
