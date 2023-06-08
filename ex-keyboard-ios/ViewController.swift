//
//  ViewController.swift
//  ex-keyboard-ios
//
//  Created by cubicinc on 2023/06/07.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var baseView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLb: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "가입하신 이메일을 입력해주세요"
        return label
    }()
    
    lazy var textfield: UITextField = {
        var view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = "이메일을 입력해주세요"
        return view
    }()

    lazy var bottomButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("임시 비밀번호 이메일로 보내기", for: .normal)
        button.backgroundColor = .systemGray5
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return button
    }()
    
    // 하단 노치와 버튼 색상을 통일하는 뷰
    lazy var bottomBaseView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "비밀먼호 재설정"
        view.backgroundColor = .white
        addViews()
        applyConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.addKeyboardNotifications()
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.removeKeyboardNotifications()
    }
    
    // 노티피케이션을 추가하는 메서드
    func addKeyboardNotifications(){
        // 키보드가 나타날 때 앱에게 알리는 메서드 추가
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification , object: nil)
        // 키보드가 사라질 때 앱에게 알리는 메서드 추가
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    // 노티피케이션을 제거하는 메서드
    func removeKeyboardNotifications(){
        // 키보드가 나타날 때 앱에게 알리는 메서드 제거
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification , object: nil)
        // 키보드가 사라질 때 앱에게 알리는 메서드 제거
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ noti: NSNotification){
        // 키보드가 나타날 때 코드

    }

    @objc func keyboardWillHide(_ noti: NSNotification){
        // 키보드가 사라졌을 때 코드
    }
    
    fileprivate func addViews() {
        view.addSubview(baseView)
        baseView.addSubview(titleLb)
        baseView.addSubview(textfield)
        baseView.addSubview(bottomButton)
        view.addSubview(bottomBaseView)
    }

    fileprivate func applyConstraints() {
        let baseViewConstraints = [
            baseView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            baseView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            baseView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            baseView.bottomAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.bottomAnchor)
        ]
        
        let titleLbConstraints = [
            titleLb.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 30),
            titleLb.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 30),
        ]
        
        let textfieldConstraints = [
            textfield.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 30),
            textfield.topAnchor.constraint(equalTo: titleLb.bottomAnchor, constant: 20),
        ]
        
        let bottomButtonConstraints = [
            bottomButton.leadingAnchor.constraint(equalTo: baseView.leadingAnchor),
            bottomButton.trailingAnchor.constraint(equalTo: baseView.trailingAnchor),
            bottomButton.bottomAnchor.constraint(equalTo: baseView.bottomAnchor),
            bottomButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let bottomBaseViewConstraints = [
            bottomBaseView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomBaseView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomBaseView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomBaseView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ]
        
        NSLayoutConstraint.activate(baseViewConstraints)
        NSLayoutConstraint.activate(titleLbConstraints)
        NSLayoutConstraint.activate(textfieldConstraints)
        NSLayoutConstraint.activate(bottomButtonConstraints)
        NSLayoutConstraint.activate(bottomBaseViewConstraints)

    }
}

