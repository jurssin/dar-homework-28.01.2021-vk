//
//  Extensions.swift
//  Lesson - 4
//
//  Created by User on 1/28/21.
//  Copyright © 2021 Syrym Zhursin. All rights reserved.
//

import UIKit

extension UITextField {
    func setLeftPaddingPoints(_ space: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: space, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
