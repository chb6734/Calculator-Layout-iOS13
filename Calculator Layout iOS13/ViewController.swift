//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var resultValue = 0
    var strDisplay : String = ""
    var boolCal : Bool = false;
    var disNumArr : Array<String> = []
    
    @IBOutlet weak var dpLabel: UILabel!
    @IBOutlet weak var dpCalLabel: UILabel!
    
    //숫자와 .을 눌렀을 때 화면에 표시
    @IBAction func number_Clicked(_ sender: UIButton)
    {
        
        
        if boolCal == false
        {
            fnViewNum(tag: String(sender.tag))
        }
        fnArrToDisplay()
        
        dpLabel.text = strDisplay
        strDisplay = ""
    }
    
    // 사칙연산 버튼 눌렀을 때 이벤트
    @IBAction func cal_Clicked(_ sender: UIButton)
    {
        
        
    }
    
    // AC 버튼 클릭시 이벤트
    @IBAction func acbtn_Clicked(_ sender: UIButton) {
        resultValue = 0
        strDisplay = ""
        dpLabel.text = "0"
        disNumArr.removeAll()
    }
    
    // 숫자버튼 눌렀을 때 디스플레이 띄우는 로직
    func fnViewNum(tag: String){
        
        //'.'일 때
        if tag == "10"
        {
            //.버튼이 처음 눌렸을 때 0.으로 표기
            if disNumArr.isEmpty
            {
                //"."이 arr에 있는지 검사
                //---------------------
                if fnFindViewNum(findValue: ".", cArray: disNumArr) {
                    return;
                }
                //---------------------
                disNumArr.append("0")
                disNumArr.append(".")
                
                // .버튼이 중간에 눌렸을 때
            }else{
                //"."이 arr에 있는지 검사
                //---------------------
                if fnFindViewNum(findValue: ".", cArray: disNumArr) {
                    return;
                }
                //---------------------
                disNumArr.append(".")
            }
            // '.'이 아닌 숫자일 때
        }else
        {
            disNumArr.append(String(tag))
        }
        
    }
    
    //arr를 display에 띄워줄 string으로 병합
    func fnArrToDisplay(){
        for i in 0 ... disNumArr.count - 1
        {
            strDisplay += String(disNumArr[i])
        }
    }
    
    
    // 배열 안에 같은 값이 있는지 비교
    func fnFindViewNum(findValue : String, cArray : [String]) -> Bool{
        for i in cArray {
            if(i == findValue){
                return true;
            }
        }
        return false;
    }
}

