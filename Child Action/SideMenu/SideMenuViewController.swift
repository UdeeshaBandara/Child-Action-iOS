//
//  SideMenuViewController.swift
//  Child Action
//
//  Created by Fixel Dev on 8/15/21.
//

import UIKit

class SideMenuViewController: UIViewController {
    
    let scrollView = UIScrollView()
    
    let menuSubBackgroundView : UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor(named: "primary")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    let mainLogo : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "main_logo"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    let menuClose : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "menu_close"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.isUserInteractionEnabled = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let aboutUsLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        lbl.isUserInteractionEnabled = true
        lbl.text = "About CAL"
        lbl.font = UIFont(name:"OpenSans-Bold",size:16)
        lbl.textAlignment = .center
       
        return lbl
    }()
    
    let contactUsLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        lbl.isUserInteractionEnabled = true
        lbl.text = "Contact Us"
        lbl.font = UIFont(name:"OpenSans-Bold",size:16)
        lbl.textAlignment = .center
       
        return lbl
    }()
    
    let bottomLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        lbl.text = "©2021 Child Action Lanka. All rights reserved"
        lbl.font = UIFont(name:"OpenSans-Regular",size:10)
        lbl.textAlignment = .center
       
        return lbl
    }()
    let devider : UIView = {
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9611677527, green: 0.525033772, blue: 0.3648735881, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    let deviderBottom : UIView = {
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9611677527, green: 0.525033772, blue: 0.3648735881, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
   
    
    let vStack : UIStackView = {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing  = 10
        stackView.axis = .vertical
        return stackView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(mainLogo)
        view.addSubview(menuClose)
        
        view.addSubview(menuSubBackgroundView)
        menuSubBackgroundView.addSubview(scrollView)
        
        vStack.addArrangedSubview(aboutUsLabel)
        vStack.addArrangedSubview(devider)
        vStack.addArrangedSubview(contactUsLabel)
        
        scrollView.addSubview(vStack)
        
        menuSubBackgroundView.addSubview(deviderBottom)
        menuSubBackgroundView.addSubview(bottomLabel)
        
        setupConstraints()
        
        
        menuClose.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeMenu(sender:))))
        
        aboutUsLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openAboutUs(sender:))))
        
        contactUsLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openContactUs(sender:))))
    
    }
    func setupConstraints(){
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInset.bottom = 20
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        menuSubBackgroundView.snp.makeConstraints { const in
            
            const.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(175)
            
            const.trailing.leading.equalTo(view)
            const.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            
            
        }
        
        menuClose.snp.makeConstraints { const in
            
            const.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            
            const.trailing.equalTo(view).offset(-20)
            
            
            
        }
        mainLogo.snp.makeConstraints { const in
            
            const.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(45)
            
            const.centerX.equalTo(view)
            
        }
        bottomLabel.snp.makeConstraints { const in
            
         
            const.bottom.equalTo(menuSubBackgroundView.snp.bottom).offset(-15)
            const.leading.trailing.equalTo(menuSubBackgroundView)
            
            
        }
        deviderBottom.snp.makeConstraints { const in
            
            const.height.equalTo(1)
            const.bottom.equalTo(bottomLabel.snp.top).offset(-25)
            const.width.equalTo(menuSubBackgroundView.snp.width).inset(40)
            const.centerX.equalTo(menuSubBackgroundView.snp.centerX)
        }
      
        scrollView.snp.makeConstraints { const in
            const.top.equalTo(menuSubBackgroundView.snp.top).offset(25)
            const.centerX.equalTo(menuSubBackgroundView.snp.centerX)
            const.width.equalTo(menuSubBackgroundView.snp.width).inset(40)
            const.bottom.equalTo(deviderBottom.snp.top).inset(-20)

        }
        vStack.snp.makeConstraints { const in

            const.top.equalTo(scrollView.snp.top)
            const.centerX.equalTo(scrollView.snp.centerX)
            const.bottom.equalTo(scrollView.snp.bottom)
            const.width.equalTo(scrollView.snp.width)


        }
        devider.snp.makeConstraints { const in

            const.height.equalTo(1)



        }
       
        
    }
    @objc func closeMenu(sender : UIButton){
     
        self.sideMenuController?.hideRightView(animated: true)
    }
    @objc func openContactUs(sender : UIButton){
      
        self.sideMenuController?.hideRightView(animated: true)
        self.present(ContactUsViewController(), animated: true, completion: nil)
        
    }
    @objc func openAboutUs(sender : UIButton){
        
     
        self.sideMenuController?.hideRightView(animated: true)
        self.present(AboutUsViewController(), animated: true, completion: nil)
    }
   
    
}
