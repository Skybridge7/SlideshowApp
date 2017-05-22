//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Hiroko Narita on 2017/05/08.
//  Copyright © 2017 Skybridge7
// All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playStopButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!

    @IBOutlet weak var imageView: UIImageView!
    
    var dispImageNo = 0
    //タイマーの生成
    var timer: Timer?
    var timer_sec: Float = 0
    // Timerによって、一定の間隔で呼び出される関数
    
    func updateTimer(timer: Timer)
    {
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }

    // 画像の名前の配列
    let imageNameArray = ["初夏.jpg", "初秋.jpg", "仲秋.JPG", "冬.JPG"]
    
    @IBAction func playStop(_ sender: Any) {
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil {
            timer = Timer(timeInterval: 2.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            timer?.fire()
        }
        
        // ボタン無効化
        backButton.isEnabled = false
        forwardButton.isEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // ボタンを押していないときの設定
        playStopButton.setTitle("再生する", for: .normal)
        playStopButton.setTitleColor(UIColor.white, for: .normal)
        // ボタンを押したときの設定
        playStopButton.setTitle("停止する", for: .highlighted)
        playStopButton.setTitleColor(UIColor.blue, for: .highlighted)
           
        let image = UIImage(named:"初夏.jpg")
        imageView.image = image
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: Any) {
        // 表示している画像の番号を1減らす
        dispImageNo -= 1
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    @IBAction func forward(_ sender: Any) {
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 3
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 3 {
            dispImageNo = 0
        }
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        imageView.image = UIImage(named: name)
    }
    
}
