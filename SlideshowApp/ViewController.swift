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
    
    /*
     このボタンのStoryboardの紐付きが切れておりますので、設定し直してください。
     */
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
    // これはViewControllerプロパティなので上に持って来ましょう
    let imageNameArray = ["初夏.jpg", "初秋.jpg", "仲秋.JPG", "冬.JPG"]
    
    @IBAction func playStop(_ sender: Any) {
        
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        // タイマーが起動しているかしていないか(厳密に言うとself.timerがnilかnilじゃないか)で再生/停止の制御をしている
        if self.timer == nil {
            // つまり、この時画面の状態は 停止->再生へ
            timer = Timer(timeInterval: 2.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            timer?.fire()
            
            /*
             ここで停止から再生への処理
             しなければいけないことは 
             1. 次へボタン、前へボタンの無効化
             2. 再生ボタンのタイトルを「停止」へ
            */
        } else {
            // つまり、この時画面の状態は 再生->停止へ
            
            /*
             ここで停止から再生への処理
             しなければいけないことは
             1. timerの破棄処理(停止)
             2. 次へボタン、前へボタンの有効化
             3. 再生ボタンのタイトルを「再生」へ
             */
        }
        
        // ボタン無効化
        backButton.isEnabled = false
        forwardButton.isEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // このメソッドはその名の通り、viewがロードされた時に呼ばれるので、
        // 初期設定になりますので、ボタンを押していない時の設定などはできません(する方法はありますが、今まで学んできたことを考えるとできないと考えた方が良いです)
        
        // Do any additional setup after loading the view, typically from a nib.
        // ボタンを押していないときの設定
        playStopButton.setTitle("再生する", for: .normal)
        playStopButton.setTitleColor(UIColor.white, for: .normal)
        // ボタンを押したときの設定
        playStopButton.setTitle("停止する", for: .highlighted)
        playStopButton.setTitleColor(UIColor.blue, for: .highlighted)
        
        // これは以下に書き換えた方がいいですね。
        // let image = UIImage(named: imageNameArray[dispImageNo])
        // 理由としては、基本的に画像ファイル名を管理しているのはimageNameArrayということで住み分けができるため、要は画像変更したいなと思った時はそこを変更するだけで良いようにする
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
