//
//  NYCHSTableViewCell.swift
//  20180817-AfnanMirza-NYCSchools
//
//  Created by Afnan Mirza on 8/20/18.
//  Copyright © 2018 Afnan Mirza. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func randomColorForCardView() -> UIColor {
        let lightRed: UIColor? = UIColor(red: 0.925, green: 0.290, blue: 0.255, alpha: 1.00)
        let lightBlue: UIColor? = UIColor(red: 0.000, green: 0.639, blue: 0.812, alpha: 1.00)
        let lightGray: UIColor? = UIColor(red: 0.773, green: 0.773, blue: 0.773, alpha: 1.00)
        let indigo: UIColor? = UIColor(red: 0.361, green: 0.420, blue: 0.753, alpha: 1.00)
        let green: UIColor? = UIColor(red: 0.298, green: 0.686, blue: 0.314, alpha: 1.00)
        let yellow: UIColor? = UIColor(red: 1.000, green: 0.933, blue: 0.345, alpha: 1.00)
        let deepOrange: UIColor? = UIColor(red: 1.000, green: 0.439, blue: 0.263, alpha: 1.00)
        
        let sideBarColorArr: [UIColor] = [lightRed!, lightBlue!, lightGray!, indigo!, green!, yellow!, deepOrange!]
        
        let randomNumber = arc4random_uniform(UInt32(sideBarColorArr.count))
        
        return sideBarColorArr[Int(randomNumber)]
    }
    
}

class NYCHSTableViewCell: UITableViewCell {

    // MARK: IBOutlet
    @IBOutlet var cardView: UIView!
    @IBOutlet var sideBarView: UIView!
    
    @IBOutlet var schoolNameLbl: UILabel!
    @IBOutlet var schoolAddrLbl: UILabel!
    @IBOutlet var schoolPhoneNumLbl: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        chooseRandomColorForCard()
        setupCardViewShadows()
        
        self.schoolPhoneNumLbl.layer.cornerRadius = 15
        
    }
    
    // MARK: Card View Customization Functions
    
    func chooseRandomColorForCard(){
        
        self.sideBarView.backgroundColor = UIColor.randomColorForCardView()
    }
    
    func setupCardViewShadows(){
        let view = cardView
        view?.layer.cornerRadius = 15.0
        view?.layer.shadowColor = UIColor.black.cgColor
        view?.layer.shadowOffset = CGSize(width: 0, height: 2)
        view?.layer.shadowOpacity = 0.8
        view?.layer.shadowRadius = 3
        view?.layer.masksToBounds = false
    }


}
