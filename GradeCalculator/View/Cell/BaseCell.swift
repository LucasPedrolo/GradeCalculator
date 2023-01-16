//
//  BaseCell.swift
//  GradeCalculator
//
//  Created by unicred on 16/01/23.
//

import UIKit

class BaseCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        setConstraint()
        
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: has not been implemented")
    }
    
    func addSubview() {
        // do nothing
    }
    
    func setConstraint() {
        // do nothing
    }
}
