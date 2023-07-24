//
//  DatePickerViewController.swift
//  NewlyCoinedWord
//
//  Created by Taekwon Lee on 2023/07/20.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    @IBOutlet var datePicker: UIDatePicker!
    
    @IBOutlet var topLeftView: UIView!
    @IBOutlet var topRightView: UIView!
    @IBOutlet var bottomLeftView: UIView!
    @IBOutlet var bottomRightView: UIView!
    
    @IBOutlet var topLeftImageView: UIImageView!
    @IBOutlet var topRightImageView: UIImageView!
    @IBOutlet var bottomLeftImageView: UIImageView!
    @IBOutlet var bottomRightImageView: UIImageView!

    @IBOutlet var dateLabelTopLeft: UILabel!
    @IBOutlet var dateLabelTopRight: UILabel!
    @IBOutlet var dateLabelBottomLeft: UILabel!
    @IBOutlet var dateLabelBottomRight: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designView()
        designDatePicker()
        datePickerValueChanged(datePicker)
//        testViewProperty()
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {

        // sender.date, datePicker.date -> 영국 시각
        
        let dateLabelArray: [UILabel] = [dateLabelTopLeft, dateLabelTopRight, dateLabelBottomLeft, dateLabelBottomRight]
        
        for i in dateLabelArray.indices {
            let calendarDate = Calendar.current.date(byAdding: .day, value: (i+1) * 100, to: sender.date)
            let format = DateFormatter() // DateFormatter: 1. 시간대 변경 2. 날짜의 포맷 변경
            format.dateFormat = "YYYY년 M월 dd일" // "YYYY년 MM월 dd일"
            let date = format.string(from: calendarDate!)
            dateLabelArray[i].text = date
        }
    }
    
    func designView() {
        designImageView(view: topLeftView, image: topLeftImageView)
        designImageView(view: topRightView, image: topRightImageView)
        designImageView(view: bottomLeftView, image: bottomLeftImageView)
        designImageView(view: bottomRightView, image: bottomRightImageView)
    }
    
    func designImageView(view: UIView, image: UIImageView) {
        image.layer.cornerRadius = 30
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 10, height: 10) // viewGSize(width: 0, height: 0) 햇빛이 비치는 방향 (0는 정가운데에서 햇빛을 받았을 때)
        view.layer.shadowRadius = 5 // 퍼짐의 정도
        view.layer.shadowOpacity = 0.3 // 불투명도(0~1)
        view.clipsToBounds = false
        
    }
    
    func testViewProperty() {
        dateLabelTopLeft.layer.cornerRadius = 30
        
        dateLabelTopLeft.layer.shadowColor = UIColor.black.cgColor
        dateLabelTopLeft.layer.shadowOffset = CGSize(width: 10, height: 10)
        dateLabelTopLeft.layer.shadowRadius = 5 // 퍼짐의 정도
        dateLabelTopLeft.layer.shadowOpacity = 0.2 // 불투명도(0~1)
        
        dateLabelTopLeft.clipsToBounds = true
        
        // dateLabelTopRight.layer.shadowOffset = CGSize(width: 0, height: 0) // .zero 햇빛이 비치는 방향 (0는 정가운데에서 햇빛을 받았을 때)
    }
    
    func designDatePicker() {
        datePicker.tintColor = .systemPink
        
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        } else {
            datePicker.preferredDatePickerStyle = .wheels
        }
        
    }
}
