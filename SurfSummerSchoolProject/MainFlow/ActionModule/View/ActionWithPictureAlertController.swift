//
//  ActionWithPictureAlertController.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 15/08/22.
//

import Foundation
import UIKit


class ActionWithPictureAlertController: UIAlertController {
    
    //MARK: - Properties
    
    private var output: ActionWithPictureModuleOutput!
    private var item: ItemModel!
    
    //MARK: - UIAlertController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cancelAction = UIAlertAction(title: "Нет", style: .default) { [weak self] _ in
            self?.dismiss(animated: true)
        }
        let removeAction = UIAlertAction(title: "Да, точно", style: .default) { [weak self] _ in
            guard let self = self else {
                return
            }
            self.output?.remove(item: self.item)
        }
        addAction(cancelAction)
        addAction(removeAction)
        preferredAction = removeAction
    }
    
    //MARK: - Internal methods
    
    func configure(output: ActionWithPictureModuleOutput, item: ItemModel) {
        self.output = output
        self.item = item
    }
}
