//
//  ViewController.swift
//  Iakkai Saga - The Curse of Blood
//
//  Created by Yeray on 8/7/21.
//

import UIKit
import BokenEngine

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Boken Engine initialization
        let sceneManager = try! SceneManager()
        sceneManager.setRootView(self.view)
        try! sceneManager.loadTitleScene()
    }


}

