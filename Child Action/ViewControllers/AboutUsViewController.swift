//
//  AboutUsViewController.swift
//  Child Action
//
//  Created by Fixel Dev on 8/14/21.
//

import UIKit

class AboutUsViewController: UIViewController {
    
    let scrollView = UIScrollView()
    
    let aboutUsHeading = UILabel()
    let aboutCalSubHeading = UILabel()
    let aboutCalContent = UILabel()
    let aboutCalAppSubHeading = UILabel()
    let aboutCalAppContent = UILabel()
    let donationSubHeading = UILabel()
    let donationContent = UILabel()
    
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
    
    let mainLogo : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "main_logo"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(backgroundImage)
        view.addSubview(mainLogo)
        view.addSubview(aboutUsHeading)
        view.addSubview(scrollView)
        scrollView.addSubview(vStack)
        
        updateLabels()
        
        updateConstraints()
        
        
    }
    func updateLabels(){
        
        aboutUsHeading.updateToHeading(text: "About Us")
        
        aboutCalSubHeading.updateToSubHeading(text: "About CAL",isSemiBold: true)
        
        aboutCalContent.updateToContent(text: "Child action Lanka is focused on providing a holistic education, health and nutrition for the most disadvantaged children in society. We strive to ensure a positive change in their families, communities and societies by promoting their basic needs, rights and interests.  CAL aims to provide transformational development that is both sustainable and community based by providing aid and support to children in both urban and rural areas around the country who are deprived of education, traumatized by violence and abuse (mental and physical) or suffer from illness mainly due to poverty, war and conflict.",isClickable: false)
        
        aboutCalAppSubHeading.updateToSubHeading(text: "About the CAL app",isSemiBold: true)
        
        aboutCalAppContent.updateToContent(text: "The CAL mobile app aims to safeguard the protection of children and women from domestic violence, abuse and other emergency crises. The app is designed to bring together crucial numbers to one dashboard that has a very simple interaction where at a press of a button will trigger a call to any of the linked hotlines in an emergency or crises. This app links crucial contact numbers in Sri Lanka to one single app that is made available for anyone to get in touch with regardless of their age and background. The CAL mobile app was launched in celebration of  Child Action Lanka's 15 years of service in Sri Lanka and the app is available on both Android & iOS.",isClickable: false)
        
        donationSubHeading.updateToSubHeading(text: "Donations",isSemiBold: true)
        
        donationContent.updateToContent(text: "The app also provides a gateway for anyone to be able to donate to those in need in the country through Child Action Lanka. Each donation is utilized to give children the right nutrition, access to primary and higher education and protection making a pathway to a safer and  better tomorrow. Through the app the donor can fill out the information sheet and donate not only to CAL children or CAL communities but to others in need as well.CAL works hand in hand with the divisional secretariat throughout the country  and will distribute donations based on the need.",isClickable: false)
        
        
    }
    func updateConstraints(){
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInset.bottom = 20
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        
        vStack.addArrangedSubview(aboutCalSubHeading)
        vStack.addArrangedSubview(aboutCalContent)
        vStack.addArrangedSubview(aboutCalAppSubHeading)
        vStack.addArrangedSubview(aboutCalAppContent)
        vStack.addArrangedSubview(donationSubHeading)
        vStack.addArrangedSubview(donationContent)
        
        backgroundImage.snp.makeConstraints { const in
            const.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            const.leading.equalTo(view)
            const.trailing.equalTo(view)
            
        }
        mainLogo.snp.makeConstraints { const in
            const.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(35)
            const.leading.equalTo(view).offset(40)
            
        }
        aboutUsHeading.snp.makeConstraints { const in
            const.top.equalTo(mainLogo.snp.bottom).offset(40)
            const.leading.equalTo(view).offset(40)
            
        }
        
        scrollView.snp.makeConstraints { const in
            const.top.equalTo(aboutUsHeading.snp.bottom).offset(20)
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
        
        vStack.setCustomSpacing(50, after: aboutCalContent)
        vStack.setCustomSpacing(50, after: aboutCalAppContent)
        
        
    }
    
    
}
