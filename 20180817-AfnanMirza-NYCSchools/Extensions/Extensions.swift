//
//  Extensions.swift
//  20180817-AfnanMirza-NYCSchools
//
//  Created by Afnan Mirza on 8/18/18.
//  Copyright © 2018 Afnan Mirza. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func slice(from: String, to: String) -> String? {
        
        return (range(of: from)?.upperBound).flatMap { substringFrom in
            (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
                String(self[substringFrom..<substringTo])
            }
        }
    }
}
