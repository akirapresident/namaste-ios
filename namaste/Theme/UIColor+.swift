//
//  UIColor+.swift
//  namaste
//
//  Created by akira tsukamoto on 02/05/21.
//

import UIKit

extension UIColor {
  struct Theme {
    static var orange: UIColor { return UIColor(rgb: 0xEE6C4D) }
    static var darkGray: UIColor { return UIColor(rgb: 0x878787) }
    static var lightOrange: UIColor { return UIColor(red: 252/255, green: 175/255, blue: 156/255, alpha: 1) }
    static var lightGray: UIColor { return UIColor(rgb: 0xE8E8E8) }
    static var backgroundGray: UIColor { return UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1) }
    static var textGray: UIColor { return UIColor(red: 132/255, green: 132/255, blue: 132/255, alpha: 1) }
    static var lineGray: UIColor { return UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1) }
    static var evenLighterOrange: UIColor { return UIColor(red: 253/255, green: 241/255, blue: 238/255, alpha: 1) }
    static var lightBlack: UIColor { return UIColor(red: 72/255, green: 72/255, blue: 72/255, alpha: 1) }
  }
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
