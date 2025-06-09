//
//  EdgeInsetsExtensions.swift
//  TeeTimeCaddie
//
//  Created by Brad Ball on 3/11/24.
//

import Foundation
import SwiftUI

extension EdgeInsets {
    /// Convenience initializer to set `EdgeInsets` with equal values on either side (horizontal and vertical).
    /// - Parameters:
    ///   - horizontal: An inset value that will be applied to the leading and trailing edges.
    ///   - vertical: An inset value that will be applied to the top and bottom edges.
    public init(horizontal: CGFloat = 0, vertical: CGFloat = 0) {
        self.init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
    }
}
