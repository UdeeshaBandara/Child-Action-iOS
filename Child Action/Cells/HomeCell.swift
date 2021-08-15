//
//  HomeCell.swift
//  Child Action
//
//  Created by Fixel Dev on 8/14/21.
//

import Foundation
import UIKit
import SnapKit


class HomeCell: UICollectionViewCell {
    
    
    let homeCellBackgroundView : UIView = {
        
        let view = UIView()
        view.layer.cornerRadius = 15
        view.layer.shadowColor = #colorLiteral(red: 0.8691173792, green: 0.9128888249, blue: 0.971139729, alpha: 1)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
        view.layer.borderColor = #colorLiteral(red: 0.9521474242, green: 0.9616398215, blue: 0.9883304238, alpha: 1)
        view.layer.borderWidth = 1
       
        
        return view
        
    }()
    let horizontalStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        stackView.spacing  = 5
        stackView.axis = .horizontal
        
        
        return stackView
    }()
  
    let callerImage : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "home_logo_child_help"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        return imgView
    }()
    let callImage : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "call_icon"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        return imgView
    }()
    
    
    let callerNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        lbl.font = UIFont(name:"OpenSans-SemiBold",size:13)
        lbl.textAlignment = .left
       
        return lbl
    }()
    
    let callerNumberLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.translatesAutoresizingMaskIntoConstraints = false
       
        lbl.font = UIFont(name:"OpenSans-Bold",size:16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let transparentSubView : CustomView = {
        
        let view = CustomView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2240475171)
        
        view.clipsToBounds = true
       
        return view
        
    }()
    let rightView : UIView = {
        
        let view = UIView()
      
        
        return view
        
    }()
    let rightSubView : UIView = {
        
        let view = UIView()
        
        return view
        
    }()
    
    override func didMoveToSuperview() {
        contentView.addSubview(homeCellBackgroundView)
        
        
        homeCellBackgroundView.addSubview(horizontalStackView)
        
        horizontalStackView.addArrangedSubview(transparentSubView)
        horizontalStackView.addArrangedSubview(rightView)
        
       
        transparentSubView.addSubview(callerImage)
        rightView.addSubview(rightSubView)
        
        
        rightSubView.addSubview(callerNameLabel)
        rightSubView.addSubview(callerNumberLabel)
        rightSubView.addSubview(callImage)
        
        
        setupCellConstraint()
        
    }
    func setupCellConstraint(){
        
        homeCellBackgroundView.snp.makeConstraints { const in
            const.leading.trailing.bottom.top.equalTo(contentView)
        }
        
        horizontalStackView.snp.makeConstraints { const in
            const.leading.trailing.bottom.top.equalTo(homeCellBackgroundView)
        }
        
        callerImage.snp.makeConstraints{ const in
            const.centerX.centerY.equalTo(transparentSubView)
        }
        rightSubView.snp.makeConstraints{ const in
            const.centerY.equalTo(rightView)
            const.leading.equalTo(rightView)
            const.trailing.equalTo(rightView)
        }
        
        callerNameLabel.snp.makeConstraints { const in
            
           
            const.leading.equalTo(rightSubView).offset(10)
           
            
        }
        
        callerNumberLabel.snp.makeConstraints { const in
            
            const.top.equalTo(callerNameLabel.snp.bottom).offset(5)
            const.leading.equalTo(rightSubView).offset(10)
          
        }
        
        
        callImage.snp.makeConstraints { const in
            const.leading.equalTo(callerNumberLabel.snp.trailing).offset(10)
            const.centerY.equalTo(callerNumberLabel)
            const.height.equalTo(15)
            const.width.equalTo(15)
            
        }
        
        
        
        //        homeCellLabel.snp.makeConstraints { const in
        //            const.height.equalTo(25)
        //            const.centerY.equalTo(subBaseView)
        //            const.trailing.equalTo(subBaseView).offset(-10)
        //        }
        //
        //        cellImage.snp.makeConstraints { const in
        //            const.height.equalTo(20)
        //            const.width.equalTo(20)
        //            const.leading.equalTo(subBaseView).offset(10)
        //            const.centerY.equalTo(subBaseView)
        //            const.trailing.equalTo(homeCellLabel.snp.leading).offset(-5)
        //        }
        //
        
        
        
        
        
    }
}
class CustomView : UIView{
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: [.topLeft, .bottomLeft], radius: 15.0)
    }
    
}
extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         layer.mask = mask
     }
 }

