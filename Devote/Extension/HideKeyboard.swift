//
//  HideKeyboard.swift
//  Devote
//
//  Created by Shazeen Thowfeek on 26/03/2024.
//

import SwiftUI

#if canImport(UIKit)
extension View{
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
