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
        let goHome = GradeCollectionViewController()
        let validation = viewModel.dataGrade(
            name: registerView.nameTxtField.text ?? defString,
                   subject: Subject(
                       titleSubject: registerView.subjectTxtField.text,
                       grades: GradeData(
                           firstGrande: Int(registerView.grade1TxtField.text ?? defString) ?? defInt,
                           secondGrade: Int(registerView.grade1TxtField.text ?? defString) ?? defInt,
                           thirdGrade: Int(registerView.grade1TxtField.text ?? defString) ?? defInt,
                           fourthGrade: Int(registerView.grade1TxtField.text ?? defString) ?? defInt)))
        
        if validation != nil {
            if let validation = validation {
                goHome.getData(data: validation)
            }
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
