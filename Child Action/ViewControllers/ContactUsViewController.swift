//
//  ContactUsViewController.swift
//  Child Action
//
//  Created by Fixel Dev on 8/14/21.
//

import UIKit

class ContactUsViewController: UIViewController {
    
    let scrollView = UIScrollView()
    
    let contactUsHeading = UILabel()
    let companyName = UILabel()
    let addressLabel = UILabel()
    let address = UILabel()
    let map = UILabel()
    let phoneLabel = UILabel()
    let phone = UILabel()
    let emailLabel = UILabel()
    let email = UILabel()
    let webLabel = UILabel()
    let web = UILabel()
    let donateWebLabel = UILabel()
    let donateWeb = UILabel()
    let followLabel = UILabel()
    
    let vStack : UIStackView = {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing  = 10
        stackView.axis = .vertical
        return stackView
        
    }()
    
    let backgroundImage : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "logo_background"))
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let hStack : UIStackView = {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
     
        stackView.spacing  = 10
        stackView.axis = .horizontal
        return stackView
        
    }()
    
    let facebook : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "facebook"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        return imgView
    }()
    let instagram : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "instagram"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        return imgView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(backgroundImage)
        view.addSubview(contactUsHeading)
        view.addSubview(companyName)
        view.addSubview(scrollView)
        scrollView.addSubview(vStack)
        
        updateLabels()
        updateConstraints()
    }
    func updateLabels(){
        
        contactUsHeading.updateToHeading(text: "Contact Us")
        
        companyName.updateToSubHeading(text: "Child Action Lanka HQ", isSemiBold: false)
        
        addressLabel.updateToSubHeading(text: "Address:", isSemiBold: true)
        
        address.updateToContent(text: "06, Power Station Road, Kandy (20000), Sri Lanka.", isClickable: false)
        
        map.updateToContent(text: "View location on Google maps", isClickable: true)
        
        phoneLabel.updateToSubHeading(text: "Phone:", isSemiBold: true)
        
        phone.updateToContent(text: "(+94) 812 234 144", isClickable: false)
        
        emailLabel.updateToSubHeading(text: "Email:", isSemiBold: true)
        
        email.updateToContent(text: "childaction@sltnet.lk", isClickable: true)
        
        webLabel.updateToSubHeading(text: "Official Website:", isSemiBold: true)
        
        web.updateToContent(text: "www.childactionlanka.org", isClickable: true)
        
        donateWebLabel.updateToSubHeading(text: "Charity Website:", isSemiBold: true)
        
        donateWeb.updateToContent(text: "www.childactionlanka.org/donate", isClickable: true)
        
        followLabel.updateToSubHeading(text: "Follow us:", isSemiBold: true)
    }
    func updateConstraints(){
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInset.bottom = 20
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        hStack.addArrangedSubview(facebook)
        hStack.addArrangedSubview(instagram)
        
        vStack.addArrangedSubview(addressLabel)
        vStack.addArrangedSubview(address)
        vStack.addArrangedSubview(map)
        vStack.addArrangedSubview(phoneLabel)
        vStack.addArrangedSubview(phone)
        vStack.addArrangedSubview(emailLabel)
        vStack.addArrangedSubview(email)
        vStack.addArrangedSubview(webLabel)
        vStack.addArrangedSubview(web)
        vStack.addArrangedSubview(donateWebLabel)
        vStack.addArrangedSubview(donateWeb)
        vStack.addArrangedSubview(followLabel)
        vStack.addArrangedSubview(hStack)
        

        
        
        backgroundImage.snp.makeConstraints { const in
            const.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            const.leading.equalTo(view)
            const.trailing.equalTo(view)
            
        }
        contactUsHeading.snp.makeConstraints { const in
            const.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(35)
            const.leading.equalTo(view).offset(40)
            
        }
        companyName.snp.makeConstraints { const in
            const.top.equalTo(contactUsHeading.snp.bottom).offset(30)
            const.leading.equalTo(view).offset(40)
            
        }
     
        scrollView.snp.makeConstraints { const in
            const.top.equalTo(companyName.snp.bottom).offset(20)
            const.centerX.equalTo(view.snp.centerX)
            const.width.equalTo(view.snp.width).inset(40)
            const.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            
            
        }
        
        vStack.snp.makeConstraints { const in
           
            const.top.equalTo(scrollView.snp.top)
            const.centerX.equalTo(scrollView.snp.centerX)
            
            const.bottom.equalTo(scrollView.snp.bottom)
            const.width.equalTo(scrollView.snp.width)
       
            
        }
        
        vStack.setCustomSpacing(15, after: address)
        vStack.setCustomSpacing(25, after: map)
        vStack.setCustomSpacing(25, after: phone)
        vStack.setCustomSpacing(25, after: email)
        vStack.setCustomSpacing(25, after: web)
        vStack.setCustomSpacing(25, after: donateWeb)
        
        hStack.setCustomSpacing(10, after: facebook)
        
        
    }
    
    
    
    
}
