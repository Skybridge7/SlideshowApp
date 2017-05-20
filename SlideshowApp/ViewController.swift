//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Hiroko Narita on 2017/05/08.
//  Copyright © 2017 Skybridge7. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var dispImageNo = 0
    // 部品の宣言
    let backButton = UIButton()
    let forwardButton = UIButton()
    let playStopButton = UIButton()
    
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
    
    @IBAction func playStop( sender: Any) {
        playStopButton.addTarget(self, action: #selector(updateTimer), for: .touchUpInside)
        
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil {
            timer = Timer(timeInterval: 2.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
        //ボタンのテキストをタップ時に変更する
        playStopButton.setTitle("停止", for: [])
        // ボタン無効化
        backButton.isEnabled = false
        forwardButton.isEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        playStopButton.setTitle("再生する", for: UIControlState.normal)
        playStopButton.setTitleColor(UIColor.blue, for: UIControlState.normal)
        // 押された時
        playStopButton.setTitle("停止する", for: UIControlState.highlighted)
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
