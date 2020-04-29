//
//  ViewController.swift
//  restaurantCheck
//
//  Created by 林祐辰 on 2020/4/28.
//  Copyright © 2020 smirkiiiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
     // 預設確認名字, 因為還不知道叫麼, 所以令空字串
     var realName = ""
     
     // 預設確認的男生分類號, 先將分類號碼設為0
     var genderIndex = 0
     
     // 預設電話號碼
     var realPhoneNum = ""
 
     // 對的電話號碼,因為不會變 所以使用let 宣告
     let phoneNum1 = "0912345678"
     let phoneNum2 = "0800666666"
 
     // 預設預約人數
     var realReservePeople = 0
  
     // 日期挑選器
     var reserveTimePick = UIDatePicker()
    
    
    @IBOutlet weak var selectGender: UISegmentedControl!  // 性別分類元件
    @IBOutlet weak var peopleSum: UIStepper!    // 計算人數的步進器
    @IBOutlet weak var showPeople: UILabel!     // 顯示預約人數
    @IBOutlet weak var reservedDate: UITextField!   //將預約日期寫在文字輸入框裡面,故生一個文字輸入框
    @IBOutlet weak var successView: UIImageView!   // 預約成功的圖
    @IBOutlet weak var successText: UILabel!      // 預約成功的文字
    @IBOutlet weak var failedView: UIImageView!   // 預約失敗的圖
    @IBOutlet weak var failedText: UILabel!       // 預約失敗的文字

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bgimg.jpg")!)  // 載入背景圖
     successView.isHidden = true  // 預約成功的圖是否要被隱藏
     successText.isHidden = true  // 預約成功的文字是否要被隱藏
     failedView.isHidden = true    // 預約失敗的圖是否要被隱藏
     failedText.isHidden = true    // 預約失敗的文字是否要被隱藏
     checkReserveTime()  // 處理在文字輸入框內 ,預約日期該如何呈現的函式
    }
   
    // 載入名字輸入框所輸入的名字
    @IBAction func changeName(_ sender: UITextField) {
        realName = sender.text!
        print(realName)
    }
    
    // 載入電話輸入框所輸入的電話
    @IBAction func changePhoneNum(_ sender: UITextField) {
        realPhoneNum = sender.text!
        print(realPhoneNum)
    }
    
    // 載入分類號碼
    @IBAction func checkGender(_ sender: UISegmentedControl) {
        genderIndex = sender.selectedSegmentIndex
    }
    
    // 載入日期
    @IBAction func checkDate(_ sender: UITextField) {
        realReserveDate = sender.text!
    }
    
    // 載入計算人數的數字
    @IBAction func checkReserve(_ sender: UIStepper) {
        realReservePeople = Int(sender.value)
        showPeople.text = "\(realReservePeople) People"
    }
    
    // 條件確認鍵, 透過此件來判別結果對或錯
    
    // 此範例依照性別來做二分法
    // 依照條件來決定呈現的圖及文字
    
    @IBAction func confirmAll(_ sender: UIButton) {
        
        if (genderIndex == 0){
            if(realName == "Didi" && realPhoneNum == phoneNum1 && realReservePeople == 4 && reservedDate.text == "03/07/2020"){
                successView.isHidden = false
                successText.isHidden = false
                failedView.isHidden = true
                failedText.isHidden = true
                
            }else {
                successView.isHidden = true
                successText.isHidden = true
                failedView.isHidden = false
                failedText.isHidden = false
                print(realReserveDate)
            }
        }else if (genderIndex == 1) {
            if(realName == "Naomi" && realPhoneNum == phoneNum2 && realReservePeople == 2 && reservedDate.text == "05/23/2020"){
                     successView.isHidden = false
                     successText.isHidden = false
                     failedView.isHidden = true
                     failedText.isHidden = true
                
             }else{
                successView.isHidden = true
                successText.isHidden = true
                failedView.isHidden = false
                failedText.isHidden = false
            }
        }

    
}

    
    func checkReserveTime(){
        
        let timePickerToolbar = UIToolbar() // 創立一個功能欄位
        timePickerToolbar.sizeToFit()   // 設定功能欄位的大小跟手機螢幕大小一樣
        
        let toolBarButtion = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(finishCheckDate))  // 功能欄位上方的功能列的按鈕
        
        // 將功能列的按鈕插入到按鈕欄位中, 並且將功能欄位的呈現方式設為由下慢慢至上
        timePickerToolbar.setItems([toolBarButtion], animated: true)
        
        
        reservedDate.inputAccessoryView = timePickerToolbar  // 文字輸入框插入功能欄位
        reservedDate.inputView = reserveTimePick   // 同時也插入日期挑選器
        
        reserveTimePick.datePickerMode = .date   // 日期挑選器的格式
        
    }
    
    @objc func finishCheckDate(){
        let pickDateFormat = DateFormatter()  // DateFormatter() 為時間字串產生器
        pickDateFormat.dateFormat = "MM/dd/yyyy"   // 時間字串產生器中要修改格式的屬性為  .dateFormat
       
        // 日期挑選器挑的日期 , 透過 string(from:)方法 將指定的日期格式轉換成字串
        // from:  裡面裝的就是日期挑選器挑的日期
        
        reservedDate.text = pickDateFormat.string(from:reserveTimePick.date)
//        print(reservedDate.text)
      self.view.endEditing(true)    // 點Done這個按鈕時 是否要結束編輯 ?  A: 是
        
    }


}
