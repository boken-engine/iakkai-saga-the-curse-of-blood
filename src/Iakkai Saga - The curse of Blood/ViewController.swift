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
    
    override func viewDidLoad() {
        
        do {
            sceneManager = try SceneManager()
        } catch {
            print(error.localizedDescription)
        }
        
        super.viewDidLoad()

        sceneManager!.setRootView(self.view)
        try! sceneManager!.loadTitleScene()
        NotificationCenter.default.addObserver(self, selector: #selector(self.deviceHasRotated),
           name: UIDevice.orientationDidChangeNotification,
             object: nil)
    }

    func printDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss.SSSS"
        return formatter.string(from: date)
    }
    
    @objc func deviceHasRotated() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            let currentTime = Int64(Date().timeIntervalSince1970 * 1000);
            print("Device orientation change detected at "+String(currentTime))
            if (currentTime - self.lastUpdateTime > 1000) {
                try! self.sceneManager!.loadCurrentScene()
                print("Reloading current scene")
            }
            self.lastUpdateTime = currentTime
        }
    }
}
