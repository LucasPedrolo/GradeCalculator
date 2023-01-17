//
//  RegisterViewModel.swift
//  GradeCalculator
//
//  Created by unicred on 13/01/23.
//

import Foundation

class RegisterViewModel {
    
    func dataGrade(grade1: String, grade2: String, grade3: String, grade4: String, name: String, subject: String) -> Register?  {
        
        if grade1.isEmpty || grade2.isEmpty || grade3.isEmpty || grade4.isEmpty || name.isEmpty || subject.isEmpty {
            print("Error")
            
            return nil
        } else {
            let register = Register(name: name, subject: subject, grade1: grade1, grade2: grade2, grade3: grade3, grade4: grade4)
            
            return register
        }
    }
}
