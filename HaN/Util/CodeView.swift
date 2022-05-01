//
//  CodeView.swift
//  HaN
//
//  Created by Jaber Shamali on 01/05/22.
//

import UIKit
import SnapKit

protocol CodeView{
    func buildHierarchy()
    func configConstraints()
    func additionalConfig()
    func setupView()
}

extension CodeView{
    func setupView(){
        buildHierarchy()
        configConstraints()
        additionalConfig()
    }
}
