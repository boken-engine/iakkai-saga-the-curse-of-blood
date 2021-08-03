//
//  ViewController.swift
//  Iakkai Saga - The Curse of Blood
//
//  Created by Yeray on 8/7/21.
//

import UIKit
import BokenEngine
import os


class ViewController: UIViewController {

    var sceneManager: SceneManager? = nil
    var lastUpdateTime: Int64 = 0;
    var rotationManager: RotationManager? = nil;
    
    override func viewDidLoad() {
        
        do {
            sceneManager = try SceneManager()
        } catch {
            print(error.localizedDescription)
        }
        
        super.viewDidLoad()

        sceneManager!.setRootView(self.view)
        try! sceneManager!.loadTitleScene()
        
        rotationManager = RotationManager(sceneManager: sceneManager!)
    }

}
