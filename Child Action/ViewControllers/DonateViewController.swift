//
//  DonateViewController.swift
//  Child Action
//
//  Created by Fixel Dev on 8/14/21.
//

import UIKit

class DonateViewController: UIViewController,UITextFieldDelegate {
    
    let scrollView = UIScrollView()
    
    let firstName  = UITextField()
    let lastName  = UITextField()
    let contactNumber  = UITextField()
    let emailAddress  = UITextField()
    let note  = UITextView()
    
    let firstNameLabel = UILabel()
    let lastNameLabel = UILabel()
    let contactNumberLabel = UILabel()
    let emailAddressLabel = UILabel()
    let noteLabel = UILabel()
    
    let vStack : UIStackView = {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing  = 10
        stackView.axis = .vertical
        return stackView
        
    }()
    
    let submitButton : UIButton = {
        
        let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font =  UIFont(name: "OpenSans-Bold", size: 18)
        button.backgroundColor = UIColor(named: "green")
        button.layer.cornerRadius = 22.5
        
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.interactivePopGestureRecognizer!.delegate = self
        
        view.backgroundColor = UIColor(named: "light_green")
        
        contactNumber.delegate = self
        
        self.hideKeyboard()
        self.initKeyboardNotification()
        
        setupNavigationBarApperance()
        updateTextFields()
        setupConstraint()
    }
    
    func setupNavigationBarApperance (){
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "green")
        navigationItem.standardAppearance = appearance
        
        let navigationBarTitle = UILabel()
        navigationBarTitle.textColor = UIColor.white
        navigationBarTitle.text = "Donate"
        navigationBarTitle.font = UIFont(name:"OpenSans-SemiBold",size:34)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: navigationBarTitle)
        
        self.navigationController!.navigationBar.tintColor = .white
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: UIImageView(image: #imageLiteral(resourceName: "heart")))
        
        
    }
    
    
    func updateTextFields(){
        
        firstName.updateDesign()
        lastName.updateDesign()
        contactNumber.updateDesign()
        emailAddress.updateDesign()
        
        note.font = UIFont(name: "OpenSans-Regular", size: 16)
        note.showsVerticalScrollIndicator = false
        note.layer.borderColor = #colorLiteral(red: 0.5417729616, green: 0.6783421636, blue: 0.4366089106, alpha: 1)
        note.layer.borderWidth = 1
        note.layer.cornerRadius = 22.5
        note.textColor = #colorLiteral(red: 0.2313431799, green: 0.2313894629, blue: 0.2313401997, alpha: 1)
        note.autocorrectionType = .yes
        note.translatesAutoresizingMaskIntoConstraints = false
        note.layer.sublayerTransform = CATransform3DMakeTranslation(10, 5, 0)
        
        firstName.textContentType = .givenName
        lastName.textContentType = .familyName
        contactNumber.textContentType = .telephoneNumber
        emailAddress.textContentType = .emailAddress
        
        contactNumber.keyboardType = .numberPad
        emailAddress.keyboardType = .emailAddress
        
        firstNameLabel.updateDonateLabel(text: "First Name")
        lastNameLabel.updateDonateLabel(text: "Last Name")
        contactNumberLabel.updateDonateLabel(text: "Contact Number")
        emailAddressLabel.updateDonateLabel(text: "Email Address")
        noteLabel.updateDonateLabel(text: "Note")
        
        
    }
    
    func setupConstraint(){
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInset.bottom = 20
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
       
        
        view.addSubview(scrollView)
        
        
        vStack.addArrangedSubview(firstNameLabel)
        vStack.addArrangedSubview(firstName)
        vStack.addArrangedSubview(lastNameLabel)
        vStack.addArrangedSubview(lastName)
        vStack.addArrangedSubview(contactNumberLabel)
        vStack.addArrangedSubview(contactNumber)
        vStack.addArrangedSubview(emailAddressLabel)
        vStack.addArrangedSubview(emailAddress)
        vStack.addArrangedSubview(noteLabel)
        vStack.addArrangedSubview(note)
        
        scrollView.addSubview(vStack)
        
        
        view.addSubview(submitButton)
        
        
        scrollView.snp.makeConstraints { const in
            const.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            const.centerX.equalTo(view.snp.centerX)
            const.width.equalTo(view.snp.width).inset(20)
            const.bottom.equalTo(submitButton.snp.top).offset(10)
            const.height.equalTo(510).priority(510)
        }
        vStack.snp.makeConstraints { const in
            
            const.top.equalTo(scrollView.snp.top)
            const.centerX.equalTo(scrollView.snp.centerX)
            const.bottom.equalTo(scrollView.snp.bottom)
            const.width.equalTo(scrollView.snp.width)
            
        }
        
        
        firstName.snp.makeConstraints { const in
            
            const.height.equalTo(45)
            
        }
        
        lastName.snp.makeConstraints { const in
            
            const.height.equalTo(45)
            
        }
        
        contactNumber.snp.makeConstraints { const in
            
            const.height.equalTo(45)
            
        }
        
        emailAddress.snp.makeConstraints { const in
            
            const.height.equalTo(45)
            
        }
        
        note.snp.makeConstraints { const in
            
            const.height.equalTo(125)
        }
        submitButton.snp.makeConstraints { const in
            
            const.leading.equalTo(view).offset(20)
            const.trailing.equalTo(view).offset(-20)
            const.height.equalTo(45)
        }
        
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}
extension DonateViewController : UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}




