//
//  ViewController.swift
//  ImageView
//
//  Created by 주찬영 on 2022/04/06.
//

import UIKit

class ViewController: UIViewController {
    
    var isZoom = false // 확대 여부를 나타내는 변수
    var imgOn: UIImage? // 켜진 전구 이미지가 있는 UIImage 타입의 변수
    var imgOff: UIImage? // 꺼진 전구 이미지가 있는 UIImage 타입의 변수
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        imgView.image = imgOn
    }

    // 버튼을 눌렀을때 동작하는 액션 함수 구현
    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale:CGFloat = 2.0 // 크기를 늘릴 값 셋팅
        var newWidth:CGFloat, newHeight:CGFloat
        
        if(isZoom){ // isZoom == true(현재 상태가 확대일때)
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            btnResize.setTitle("확대", for: .normal)
        }
        else { // isZoom == false (현재 상태가 축소일때)
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            btnResize.setTitle("축소", for: .normal)
        }
        
        // 이미지 뷰 프레임 크기를 CGSize()를 이용하여 변경
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        
        isZoom = !isZoom // 맨 마지막에는 반전시켜야 함
    }
    
    // 스위치 클릭시 동작하는 액션 함수
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        
        if sender.isOn{ // 스위치가 ON인 경우
            imgView.image = imgOn
        }
        else { // 스위치가 OFF인 경우
            imgView.image = imgOff
        }
    }
    
}

