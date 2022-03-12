//
//  Extensions.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/12.
//

import Foundation
import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
