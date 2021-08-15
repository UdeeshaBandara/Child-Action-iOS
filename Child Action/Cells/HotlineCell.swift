//
//  HotlineCell.swift
//  Child Action
//
//  Created by Fixel Dev on 8/14/21.
//

import Foundation
import UIKit
import SnapKit

class HotlineCell : UICollectionViewCell{
    
    let calBackgroundRoundedView : UIView = {
        
        let view = UIView()
        view.layer.cornerRadius = 15
        
        
        view.backgroundColor = UIColor(named: "primary")
        
        return view
        
    }()
    
    
    let transparentSubView : CustomView = {
        
        let view = CustomView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2240475171)
        
        view.clipsToBounds = true
        
        return view
        
    }()
    
    let callerImage : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "cal_icon"))
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
        lbl.text = "CAL Hotline"
        lbl.font = UIFont(name:"OpenSans-SemiBold",size:13)
        lbl.textAlignment = .left
       
        return lbl
    }()
    
    
    let arrow : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "arrow"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        return imgView
    }()
    let callerNumberLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "0710799799"
        lbl.font = UIFont(name:"OpenSans-Bold",size:16)
        lbl.textAlignment = .left
        lbl.textColor = .white
        lbl.numberOfLines = 0
        return lbl
    }()
    let callImage : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "call_icon"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        return imgView
    }()
    override func didMoveToSuperview() {
        contentView.addSubview(calBackgroundRoundedView)
        calBackgroundRoundedView.addSubview(transparentSubView)
        
        transparentSubView.addSubview(callerImage)
        calBackgroundRoundedView.addSubview(callerNameLabel)
        calBackgroundRoundedView.addSubview(arrow)
        calBackgroundRoundedView.addSubview(callerNumberLabel)
        calBackgroundRoundedView.addSubview(callImage)
        setupCallCalView()
    }
    
    
    
    func setupCallCalView(){
    
        
        calBackgroundRoundedView.translatesAutoresizingMaskIntoConstraints = false
        
        calBackgroundRoundedView.snp.makeConstraints { const in
            const.leading.trailing.bottom.equalTo(contentView)
            const.top.equalTo(contentView).offset(10)
            
        }
        transparentSubView.snp.makeConstraints{ const in
            const.leading.top.bottom.equalTo(calBackgroundRoundedView)
            const.width.equalTo(65)
        }
        
        callerImage.snp.makeConstraints{ const in
            const.centerX.centerY.equalTo(transparentSubView)
        }
        
        callerNameLabel.snp.makeConstraints{ const in
            const.leading.equalTo(transparentSubView.snp.trailing).offset(10)
            const.centerY.equalTo(calBackgroundRoundedView.snp.centerY)
        }
        arrow.snp.makeConstraints{ const in
            const.leading.equalTo(callerNameLabel.snp.trailing).offset(10)
            const.centerY.equalTo(calBackgroundRoundedView.snp.centerY)
        }
        
        callerNumberLabel.snp.makeConstraints{ const in
            const.trailing.equalTo(callImage.snp.leading).offset(-10)
            const.centerY.equalTo(calBackgroundRoundedView.snp.centerY)
        }
        callImage.snp.makeConstraints{ const in
            const.trailing.equalTo(calBackgroundRoundedView.snp.trailing).offset(-10)
            const.centerY.equalTo(calBackgroundRoundedView.snp.centerY)
        }
        
    }
}
