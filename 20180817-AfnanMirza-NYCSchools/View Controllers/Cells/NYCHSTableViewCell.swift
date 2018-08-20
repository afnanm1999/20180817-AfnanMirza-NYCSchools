//
//  NYCHSTableViewCell.swift
//  20180817-AfnanMirza-NYCSchools
//
//  Created by Afnan Mirza on 8/20/18.
//  Copyright © 2018 Afnan Mirza. All rights reserved.
//

import UIKit



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
        
        self.sideBarView.backgroundColor = UIColor.randomColorForCardViewCell()
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
