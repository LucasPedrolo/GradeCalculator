//
//  RegisterViewController.swift
//  GradeCalculator
//
//  Created by unicred on 13/01/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let registerView = RegisterView()
    let viewModel = RegisterViewModel()
    
    override func loadView() {
        view = registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addDelegates()
        
        registerView.goHomeButton.addTarget(self, action: #selector(navigation), for: .touchUpInside)
    }
    
    func addDelegates() {
        registerView.nameTxtField.delegate = self
        registerView.subjectTxtField.delegate = self
        registerView.grade1TxtField.delegate = self
        registerView.grade2TxtField.delegate = self
        registerView.grade3TxtField.delegate = self
        registerView.grade4TxtField.delegate = self
    }
    
    @objc func navigation() {
        let goHome = HomeViewController()
        let validation = viewModel.dataGrade(grade1: registerView.grade1TxtField.text ?? defString, grade2: registerView.grade2TxtField.text ?? defString, grade3: registerView.grade3TxtField.text ?? defString, grade4: registerView.grade4TxtField.text ?? defString, name: registerView.nameTxtField.text ?? defString, subject: registerView.subjectTxtField.text ?? defString)
        
        if validation != nil {
            goHome.getData(data: validation ?? Register())
            navigationController?.pushViewController(goHome, animated: true)
        } else {
            print("Error")
        }
    }
}

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.isEqual(registerView.nameTxtField) {
            registerView.subjectTxtField.becomeFirstResponder()
        }
        if textField.isEqual(registerView.subjectTxtField) {
            registerView.grade1TxtField.becomeFirstResponder()
        }
        if textField.isEqual(registerView.grade1TxtField) {
            registerView.grade2TxtField.becomeFirstResponder()
        }
        if textField.isEqual(registerView.grade2TxtField) {
            registerView.grade3TxtField.becomeFirstResponder()
        }
        if textField.isEqual(registerView.grade3TxtField) {
            registerView.grade4TxtField.becomeFirstResponder()
        } else {
            registerView.grade4TxtField.resignFirstResponder()
            navigation()
        }
        
        return true
    }
}
