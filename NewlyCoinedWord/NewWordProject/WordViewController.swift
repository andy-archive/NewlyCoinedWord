//
//  WordViewController.swift
//  NewlyCoinedWord
//
//  Created by Taekwon Lee on 2023/07/21.
//

import UIKit

class WordViewController: UIViewController {

    @IBOutlet var wordTextField: UITextField!
    @IBOutlet var wordFirstButton: UIButton!
    @IBOutlet var wordButtons: [UIButton]!
    @IBOutlet var resultLabel: UILabel!
    
    let newWordDictionary: [String: String] = [
        "갓생": "생산적이고 계획적인 삶",
        "사바사": "사람마다 다르다",
        "마상": "마음에 상처",
        "소확행": "소박하지만 확실한 행복",
        "댕댕이": "멍멍이",
        "머머리": "대머리",
        "별다줄": "별 걸 다 줄이네",
        "알잘딱깔센": "알아서 잘 딱 깔끔하고 센스 있게",
        "오점뭐": "오늘 점심 뭐 먹지",
        "존맛탱": "매우 맛있다",
        "jmt": "매우 맛있다",
        "JMT": "매우 맛있다",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designWordTextField()
        designWordButtons()
        
        wordTextField.text = getRandomWord()
   
        //wordFirstButton.isHidden = true
        //wordFirstButton.titleLabel?.font = .systemFont(ofSize: 20)
        //wordFirstButton.titleLabel?.textColor = .black
    }
    
    @discardableResult
    func getRandomWord() -> String {
        return newWordDictionary.keys.randomElement()!
    }
    
    func designWordTextField() {
        wordTextField.backgroundColor = .white
        wordTextField.layer.borderColor = UIColor.black.cgColor
        wordTextField.layer.borderWidth = 3
    }
    
    func designWordButtons() {
        for wordButton in wordButtons {
            wordButton.tintColor = .black
            wordButton.backgroundColor = .white
            wordButton.layer.borderColor = UIColor.black.cgColor
            wordButton.layer.borderWidth = 1
        }
    }
    
    @IBAction func endEditingTextField(_ sender: UITextField) {
    }
    
    @IBAction func tapGestureTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    // 버튼 클릭 시 텍스트필드의 텍스트에 버튼 타이틀이 들어감
    // 1.
    @IBAction func wordButtonTapped(_ sender: UIButton) {
    
        //2.
        // sender.currentTitle vs sender.titleLabel?.text
        // iOS 15 이상일 경우 button 스타일을 Plain이 아닌 Default로 해야 nil이 안 뜸
        // 혹은 currentTitle 대신 titleLabel?.text 쓰기
        wordTextField.text = sender.currentTitle // 왜 안돼? nil이 뜨네
        wordTextField.text = sender.titleLabel?.text
        
        // 버튼 클릭 시 숨기기
        //sender.isHidden = true
        
        //3.
        textFieldKeyboardTapped(wordTextField)
    }
    
    @IBAction func textFieldKeyboardTapped(_ sender: UITextField) {
        //print("DidEndOnExit")
        //resultLabel.text = wordTextField.text
        
        for inputWord in newWordDictionary.keys {
            if inputWord == wordTextField.text?.lowercased() {
                resultLabel.text = newWordDictionary[inputWord]!
                break
            }
        }
        
        /*
         ///강의 1 - switch/case
        switch wordTextField.text?.lowercased() {
        case "별다줄":
            resultLabel.text = "별 걸 다 줄이네"
        case "알잘딱깔센":
            resultLabel.text = "알아서 잘 딱 깔끔하고 센스 있게"
        case "오점뭐":
            resultLabel.text = "오늘 점심 뭐 먹지"
        case "jmt", "JMT", "존맛탱":
            resultLabel.text = "매우 맛있다"
        default:
            resultLabel.text = "결과를 찾지 못했습니다"
        }

         ///강의 2 - if/else
        if wordTextField.text == "별다줄" {
            resultLabel.text = "별 걸 다 줄이네"
        } else if wordTextField.text == "알잘딱깔센" {
            resultLabel.text = "알아서 잘 딱 깔끔하고 센스 있게"
        } else if wordTextField.text == "오점뭐" {
            resultLabel.text = "오늘 점심 뭐 먹지"
        } else {
            resultLabel.text = "결과를 찾지 못했습니다"
        }
         */
        
    }
}
