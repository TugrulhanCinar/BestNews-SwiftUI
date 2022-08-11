//
//  ColorExtension.swift
//  BestNews-SwiftUI
//
//  Created by Tugrulhan Çınar on 11.08.2022.
//

import SwiftUI

enum AssetColors: String  {
    case bnBlue
    case bnSecondary
}

// MARK: - Colors

extension UIColor {

    @nonobjc class var bnBlue: UIColor {
        return UIColor(named: AssetColors.bnBlue.rawValue)!
    }

    @nonobjc class var bnSecondary: UIColor {
        return UIColor(named: AssetColors.bnSecondary.rawValue)!
    }
}

// MARK: - UIColorExtension

extension UIColor {

    var color: Color {
        return Color(self)
    }
}
