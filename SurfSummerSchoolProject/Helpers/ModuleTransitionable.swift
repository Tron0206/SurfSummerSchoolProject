//
//  ModuleTransitionable.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 07/08/22.
//

import Foundation
import UIKit


protocol ModuleTransitionable: AnyObject {
    func push(module: UIViewController, animated: Bool)
    func push(module: UIViewController, animated: Bool, hideTabBar: Bool)
    
}


extension ModuleTransitionable where Self: UIViewController {
    func push(module: UIViewController, animated: Bool) {
        self.navigationController?.pushViewController(module, animated: animated)
    }
    
    func push(module: UIViewController, animated: Bool, hideTabBar: Bool = false) {
        module.hidesBottomBarWhenPushed = hideTabBar
        self.push(module: module, animated: animated)
    }
    
}
