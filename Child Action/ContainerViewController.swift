//
//  ContainerViewController.swift
//  Child Action
//
//  Created by Fixel Dev on 8/15/21.
//

import UIKit
import LGSideMenuController


class ContainerViewController:  UIViewController {
    let okButton : UIButton = {
        let button = UIButton()
        button.titleLabel?.tintColor = .white
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Okay", for: .normal)
        button.backgroundColor = .blue
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        
        okButton.addTarget(self, action: #selector(okButtonAction(sender:)), for: .touchUpInside)
        view.addSubview(okButton)

        okButton.snp.makeConstraints { const in
            
            
            const.height.equalTo(55)
            const.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            const.leading.equalTo(view)
            const.trailing.equalTo(view)
            
        }
        
//        setupNavigationBarApperance ()
//        setupUINJ()
           // Do any additional setup after loading the view.
    }
    
//    func setupUINJ(){
//        let sideMenuController =
//            LGSideMenuController(rootViewController: AboutUsViewController(),
//                                 rightViewController: ContactUsViewController())
//        sideMenuController.rightViewPresentationStyle = .slideBelowShifted
//        sideMenuController.rightViewWidth = 300.0
//
//    }
    func setupNavigationBarApperance (){
        
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "  Phone Numbers"
        label.font = UIFont(name:"OpenSans-SemiBold",size:16)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        navigationController!.navigationBar.tintColor = .white
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "primary")
        navigationItem.setRightBarButton(menuBarButton, animated: false)
        navigationItem.standardAppearance = appearance
        
    }
    lazy var menuBarButton = UIBarButtonItem(image: UIImage(named: "side_menu_icon.png"), style: .done, target: self, action: #selector(menuBarButtonAction))
    
    @objc
    func menuBarButtonAction(){
    
       
    }
    @objc func okButtonAction(sender : UIButton){
     
        self.sideMenuController?.showRightView(animated: true)
        print("open")
        
        
     
    }
    
  
    
}
