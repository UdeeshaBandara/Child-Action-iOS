//
//  ViewController.swift
//  Child Action
//
//  Created by Fixel Dev on 8/5/21.
//

import UIKit


class HomeViewController: UIViewController {
    
  
    let homeCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
   
    
    struct HomeCellData{
        let cells = [
            Caller(name: "Child Help Line", number:"1929",image: "home_logo_child_help.png"),
            Caller(name: "Woman Help Line",number:"1938", image: "home_logo_woman_help.png"),
            Caller(name: "Ambulance Service 1", number:"1990",image: "home_logo_ambulance.png"),
            Caller(name: "Ambulance Service 2", number:"110",image: "home_logo_ambulance2.png"),
            Caller(name: "Fire and Rescue", number:"111",image: "home_logo_fire.png"),
            Caller(name: "Police Emergency Service", number:"119",image: "home_logo_police.png"),
            Caller(name: "Covid Hotline",number:"1999", image: "home_logo_covid.png"),
            Caller(name: "Long Distance Bus Harassment",number:"1955", image: "home_logo_bus.png"),
            Caller(name: "Ceylon Electricity Board",number:"1987", image: "home_logo_electricity.png"),
            Caller(name: "Mental Health Chatline",number:"1926", image: "home_logo_mental.png"),
            Caller(name: "CAL Hotline",number:"0710799799", image: "home_logo_mental.png")
            
            
        ]
    }
    
    struct Caller {
        
        let name : String
        let number :String
        let image :String
        
    }
    
  
    lazy var menuBarButton = UIBarButtonItem(image: UIImage(named: "side_menu_icon.png"), style: .done, target: self, action: #selector(menuBarButtonAction))
    
    @objc
    func menuBarButtonAction(){
        
        self.sideMenuController?.showRightView(animated: true)
        
        
    }
    lazy var menuView : UIView = {
        
        let view = UIView()
        view.backgroundColor = .systemGray
        
        return view
        
        
    }()
    
    lazy var containerView : UIView = {
        
        let view = UIView()
        view.backgroundColor = .systemBackground
        
        return view
        
        
    }()
    
    
    
    let donationButton : UIButton = {
        
        let button = UIButton()
        button.setImage(UIImage(named: "donate"), for: .normal)
        button.setTitle("  DONATE NOW", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font =  UIFont(name: "OpenSans-SemiBold", size: 16)
        button.backgroundColor = UIColor(named: "green")
        
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .white
        
        setupDonationButton()
        setupHomeCollectionView()
        setupNavigationBarApperance()
        

        donationButton.addTarget(self, action: #selector(showDonationController(sender:)), for: .touchUpInside)
    }
    @objc func showDonationController(sender : UIButton){
     
//        self.sideMenuController?.showRightView(animated: true)
        self.navigationController?.pushViewController(DonateViewController(), animated: true)
      
     
    }
    
    
    
    func setupNavigationBarApperance (){

        print("setupNavigationBarApperance")
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "  Phone Numbers"
        label.font = UIFont(name:"OpenSans-SemiBold",size:16)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
//        self.navigationController!.navigationBar.tintColor = .white
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "primary")
        self.navigationItem.setRightBarButton(menuBarButton, animated: false)
        self.navigationItem.standardAppearance = appearance
        
    }
    
    func setupHomeCollectionView(){
        
        
        view.addSubview(homeCollectionView)
        
        homeCollectionView.backgroundColor = .white
        homeCollectionView.showsVerticalScrollIndicator = false
        homeCollectionView.showsHorizontalScrollIndicator = false
        homeCollectionView.register(HomeCell.self, forCellWithReuseIdentifier: "homeCell")
        homeCollectionView.register(HotlineCell.self, forCellWithReuseIdentifier: "hotlineCell")
        
        
        if let flowLayout = homeCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .vertical
        }
        
        homeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        homeCollectionView.dataSource = self
        homeCollectionView.delegate = self
        homeCollectionView.contentInset.bottom = 20
        homeCollectionView.contentInset.top = 20
        
        homeCollectionView.snp.makeConstraints { const in
            const.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            const.bottom.equalTo(donationButton.snp.top)
            
            const.leading.equalTo(view).offset(20)
            const.trailing.equalTo(view).offset(-20)
            
        }
        
        
    }
    
    
    func setupDonationButton(){
        
        
        view.addSubview(donationButton)
        
        donationButton.translatesAutoresizingMaskIntoConstraints = false
               
        donationButton.snp.makeConstraints { const in
            
            const.height.equalTo(55)
            const.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            const.leading.equalTo(view)
            const.trailing.equalTo(view)
            
        }
        
        
    }
    
    
}


extension HomeViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 1 {  return 1} else {return 10}
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        
        if indexPath.section == 1 {
            
            return CGSize(width: collectionView.frame.width , height: 90)
            
            
        } else {
            
            return CGSize(width: collectionView.frame.width / 2 - 5, height: 90)
            
        }
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1{
            let hotlineCell = collectionView.dequeueReusableCell(withReuseIdentifier: "hotlineCell", for: indexPath) as! HotlineCell
            
            
            return hotlineCell
            
        }else{
            let homeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeCell
            
            homeCell.callerImage.image = UIImage(named: HomeCellData().cells[indexPath.row].image)
            homeCell.callerNameLabel.text = HomeCellData().cells[indexPath.row].name
            homeCell.callerNumberLabel.text = HomeCellData().cells[indexPath.row].number
            
            homeCell.homeCellBackgroundView.backgroundColor = UIColor(named:  HomeCellData().cells[indexPath.row].number)
            return homeCell
        }
        
    }
}
