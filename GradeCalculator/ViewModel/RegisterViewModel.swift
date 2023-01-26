//
//  RegisterViewModel.swift
//  GradeCalculator
//
//  Created by unicred on 13/01/23.
//

import Foundation

class RegisterViewModel {
    
    func dataGrade(name: String?, subject: Subject?) -> Register?  {
        if (name?.isEmpty == false && subject?.titleSubject?.isEmpty == false) {
            
            let register = Register(name: name,
                                    subject: subject)
            return register
        } else {
            print("Error")
            return nil
        }
    }
}
