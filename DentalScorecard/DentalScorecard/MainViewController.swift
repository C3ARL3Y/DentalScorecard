//
//  MainViewController.swift
//  DentalScorecard
//
//  Created by Julian Cearley on 11/3/18.
//  Copyright © 2018 Julian Cearley. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class MainViewController: UIViewController {
    
    let heatherDyerLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Heather Dyer"
        label.font = UIFont(name: "AmericanTypewriter-Bold ", size: 28)
        label.textColor = UIColor(r: 57, g: 125, b: 161)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        
        return label
    }()
    
    let heatherDyerAmountPresentedTextField: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let heatherDyerAmountAcceptedTextField: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let heatherDyerPercentOfDollarAmountScheduledTextField: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let heatherDyerNumberPatientsPresentedTreatmentTextField: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let heatherDyerNumberPatientsAcceptedTreatmentTextField: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let heatherDyerPercentPatientsAcceptedTreatmentTextField: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    var currentUser = UserDefaults.standard.string(forKey: "CurrentUser")
    var currentUserPassword = UserDefaults.standard.string(forKey: "CurrentUserPassword")
    
    var signedIn = UserDefaults.standard.bool(forKey: "signedIn")
    
    let logo:  UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "Logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        
        return imageView
    }()
    
    let scrollViewBorderView: UIView = {
       let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        view.layer.zPosition = 0
        
        return view
    }()
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = UIColor.lightGray
        sv.alpha = 0.85
        sv.layer.cornerRadius = 15
        sv.layer.masksToBounds  = true
        sv.bounces = true
        sv.alwaysBounceVertical = true
        sv.alwaysBounceHorizontal = false
        sv.layer.zPosition = 1
        
        return sv
    }()
    
    let titleLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Woodstock / Kennesaw"
        label.font = UIFont(name: "SavoyeLetPlain", size: 28)
        label.textColor = UIColor(r: 18, g: 18, b: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let titleUnderline: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(r: 57, g: 125, b: 161)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let categoryHighlight1: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(r: 241, g: 246, b: 248)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let categoryDivider1: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(r: 107, g: 156, b: 183)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let categoryDivider2: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.zPosition = 2
        
        return view
    }()
    
    let adminAndInsuranceLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Net Production"
        label.font = UIFont(name: "AmericanTypewriter-Bold ", size: 28)
        label.textColor = UIColor(r: 57, g: 125, b: 161)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let woodstockLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Woodstock"
        label.font = UIFont(name: "AmericanTypewriter-Bold ", size: 28)
        label.textColor = UIColor(r: 57, g: 125, b: 161)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let kennesawLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Kennesaw"
        label.font = UIFont(name: "AmericanTypewriter-Bold ", size: 28)
        label.textColor = UIColor(r: 57, g: 125, b: 161)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let netProdutionLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Net Production"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let netProductionTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let netProductionTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let horizontalDivider1: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.zPosition = 2
        
        return view
    }()
    
    let collectionsLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Collections"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let collectionsTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let collectionsTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let horizontalDivider2: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.zPosition = 2
        
        return view
    }()
    
    let insuranceCollectionsLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Insurance Collections"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let insuranceCollectionsTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let insuranceCollectionsTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let horizontalDivider3: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.zPosition = 2
        
        return view
    }()
    
    let otcCollectionsLbl: UILabel = {
        let label = UILabel()
        
        label.text = "OTC Collections"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let otcCollectionsTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let otcCollectionsTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let amountRefundedToInsuranceLbl: UILabel = {
        let label = UILabel()
        
        label.text = "$ Amount Refunded to Insurance"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let amountRefundedToInsuranceTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let amountRefundedToInsuranceTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let amountRefundedToPatientsLbl: UILabel = {
        let label = UILabel()
        
        label.text = "$ Amount Refunded to Patients"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let amountRefundedToPatientsTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let amountRefundedToPatientsTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentOTCToTotalCollectionsLbl: UILabel = {
        let label = UILabel()
        
        label.text = "% OTC to Total Collections"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let percentOTCToTotalCollectionsTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentOTCToTotalCollectionsTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentInsuranceToTotalCollectionsLbl: UILabel = {
        let label = UILabel()
        
        label.text = "% Insurance to Total Collections"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let percentInsuranceToTotalCollectionsTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentInsuranceToTotalCollectionsTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentCollectionsToNetProducionLbl: UILabel = {
        let label = UILabel()
        
        label.text = "% Collections to Net Production"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let percentCollectionsToNetProducionTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentCollectionsToNetProducionTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let productionPerActiveChairLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Production Per Active Chair"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let productionPerActiveChairTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let productionPerActiveChairTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let caseAcceptanceLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Case Acceptance"
        label.font = UIFont(name: "SavoyeLetPlain", size: 28)
        label.textColor = UIColor(r: 18, g: 18, b: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let categoryHighlight2: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(r: 241, g: 246, b: 248)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let categoryDivider3: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(r: 107, g: 156, b: 183)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let treatmentCoordinatorsLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Treatment Coordinators"
        label.font = UIFont(name: "AmericanTypewriter-Bold ", size: 28)
        label.textColor = UIColor(r: 57, g: 125, b: 161)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let categoryDivider4: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.zPosition = 2
        
        return view
    }()
    
    let HollyLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Holly"
        label.font = UIFont(name: "AmericanTypewriter-Bold ", size: 28)
        label.textColor = UIColor(r: 57, g: 125, b: 161)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let amountPresentedLbl: UILabel = {
        let label = UILabel()
        
        label.text = "$ Amount Presented"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.lineBreakMode = .byWordWrapping // notice the 'b' instead of 'B'
        label.numberOfLines = 0
        
        return label
    }()
    
    let amountPresentedTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let amountPresentedTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let sydneyLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Sydney"
        label.font = UIFont(name: "AmericanTypewriter-Bold ", size: 28)
        label.textColor = UIColor(r: 57, g: 125, b: 161)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let amountAcceptedLbl: UILabel = {
        let label = UILabel()
        
        label.text = "$ Amount Accepted"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.lineBreakMode = .byWordWrapping // notice the 'b' instead of 'B'
        label.numberOfLines = 0
        
        return label
    }()
    
    let amountAcceptedTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let amountAcceptedTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentOfDollarAmountScheduledLbl: UILabel = {
        let label = UILabel()
        
        label.text = "% of $ Amount Scheduled"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let percentOfDollarAmountScheduledTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentOfDollarAmountScheduledTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let numberPatientsPresentedTreatmentLbl: UILabel = {
        let label = UILabel()
        
        label.text = "# Patients Presented Treatment"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.lineBreakMode = .byWordWrapping // notice the 'b' instead of 'B'
        label.numberOfLines = 0
        
        return label
    }()
    
    let numberPatientsPresentedTreatmentTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let numberPatientsPresentedTreatmentTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let numberPatientsAccpetedTreatmentLbl: UILabel = {
        let label = UILabel()
        
        label.text = "# Patients Accepted Treatment"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.lineBreakMode = .byWordWrapping // notice the 'b' instead of 'B'
        label.numberOfLines = 0
        
        return label
    }()
    
    let numberPatientsAcceptedTreatmentTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let numberPatientsAcceptedTreatmentTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentPatientsAcceptedTreatmentLbl: UILabel = {
        let label = UILabel()
        
        label.text = "% Patients Accepted Treatment"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.lineBreakMode = .byCharWrapping // notice the 'b' instead of 'B'
        label.numberOfLines = 2
        
        return label
    }()
    
    let percentPatientsAcceptedTreatmentTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentPatientsAcceptedTreatmentTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let categoryHighlight3: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(r: 241, g: 246, b: 248)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.zPosition = 1
        
        return view
    }()
    
    let categoryDivider5: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(r: 107, g: 156, b: 183)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let treatmentCoordinatorsLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "Treatment Coordinators"
        label.font = UIFont(name: "AmericanTypewriter-Bold ", size: 28)
        label.textColor = UIColor(r: 57, g: 125, b: 161)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        
        return label
    }()
    
    let categoryDivider6: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.zPosition = 2
        
        return view
    }()
    
    let amandaLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Amanda"
        label.font = UIFont(name: "AmericanTypewriter-Bold ", size: 28)
        label.textColor = UIColor(r: 57, g: 125, b: 161)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        
        return label
    }()
    
    let amountPresentedLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "$ Amount Presented"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.layer.zPosition = 2
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let amountPresentedTextField3: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let amountPresentedTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let AshleyGLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Ashley G."
        label.font = UIFont(name: "AmericanTypewriter-Bold ", size: 28)
        label.textColor = UIColor(r: 57, g: 125, b: 161)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        
        return label
    }()
    
    let amountAcceptedLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "$ Amount Accepted"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let amountAcceptedTextField3: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let amountAcceptedTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentOfDollarAmountScheduledLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "% of $ Amount Scheduled"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let percentOfDollarAmountScheduledTextField3: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentOfDollarAmountScheduledTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let numberPatientsPresentedTreatmentLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "# Patients Presented Treatment"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let numberPatientsPresentedTreatmentTextField3: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let numberPatientsPresentedTreatmentTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let numberPatientsAccpetedTreatmentLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "# Patients Accepted Treatment"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let numberPatientsAcceptedTreatmentTextField3: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let numberPatientsAcceptedTreatmentTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentPatientsAcceptedTreatmentLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "% Patients Accepted Treatment"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let percentPatientsAcceptedTreatmentTextField3: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentPatientsAcceptedTreatmentTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let categoryHighlight4: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(r: 241, g: 246, b: 248)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let categoryDivider7: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(r: 107, g: 156, b: 183)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let treatmentCoordinatorsLbl3: UILabel = {
        let label = UILabel()
        
        label.text = "Treatment Coordinators"
        label.font = UIFont(name: "AmericanTypewriter-Bold ", size: 28)
        label.textColor = UIColor(r: 57, g: 125, b: 161)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        
        return label
    }()
    
    let categoryDivider8: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.zPosition = 2
        
        return view
    }()
    
    let debbieDLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Debbie D."
        label.font = UIFont(name: "AmericanTypewriter-Bold ", size: 28)
        label.textColor = UIColor(r: 57, g: 125, b: 161)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        
        return label
    }()
    
    let amountPresentedLbl3: UILabel = {
        let label = UILabel()
        
        label.text = "$ Amount Presented"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.layer.zPosition = 2
        
        return label
    }()
    
    let amountPresentedTextField5: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let amountPresentedTextField6: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let annaCLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Anna C."
        label.font = UIFont(name: "AmericanTypewriter-Bold ", size: 28)
        label.textColor = UIColor(r: 57, g: 125, b: 161)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        
        return label
    }()
    
    let amountAcceptedLbl3: UILabel = {
        let label = UILabel()
        
        label.text = "$ Amount Accepted"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let amountAcceptedTextField5: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let amountAcceptedTextField6: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentOfDollarAmountScheduledLbl3: UILabel = {
        let label = UILabel()
        
        label.text = "% of $ Amount Scheduled"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let percentOfDollarAmountScheduledTextField5: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentOfDollarAmountScheduledTextField6: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let numberPatientsPresentedTreatmentLbl3: UILabel = {
        let label = UILabel()
        
        label.text = "# Patients Presented Treatment"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.lineBreakMode = .byClipping
        label.numberOfLines = 0
        
        return label
    }()
    
    let numberPatientsPresentedTreatmentTextField5: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let numberPatientsPresentedTreatmentTextField6: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let numberPatientsAccpetedTreatmentLbl3: UILabel = {
        let label = UILabel()
        
        label.text = "# Patients Accepted Treatment"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.lineBreakMode = .byClipping
        label.numberOfLines = 0
        
        return label
    }()
    
    let numberPatientsAcceptedTreatmentTextField5: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let numberPatientsAcceptedTreatmentTextField6: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentPatientsAcceptedTreatmentLbl3: UILabel = {
        let label = UILabel()
        
        label.text = "% Patients Accepted Treatment"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.lineBreakMode = .byClipping
        label.numberOfLines = 0
        
        return label
    }()
    
    let percentPatientsAcceptedTreatmentTextField5: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentPatientsAcceptedTreatmentTextField6: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let providersLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Providers"
        label.font = UIFont(name: "SavoyeLetPlain", size: 28)
        label.textColor = UIColor(r: 18, g: 18, b: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    let categoryHighlight5: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(r: 241, g: 246, b: 248)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let categoryDivider9: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(r: 107, g: 156, b: 183)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let doctorsLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Doctors"
        label.font = UIFont(name: "AmericanTypewriter-Bold ", size: 28)
        label.textColor = UIColor(r: 57, g: 125, b: 161)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        
        return label
    }()
    
    let categoryDivider10: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.zPosition = 2
        
        return view
    }()
    
    let drVLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Dr. V"
        label.font = UIFont(name: "AmericanTypewriter-Bold ", size: 28)
        label.textColor = UIColor(r: 57, g: 125, b: 161)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        
        return label
    }()
    
    let goalLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Goal"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.layer.zPosition = 2
        
        return label
    }()
    
    let goalTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let goalTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let drMcreeLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Dr. Mcree"
        label.font = UIFont(name: "AmericanTypewriter-Bold ", size: 28)
        label.textColor = UIColor(r: 57, g: 125, b: 161)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        
        return label
    }()
    
    let netProductionLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Net Production"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let netProductionTextField3: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let netProductionTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let daysWorkedLbl: UILabel = {
        let label = UILabel()
        
        label.text = "# of Days Worked"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let daysWorkedTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let daysWorkedTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let productionPerDayLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Production Per Day"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let productionPerDayTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let productionPerDayTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let productionPerHourLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Production Per Hour"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let productionPerHourTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let productionPerHourTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let dollarAmountSameDayTreatmentLbl: UILabel = {
        let label = UILabel()
        
        label.text = "$ Amount Same Day Treatment"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let dollarAmountSameDayTreatmentTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let dollarAmountSameDayTreatmentTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentAppointmentsKeptLbl: UILabel = {
        let label = UILabel()
        
        label.text = "% Appointments Kept"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let percentAppointmentsKeptTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentAppointmentsKeptTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let retentionRateLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Retention Rate"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let retentionRateTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let retentionRateTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let categoryHighlight6: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(r: 241, g: 246, b: 248)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let categoryDivider11: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(r: 107, g: 156, b: 183)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let doctorsLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "Doctors"
        label.font = UIFont(name: "AmericanTypewriter-Bold ", size: 28)
        label.textColor = UIColor(r: 57, g: 125, b: 161)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        
        return label
    }()
    
    let categoryDivider12: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.zPosition = 2
        
        return view
    }()
    
    let drOrzaLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Dr. Orza"
        label.font = UIFont(name: "AmericanTypewriter-Bold ", size: 28)
        label.textColor = UIColor(r: 57, g: 125, b: 161)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        
        return label
    }()
    
    let goalLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "Goal"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.layer.zPosition = 2
        
        return label
    }()
    
    let goalTextField3: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let goalTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let drFranLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Dr. Fran"
        label.font = UIFont(name: "AmericanTypewriter-Bold ", size: 28)
        label.textColor = UIColor(r: 57, g: 125, b: 161)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        
        return label
    }()
    
    let netProductionLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "Net Production"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let netProductionTextField5: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let netProductionTextField6: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let daysWorkedLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "# of Days Worked"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let daysWorkedTextField3: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let daysWorkedTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let productionPerDayLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "Production Per Day"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let productionPerDayTextField3: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let productionPerDayTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let productionPerHourLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "Production Per Hour"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let productionPerHourTextField3: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let productionPerHourTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let dollarAmountSameDayTreatmentLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "$ Amount Same Day Treatment"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let dollarAmountSameDayTreatmentTextField3: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let dollarAmountSameDayTreatmentTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentAppointmentsKeptLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "% Appointments Kept"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let percentAppointmentsKeptTextField3: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentAppointmentsKeptTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let retentionRateLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "Retention Rate"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let retentionRateTextField3: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let retentionRateTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let categoryHighlight7: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(r: 241, g: 246, b: 248)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let categoryDivider13: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(r: 107, g: 156, b: 183)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let hygieneLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Hygiene"
        label.font = UIFont(name: "AmericanTypewriter-Bold ", size: 28)
        label.textColor = UIColor(r: 57, g: 125, b: 161)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        
        return label
    }()
    
    let categoryDivider14: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.zPosition = 2
        
        return view
    }()
    
    let amyLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Amy"
        label.font = UIFont(name: "AmericanTypewriter-Bold ", size: 28)
        label.textColor = UIColor(r: 57, g: 125, b: 161)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        
        return label
    }()
    
    let goalLbl3: UILabel = {
        let label = UILabel()
        
        label.text = "Goal"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.layer.zPosition = 2
        
        return label
    }()
    
    let goalTextField5: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let goalTextField6: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let aubreyLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Aubrey"
        label.font = UIFont(name: "AmericanTypewriter-Bold ", size: 28)
        label.textColor = UIColor(r: 57, g: 125, b: 161)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        
        return label
    }()
    
    let netProductionLbl3: UILabel = {
        let label = UILabel()
        
        label.text = "Net Production"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let netProductionTextField7: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let netProductionTextField8: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let daysWorkedLbl3: UILabel = {
        let label = UILabel()
        
        label.text = "# of Days Worked"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let daysWorkedTextField5: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let daysWorkedTextField6: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let productionPerDayLbl3: UILabel = {
        let label = UILabel()
        
        label.text = "Production Per Day"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let productionPerDayTextField5: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let productionPerDayTextField6: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let numberOfHoursWorkedLbl: UILabel = {
        let label = UILabel()
        
        label.text = "# Hours Worked"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let numberOfHoursWorkedTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let numberOfHoursWorkedTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let productionPerHourLbl3: UILabel = {
        let label = UILabel()
        
        label.text = "Production Per Hour"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let productionPerHourTextField5: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let productionPerHourTextField6: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentAppointmentsKeptLbl3: UILabel = {
        let label = UILabel()
        
        label.text = "% Appointments Kept"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let percentAppointmentsKeptTextField5: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentAppointmentsKeptTextField6: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let perioPercentLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Perio %"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let perioPercentTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let perioPercentTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let fluoridePercentLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Fluoride %"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let fluoridePercentTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let fluoridePercentTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let oralIdPercentLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Oral ID %"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let oralIdPercentTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let oralIdPercentTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let arestinPercentLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Arestin %"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let arestinPercentTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let arestinPercentTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let reappointmentRateLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Reappointment Rate"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let reappointmentRateTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let reappointmentRateTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let retentionRateLbl3: UILabel = {
        let label = UILabel()
        
        label.text = "Retebtion Rate"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let retentionRateTextField5: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let retentionRateTextField6: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let categoryHighlight8: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(r: 241, g: 246, b: 248)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let categoryDivider15: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(r: 107, g: 156, b: 183)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let hygieneLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "Hygiene"
        label.font = UIFont(name: "AmericanTypewriter-Bold ", size: 28)
        label.textColor = UIColor(r: 57, g: 125, b: 161)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        
        return label
    }()
    
    let categoryDivider16: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.zPosition = 2
        
        return view
    }()
    
    let dawnLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Dawn"
        label.font = UIFont(name: "AmericanTypewriter-Bold ", size: 28)
        label.textColor = UIColor(r: 57, g: 125, b: 161)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        
        return label
    }()
    
    let goalLbl4: UILabel = {
        let label = UILabel()
        
        label.text = "Goal"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.layer.zPosition = 2
        
        return label
    }()
    
    let goalTextField7: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let goalTextField8: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let sheilaLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Sheila"
        label.font = UIFont(name: "AmericanTypewriter-Bold ", size: 28)
        label.textColor = UIColor(r: 57, g: 125, b: 161)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        
        return label
    }()
    
    let netProductionLbl4: UILabel = {
        let label = UILabel()
        
        label.text = "Net Production"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let netProductionTextField9: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let netProductionTextField10: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let daysWorkedLbl4: UILabel = {
        let label = UILabel()
        
        label.text = "# of Days Worked"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let daysWorkedTextField7: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let daysWorkedTextField8: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let productionPerDayLbl4: UILabel = {
        let label = UILabel()
        
        label.text = "Production Per Day"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let productionPerDayTextField7: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let productionPerDayTextField8: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let numberOfHoursWorkedLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "# Hours Worked"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let numberOfHoursWorkedTextField3: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let numberOfHoursWorkedTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let productionPerHourLbl4: UILabel = {
        let label = UILabel()
        
        label.text = "Production Per Hour"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let productionPerHourTextField7: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let productionPerHourTextField8: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentAppointmentsKeptLbl4: UILabel = {
        let label = UILabel()
        
        label.text = "% Appointments Kept"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let percentAppointmentsKeptTextField7: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentAppointmentsKeptTextField8: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let perioPercentLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "Perio %"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let perioPercentTextField3: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let perioPercentTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let fluoridePercentLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "Fluoride %"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let fluoridePercentTextField3: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let fluoridePercentTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let oralIdPercentLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "Oral ID %"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let oralIdPercentTextField3: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let oralIdPercentTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let arestinPercentLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "Arestin %"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let arestinPercentTextField3: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let arestinPercentTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let reappointmentRateLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "Reappointment Rate"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let reappointmentRateTextField3: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let reappointmentRateTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let retentionRateLbl4: UILabel = {
        let label = UILabel()
        
        label.text = "Retebtion Rate"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let retentionRateTextField7: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let retentionRateTextField8: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let categoryDivider17: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.zPosition = 2
        
        return view
    }()
    
    let goalTextField9: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let ashleyLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Ashley T"
        label.font = UIFont(name: "AmericanTypewriter-Bold ", size: 28)
        label.textColor = UIColor(r: 57, g: 125, b: 161)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        
        return label
    }()
    
    let netProductionTextField11: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let daysWorkedTextField9: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let productionPerDayTextField9: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let numberOfHoursWorkedTextField5: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let productionPerHourTextField9: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentAppointmentsKeptTextField9: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let perioPercentTextField5: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let fluoridePercentTextField5: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let oralIdPercentTextField5: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let arestinPercentTextField5: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let reappointmentRateTextField5: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let retentionRateTextField9: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    lazy var submitButton: UIButton = {
        let button = UIButton(type:  .system)
        
        button.backgroundColor = UIColor.lightGray
        button.setTitle("Submit Changes", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleSubmition), for: .touchUpInside)
        
        return button
    }()
    
    lazy var logOutButton: UIButton = {
        let button = UIButton(type:  .system)
        
        button.backgroundColor = UIColor.lightGray
        button.setTitle("Log Out", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleLogOut), for: .touchUpInside)
        
        return button
    }()
    
    let jessicaLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Jessica"
        label.font = UIFont(name: "AmericanTypewriter-Bold ", size: 28)
        label.textColor = UIColor(r: 57, g: 125, b: 161)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        
        return label
    }()
    
    let amountPresentedTextField7: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let amountAcceptedTextField7: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentOfDollarAmountScheduledTextField7: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let numberPatientsAcceptedTreatmentTextField7: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let numberPatientsPresentedTreatmentTextField7: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentPatientsAcceptedTreatmentTextField7: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let scheduledAppointmentsLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Scheduled Appointments"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let scheduledAppointmentsLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "Scheduled Appointments"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let scheduledAppointmentsTextField1: UITextField = {
       let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let scheduledAppointmentsTextField2: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let scheduledAppointmentsTextField3: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let scheduledAppointmentsTextField4: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let appointmentsKeptLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Appointments Kept"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let appointmentsKeptLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "Appointments Kept"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let appointmentsKeptTextField1: UITextField = {
       let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let appointmentsKeptTextField2: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let appointmentsKeptTextField3: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let appointmentsKeptTextField4: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let scheduledAppointmentsLbl3: UILabel = {
        let label = UILabel()
        
        label.text = "Scheduled Appointments"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let scheduledAppointmentsLbl4: UILabel = {
        let label = UILabel()
        
        label.text = "Scheduled Appointments"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        label.lineBreakMode = .byClipping
        label.numberOfLines = 0
        
        return label
    }()
    
    let scheduledAppointmentsTextField5: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let scheduledAppointmentsTextField6: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let scheduledAppointmentsTextField7: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let scheduledAppointmentsTextField8: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let scheduledAppointmentsTextField9: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let appointmentsKeptLbl3: UILabel = {
        let label = UILabel()
        
        label.text = "Appointments Kept"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let appointmentsKeptLbl4: UILabel = {
        let label = UILabel()
        
        label.text = "Appointments Kept"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let appointmentsKeptTextField5: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let appointmentsKeptTextField6: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let appointmentsKeptTextField7: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let appointmentsKeptTextField8: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let appointmentsKeptTextField9: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let fluoridePresentedLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Fluoride Presented"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let fluoridePresentedLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "Fluoride Presented"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let fluoridePresentedTextField1: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let fluoridePresentedTextField2: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let fluoridePresentedTextField3: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let fluoridePresentedTextField4: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let fluoridePresentedTextField5: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let fluorideAcceptedLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Fluoride Accepted"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let fluorideAcceptedLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "Fluoride Accepted"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let fluorideAcceptedTextField1: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let fluorideAcceptedTextField2: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let fluorideAcceptedTextField3: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let fluorideAcceptedTextField4: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let fluorideAcceptedTextField5: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let oralIDPresentedLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Oral ID Presented"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let oralIDPresentedLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "Oral ID Presented"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let oralIDPresentedTextField1: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let oralIDPresentedTextField2: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let oralIDPresentedTextField3: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let oralIDPresentedTextField4: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let oralIDPresentedTextField5: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let oralIDAcceptedLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Oral ID Accepted"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let oralIDAcceptedLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "Oral ID Accepted"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let oralIDAcceptedTextField1: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let oralIDAcceptedTextField2: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let oralIDAcceptedTextField3: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let oralIDAcceptedTextField4: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let oralIDAcceptedTextField5: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let arestinPresentedLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Arestin Presented"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let arestinPresentedLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "Arestin Presented"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let arestinPresentedTextField1: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let arestinPresentedTextField2: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let arestinPresentedTextField3: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let arestinPresentedTextField4: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let arestinPresentedTextField5: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let arestinAcceptedLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Arestin Accepted"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let arestinAcceptedLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "Arestin Accepted"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let arestinAcceptedTextField1: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let arestinAcceptedTextField2: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let arestinAcceptedTextField3: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let arestinAcceptedTextField4: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let arestinAcceptedTextField5: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let appointmentsSeenLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Appointments Seen"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let appointmentsSeenLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "Appointments Seen"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let appointmentsSeenTextField1: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let appointmentsSeenTextField2: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let appointmentsSeenTextField3: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let appointmentsSeenTextField4: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let appointmentsSeenTextField5: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let reappointmentsLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Reappointments"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let reappointmentsLbl2: UILabel = {
        let label = UILabel()
        
        label.text = "Reappointments"
        label.font = UIFont(name: "AmericanTypewriter", size: 28)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = UIColor.white
        
        return label
    }()
    
    let reappointmentsTextField1: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let reappointmentsTextField2: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let reappointmentsTextField3: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let reappointmentsTextField4: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let reappointmentsTextField5: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = ""
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let woodstockNetProductionRef = Database.database().reference().child("WoodstockNetProduction")
    let woodstockCollectionsRef = Database.database().reference().child("WoodstockCollections")
    let woodstockInsuranceCollectionsRef = Database.database().reference().child("WoodstockInsuranceCollections")
    let woodstockOTCollectionsRef = Database.database().reference().child("WoodstockOTCCollections")
    let woodstockDollarAmountRefundedToInsuranceRef = Database.database().reference().child("WoodstockDollarAmountRefundedToInsurance")
    let woodstockDollarAmountRefundedToPatientsRef = Database.database().reference().child("WoodstockDollarAmountRefundedToPatients")
    let woodstockPercentOTCToTotalCollectionsRef = Database.database().reference().child("WoodstockPercentOTCToTotalCollections")
    let woodstockPercentInsuranceToTotalCollectionsRef = Database.database().reference().child("WoodstockPercentInsuranceToTotalCollections")
    let woodstockPercentCollectionsToNetProductionRef = Database.database().reference().child("WoodstockPercentCollectionsToNetProduction")
    let woodstockProductionPerActiveChairRef = Database.database().reference().child("WoodstockProductionPerActiveChair")
    
    let kennesawNetProductionRef = Database.database().reference().child("KennesawNetProduction")
    let kennesawCollectionsRef = Database.database().reference().child("KennesawCollections")
    let kennesawInsuranceCollectionsRef = Database.database().reference().child("KennesawInsuranceCollections")
    let kennesawOTCollectionsRef = Database.database().reference().child("KennesawOTCCollections")
    let kennesawDollarAmountRefundedToInsuranceRef = Database.database().reference().child("KennesawDollarAmountRefundedToInsurance")
    let kennesawDollarAmountRefundedToPatientsRef = Database.database().reference().child("KennesawDollarAmountRefundedToPatients")
    let kennesawPercentOTCToTotalCollectionsRef = Database.database().reference().child("KennesawPercentOTCToTotalCollections")
    let kennesawPercentInsuranceToTotalCollectionsRef = Database.database().reference().child("KennesawPercentInsuranceToTotalCollections")
    let kennesawPercentCollectionsToNetProductionRef = Database.database().reference().child("KennesawPercentCollectionsToNetProduction")
    let kennesawProductionPerActiveChairRef = Database.database().reference().child("KennesawProductionPerActiveChair")
    
    let heatherDyerAmountPresentedRef = Database.database().reference().child("HeatherDyerAmountPresented")
    let heatherDyerAmountAcceptedRef = Database.database().reference().child("HeatherDyerAmountAccepted")
    let heatherDyerPercentOfDollarAmountScheduledRef = Database.database().reference().child("HeatherDyerPercentOfDollarAmountScheduled")
    let heatherDyerNumberOfPatientsPresentedTreatmentRef = Database.database().reference().child("HeatherDyerNumberOfPatientsPresentedTreatment")
    let heatherDyerNumberOfPatientsAcceptedTreatmentRef = Database.database().reference().child("HeatherDyerNumberOfPatientsAcceptedTreatment")
    let heatherDyerPercentOfPatientAcceptedTreatmentRef = Database.database().reference().child("HeatherDyerPercentOfPatientsAcceptedTreatment")
    
    let hollyAmountPresentedRef = Database.database().reference().child("HollyAmountPresented")
    let hollyAmountAcceptedRef = Database.database().reference().child("HollyAmountAccepted")
    let hollyPercentOfDollarAmountScheduledRef = Database.database().reference().child("HollyPercentOfDollarAmountScheduled")
    let hollyNumberOfPatientsPresentedTreatmentRef = Database.database().reference().child("HollyNumberOfPatientsPresentedTreatment")
    let hollyNumberOfPatientsAcceptedTreatmentRef = Database.database().reference().child("HollyNumberOfPatientsAcceptedTreatment")
    let hollyPercentOfPatientAcceptedTreatmentRef = Database.database().reference().child("HollyPercentOfPatientsAcceptedTreatment")
    
    let sydneyAmountPresentedRef = Database.database().reference().child("SydneyAmountPresented")
    let sydneyAmountAcceptedRef = Database.database().reference().child("SydneyAmountAccepted")
    let sydneyPercentOfDollarAmountScheduledRef = Database.database().reference().child("SydneyPercentOfDollarAmountScheduled")
    let sydneyNumberOfPatientsPresentedTreatmentRef = Database.database().reference().child("SydneyNumberOfPatientsPresentedTreatment")
    let sydneyNumberOfPatientsAcceptedTreatmentRef = Database.database().reference().child("SydneyNumberOfPatientsAcceptedTreatment")
    let sydneyPercentOfPatientAcceptedTreatmentRef = Database.database().reference().child("SydneyPercentOfPatientsAcceptedTreatment")
    
    let amandaAmountPresentedRef = Database.database().reference().child("AmandaAmountPresented")
    let amandaAmountAcceptedRef = Database.database().reference().child("AmandaAmountAccepted")
    let amandaPercentOfDollarAmountScheduledRef = Database.database().reference().child("AmandaPercentOfDollarAmountScheduled")
    let amandaNumberOfPatientsPresentedTreatmentRef = Database.database().reference().child("AmandaNumberOfPatientsPresentedTreatment")
    let amandaNumberOfPatientsAcceptedTreatmentRef = Database.database().reference().child("AmandaNumberOfPatientsAcceptedTreatment")
    let amandaPercentOfPatientAcceptedTreatmentRef = Database.database().reference().child("AmandaPercentOfPatientsAcceptedTreatment")
    
    let ashleyAmountPresentedRef = Database.database().reference().child("AshleyAmountPresented")
    let ashleyAmountAcceptedRef = Database.database().reference().child("AshleyAmountAccepted")
    let ashleyPercentOfDollarAmountScheduledRef = Database.database().reference().child("AshleyPercentOfDollarAmountScheduled")
    let ashleyNumberOfPatientsPresentedTreatmentRef = Database.database().reference().child("AshleyNumberOfPatientsPresentedTreatment")
    let ashleyNumberOfPatientsAcceptedTreatmentRef = Database.database().reference().child("AshleyNumberOfPatientsAcceptedTreatment")
    let ashleyPercentOfPatientAcceptedTreatmentRef = Database.database().reference().child("AshleyPercentOfPatientsAcceptedTreatment")
    
    let debbieAmountPresentedRef = Database.database().reference().child("DebbieAmountPresented")
    let debbieAmountAcceptedRef = Database.database().reference().child("DebbieAmountAccepted")
    let debbiePercentOfDollarAmountScheduledRef = Database.database().reference().child("DebbiePercentOfDollarAmountScheduled")
    let debbieNumberOfPatientsPresentedTreatmentRef = Database.database().reference().child("DebbieNumberOfPatientsPresentedTreatment")
    let debbieNumberOfPatientsAcceptedTreatmentRef = Database.database().reference().child("DebbieNumberOfPatientsAcceptedTreatment")
    let debbiePercentOfPatientAcceptedTreatmentRef = Database.database().reference().child("DebbiePercentOfPatientsAcceptedTreatment")
    
    let annaAmountPresentedRef = Database.database().reference().child("AnnaAmountPresented")
    let annaAmountAcceptedRef = Database.database().reference().child("AnnaAmountAccepted")
    let annaPercentOfDollarAmountScheduledRef = Database.database().reference().child("AnnaPercentOfDollarAmountScheduled")
    let annaNumberOfPatientsPresentedTreatmentRef = Database.database().reference().child("AnnaNumberOfPatientsPresentedTreatment")
    let annaNumberOfPatientsAcceptedTreatmentRef = Database.database().reference().child("AnnaNumberOfPatientsAcceptedTreatment")
    let annaPercentOfPatientAcceptedTreatmentRef = Database.database().reference().child("AnnaPercentOfPatientsAcceptedTreatment")
    
    let jessicaAmountPresentedRef = Database.database().reference().child("JessicaAmountPresented")
    let jessicaAmountAcceptedRef = Database.database().reference().child("JessicaAmountAccepted")
    let jessicaPercentOfDollarAmountScheduledRef = Database.database().reference().child("JessicaPercentOfDollarAmountScheduled")
    let jessicaNumberOfPatientsPresentedTreatmentRef = Database.database().reference().child("JessicaNumberOfPatientsPresentedTreatment")
    let jessicaNumberOfPatientsAcceptedTreatmentRef = Database.database().reference().child("JessicaNumberOfPatientsAcceptedTreatment")
    let jessicaPercentOfPatientAcceptedTreatmentRef = Database.database().reference().child("JessicaPercentOfPatientsAcceptedTreatment")
    
    let drVGoalRef = Database.database().reference().child("DrVGoal")
    let drVNetProductionRef = Database.database().reference().child("DrVNetProduction")
    let drVDaysWorkedRef = Database.database().reference().child("DrVDaysWorked")
    let drVProductionPerDayRef = Database.database().reference().child("DrVProductionPerDay")
    let drVProductionPerHourRef = Database.database().reference().child("DrVProductionPerHour")
    let drVDollarAmountSameDayTreatmentRef = Database.database().reference().child("DrVDollarAmountSameDayTreatment")
    let drVPercentAppointmentsKeptRef = Database.database().reference().child("DrVPercentAppointmentsKept")
    let drVRetentionRateRef = Database.database().reference().child("DrVRetentionRate")
    let drVScheduledAppointmentsRef = Database.database().reference().child("DrVScheduledAppointments")
    let drVAppointmentsKeptRef = Database.database().reference().child("DrVAppointmentsKept")
    
    let drMcreeGoalRef = Database.database().reference().child("DrMcreeGoal")
    let drMcreeNetProductionRef = Database.database().reference().child("DrMcreeNetProduction")
    let drMcreeDaysWorkedRef = Database.database().reference().child("DrMcreeDaysWorked")
    let drMcreeProductionPerDayRef = Database.database().reference().child("DrMcreeProductionPerDay")
    let drMcreeProductionPerHourRef = Database.database().reference().child("DrMcreeProductionPerHour")
    let drMcreeDollarAmountSameDayTreatmentRef = Database.database().reference().child("DrMcreeDollarAmountSameDayTreatment")
    let drMcreeScheduledAppointmentsRef = Database.database().reference().child("DrMcreeScheduledAppointments")
    let drMcreeAppointmentsKeptRef = Database.database().reference().child("DrMcreeAppointmentsKept")
    let drMcreePercentAppointmentsKeptRef = Database.database().reference().child("DrMcreePercentAppointmentsKept")
    let drMcreeRetentionRateRef = Database.database().reference().child("DrMcreeRetentionRate")
    
    let drOrzaGoalRef = Database.database().reference().child("DrOrzaGoal")
    let drOrzaNetProductionRef = Database.database().reference().child("DrOrzaNetProduction")
    let drOrzaDaysWorkedRef = Database.database().reference().child("DrOrzaDaysWorked")
    let drOrzaProductionPerDayRef = Database.database().reference().child("DrOrzaProductionPerDay")
    let drOrzaProductionPerHourRef = Database.database().reference().child("DrOrzaProductionPerHour")
    let drOrzaDollarAmountSameDayTreatmentRef = Database.database().reference().child("DrOrzaDollarAmountSameDayTreatment")
    let drOrzaScheduledAppointmentsRef = Database.database().reference().child("DrOrzaScheduledAppointments")
    let drOrzaAppointmentsKeptRef = Database.database().reference().child("DrOrzaAppointmentsKept")
    let drOrzaPercentAppointmentsKeptRef = Database.database().reference().child("DrOrzaPercentAppointmentsKept")
    let drOrzaRetentionRateRef = Database.database().reference().child("DrOrzaRetentionRate")
    
    let drFranGoalRef = Database.database().reference().child("DrFranGoal")
    let drFranNetProductionRef = Database.database().reference().child("DrFranNetProduction")
    let drFranDaysWorkedRef = Database.database().reference().child("DrFranDaysWorked")
    let drFranProductionPerDayRef = Database.database().reference().child("DrFranProductionPerDay")
    let drFranProductionPerHourRef = Database.database().reference().child("DrFranProductionPerHour")
    let drFranDollarAmountSameDayTreatmentRef = Database.database().reference().child("DrFranDollarAmountSameDayTreatment")
    let drFranScheduledAppointmentsRef = Database.database().reference().child("DrFranScheduledAppointments")
    let drFranAppointmentsKeptRef = Database.database().reference().child("DrFranAppointmentsKept")
    let drFranPercentAppointmentsKeptRef = Database.database().reference().child("DrFranPercentAppointmentsKept")
    let drFranRetentionRateRef = Database.database().reference().child("DrFranRetentionRate")
    
    let amyGoalRef = Database.database().reference().child("AmyGoal")
    let amyNetProductionRef = Database.database().reference().child("AmyNetProduction")
    let amyDaysWorkedRef = Database.database().reference().child("AmyDaysWorked")
    let amyProductionPerDayRef = Database.database().reference().child("AmyProductionPerDay")
    let amyHoursWorkedRef = Database.database().reference().child("AmyHoursWorked")
    let amyProductionPerHourRef = Database.database().reference().child("AmyProductionPerHour")
    let amyScheduledAppointmentsRef = Database.database().reference().child("AmyScheduledAppointments")
    let amyAppointmentsKeptRef = Database.database().reference().child("AmyAppointmentsKept")
    let amyPercentAppointmentsKeptRef = Database.database().reference().child("AmyPercentAppointmentsKept")
    let amyPerioPercentRef = Database.database().reference().child("AmyPerioPercent")
    let amyFluoridePercentRef = Database.database().reference().child("AmyFluoridePercent")
    let amyOralIDPercentRef = Database.database().reference().child("AmyOralIDPercent")
    let amyArestinPercentRef = Database.database().reference().child("AmyArestinPercent")
    let amyReappointmentRateRef = Database.database().reference().child("AmyReappointmentRate")
    let amyRetentionRateRef = Database.database().reference().child("AmyRetentionRate")
    let amyFluoridePresentedRef = Database.database().reference().child("AmyFluoridePresented")
    let amyFluorideAcceptedRef = Database.database().reference().child("AmyFluorideAccepted")
    let amyOralIDPresentedRef = Database.database().reference().child("AmyOralIDPresented")
    let amyOralIDAcceptedRef = Database.database().reference().child("AmyOralIDAccepted")
    let amyArestinPresentedRef = Database.database().reference().child("AmyArestinPresented")
    let amyArestinAcceptedRef = Database.database().reference().child("AmyArestinAccepted")
    let amyAppointmentsSeenRef = Database.database().reference().child("AmyAppointmentsSeen")
    let amyReappointmentsRef = Database.database().reference().child("AmyReappointments")
    
    let aubreyGoalRef = Database.database().reference().child("AubreyGoal")
    let aubreyNetProductionRef = Database.database().reference().child("AubreyNetProduction")
    let aubreyDaysWorkedRef = Database.database().reference().child("AubreyDaysWorked")
    let aubreyProductionPerDayRef = Database.database().reference().child("AubreyProductionPerDay")
    let aubreyHoursWorkedRef = Database.database().reference().child("AubreyHoursWorked")
    let aubreyProductionPerHourRef = Database.database().reference().child("AubreyProductionPerHour")
    let aubreyScheduledAppointmentsRef = Database.database().reference().child("AubreyScheduledAppointments")
    let aubreyAppointmentsKeptRef = Database.database().reference().child("AubreyAppointmentsKept")
    let aubreyPercentAppointmentsKeptRef = Database.database().reference().child("AubreyPercentAppointmentsKept")
    let aubreyPerioPercentRef = Database.database().reference().child("AubreyPerioPercent")
    let aubreyFluoridePercentRef = Database.database().reference().child("AubreyFluoridePercent")
    let aubreyOralIDPercentRef = Database.database().reference().child("AubreyOralIDPercent")
    let aubreyArestinPercentRef = Database.database().reference().child("AubreyArestinPercent")
    let aubreyReappointmentRateRef = Database.database().reference().child("AubreyReappointmentRate")
    let aubreyRetentionRateRef = Database.database().reference().child("AubreyRetentionRate")
    let aubreyFluoridePresentedRef = Database.database().reference().child("AubreyFluoridePresented")
    let aubreyFluorideAcceptedRef = Database.database().reference().child("AubreyFluorideAccepted")
    let aubreyOralIDPresentedRef = Database.database().reference().child("AubreyOralIDPresented")
    let aubreyOralIDAcceptedRef = Database.database().reference().child("AubreyOralIDAccepted")
    let aubreyArestinPresentedRef = Database.database().reference().child("AubreyArestinPresented")
    let aubreyArestinAcceptedRef = Database.database().reference().child("AubreyArestinAccepted")
    let aubreyAppointmentsSeenRef = Database.database().reference().child("AubreyAppointmentsSeen")
    let aubreyReappointmentsRef = Database.database().reference().child("AubreyReappointments")
    
    let dawnGoalRef = Database.database().reference().child("DawnGoal")
    let dawnNetProductionRef = Database.database().reference().child("DawnNetProduction")
    let dawnDaysWorkedRef = Database.database().reference().child("DawnDaysWorked")
    let dawnProductionPerDayRef = Database.database().reference().child("DawnProductionPerDay")
    let dawnHoursWorkedRef = Database.database().reference().child("DawnHoursWorked")
    let dawnProductionPerHourRef = Database.database().reference().child("DawnProductionPerHour")
    let dawnScheduledAppointmentsRef = Database.database().reference().child("DawnScheduledAppointments")
    let dawnAppointmentsKeptRef = Database.database().reference().child("DawnAppointmentsKept")
    let dawnPercentAppointmentsKeptRef = Database.database().reference().child("DawnPercentAppointmentsKept")
    let dawnPerioPercentRef = Database.database().reference().child("DawnPerioPercent")
    let dawnFluoridePercentRef = Database.database().reference().child("DawnFluoridePercent")
    let dawnOralIDPercentRef = Database.database().reference().child("DawnOralIDPercent")
    let dawnArestinPercentRef = Database.database().reference().child("DawnArestinPercent")
    let dawnReappointmentRateRef = Database.database().reference().child("DawnReappointmentRate")
    let dawnRetentionRateRef = Database.database().reference().child("DawnRetentionRate")
    let dawnFluoridePresentedRef = Database.database().reference().child("DawnFluoridePresented")
    let dawnFluorideAcceptedRef = Database.database().reference().child("DawnFluorideAccepted")
    let dawnOralIDPresentedRef = Database.database().reference().child("DawnOralIDPresented")
    let dawnOralIDAcceptedRef = Database.database().reference().child("DawnOralIDAccepted")
    let dawnArestinPresentedRef = Database.database().reference().child("DawnArestinPresented")
    let dawnArestinAcceptedRef = Database.database().reference().child("DawnArestinAccepted")
    let dawnAppointmentsSeenRef = Database.database().reference().child("DawnAppointmentsSeen")
    let dawnReappointmentsRef = Database.database().reference().child("DawnReappointments")
    
    let sheilaGoalRef = Database.database().reference().child("SheilaGoal")
    let sheilaNetProductionRef = Database.database().reference().child("SheilaNetProduction")
    let sheilaDaysWorkedRef = Database.database().reference().child("SheilaDaysWorked")
    let sheilaProductionPerDayRef = Database.database().reference().child("SheilaProductionPerDay")
    let sheilaHoursWorkedRef = Database.database().reference().child("SheilaHoursWorked")
    let sheilaProductionPerHourRef = Database.database().reference().child("SheilaProductionPerHour")
    let sheilaScheduledAppointmentsRef = Database.database().reference().child("SheilaScheduledAppointments")
    let sheilaAppointmentsKeptRef = Database.database().reference().child("SheilaAppointmentsKept")
    let sheilaPercentAppointmentsKeptRef = Database.database().reference().child("SheilaPercentAppointmentsKept")
    let sheilaPerioPercentRef = Database.database().reference().child("SheilaPerioPercent")
    let sheilaFluoridePercentRef = Database.database().reference().child("SheilaFluoridePercent")
    let sheilaOralIDPercentRef = Database.database().reference().child("SheilaOralIDPercent")
    let sheilaArestinPercentRef = Database.database().reference().child("SheilaArestinPercent")
    let sheilaReappointmentRateRef = Database.database().reference().child("SheilaReappointmentRate")
    let sheilaRetentionRateRef = Database.database().reference().child("SheilaRetentionRate")
    let sheilaFluoridePresentedRef = Database.database().reference().child("SheilaFluoridePresented")
    let sheilaFluorideAcceptedRef = Database.database().reference().child("SheilaFluorideAccepted")
    let sheilaOralIDPresentedRef = Database.database().reference().child("SheilaOralIDPresented")
    let sheilaOralIDAcceptedRef = Database.database().reference().child("SheilaOralIDAccepted")
    let sheilaArestinPresentedRef = Database.database().reference().child("SheilaArestinPresented")
    let sheilaArestinAcceptedRef = Database.database().reference().child("SheilaArestinAccepted")
    let sheilaAppointmentsSeenRef = Database.database().reference().child("SheilaAppointmentsSeen")
    let sheilaReappointmentsRef = Database.database().reference().child("SheilaReappointments")
    
    let ashleyGoalRef = Database.database().reference().child("AshleyGoal")
    let ashleyNetProductionRef = Database.database().reference().child("AshleyNetProduction")
    let ashleyDaysWorkedRef = Database.database().reference().child("AshleyDaysWorked")
    let ashleyProductionPerDayRef = Database.database().reference().child("AshleyProductionPerDay")
    let ashleyHoursWorkedRef = Database.database().reference().child("AshleyHoursWorked")
    let ashleyProductionPerHourRef = Database.database().reference().child("AshleyProductionPerHour")
    let ashleyScheduledAppointmentsRef = Database.database().reference().child("AshleyScheduledAppointments")
    let ashleyAppointmentsKeptRef = Database.database().reference().child("AshleyAppointmentsKept")
    let ashleyPercentAppointmentsKeptRef = Database.database().reference().child("AshleyPercentAppointmentsKept")
    let ashleyPerioPercentRef = Database.database().reference().child("AshleyPerioPercent")
    let ashleyFluoridePercentRef = Database.database().reference().child("AshleyFluoridePercent")
    let ashleyOralIDPercentRef = Database.database().reference().child("AshleyOralIDPercent")
    let ashleyArestinPercentRef = Database.database().reference().child("AshleyArestinPercent")
    let ashleyReappointmentRateRef = Database.database().reference().child("AshleyReappointmentRate")
    let ashleyRetentionRateRef = Database.database().reference().child("AshleyRetentionRate")
    let ashleyFluoridePresentedRef = Database.database().reference().child("AshleyFluoridePresented")
    let ashleyFluorideAcceptedRef = Database.database().reference().child("AshleyFluorideAccepted")
    let ashleyOralIDPresentedRef = Database.database().reference().child("AshleyOralIDPresented")
    let ashleyOralIDAcceptedRef = Database.database().reference().child("AshleyOralIDAccepted")
    let ashleyArestinPresentedRef = Database.database().reference().child("AshleyArestinPresented")
    let ashleyArestinAcceptedRef = Database.database().reference().child("AshleyArestinAccepted")
    let ashleyAppointmentsSeenRef = Database.database().reference().child("AshleyAppointmentsSeen")
    let ashleyReappointmentsRef = Database.database().reference().child("AshleyReappointments")
    
    var sessionWoodstockCollectionsValue: Double = 0.0
    var sessionWoodstockOTCCollectionsValue: Double = 0.0
    var sessionWoodstockInsuranceCollectionsValue: Double = 0.0
    var sessionWoodstockNetProductionsValue: Double = 0.0
    
    var sessionKennesawCollectionsValue: Double = 0.0
    var sessionKennesawOTCCollectionsValue: Double = 0.0
    var sessionKennesawInsuranceCollectionsValue: Double = 0.0
    var sessionKennesawNetProductionValue: Double = 0.0
    
    var sessionHeatherDyerAmountPresentedValue: Double = 0.0
    var sessionHeatherDyerAmountAcceptedValue: Double = 0.0
    var sessionHeatherDyerPatientsPresesntedValue: Double = 0.0
    var sessionHeatherDyerPatientsAcceptedValue: Double = 0.0
    
    var sessionHollyAmountPresentedValue: Double = 0.0
    var sessionHollyAmountAcceptedValue: Double = 0.0
    var sessionHollyPatientsPresesntedValue: Double = 0.0
    var sessionHollyPatientsAcceptedValue: Double = 0.0
    
    var sessionSydneyAmountPresentedValue: Double = 0.0
    var sessionSydneyAmountAcceptedValue: Double = 0.0
    var sessionSydneyPatientsPresesntedValue: Double = 0.0
    var sessionSydneyPatientsAcceptedValue: Double = 0.0
    
    var sessionAmandaAmountPresentedValue: Double = 0.0
    var sessionAmandaAmountAcceptedValue: Double = 0.0
    var sessionAmandaPatientsPresesntedValue: Double = 0.0
    var sessionAmandaPatientsAcceptedValue: Double = 0.0
   
    var sessionAshleyGAmountPresentedValue: Double = 0.0
    var sessionAshleyGAmountAcceptedValue: Double = 0.0
    var sessionAshleyGPatientsPresesntedValue: Double = 0.0
    var sessionAshleyGPatientsAcceptedValue: Double = 0.0
    
    var sessionDebbieDAmountPresentedValue: Double = 0.0
    var sessionDebbieDAmountAcceptedValue: Double = 0.0
    var sessionDebbieDPatientsPresesntedValue: Double = 0.0
    var sessionDebbieDPatientsAcceptedValue: Double = 0.0
   
    var sessionAnnaCAmountPresentedValue: Double = 0.0
    var sessionAnnaCAmountAcceptedValue: Double = 0.0
    var sessionAnnaCPatientsPresesntedValue: Double = 0.0
    var sessionAnnaCPatientsAcceptedValue: Double = 0.0
    
    var sessionJessicaAmountPresentedValue: Double = 0.0
    var sessionJessicaAmountAcceptedValue: Double = 0.0
    var sessionJessicaPatientsPresesntedValue: Double = 0.0
    var sessionJessicaPatientsAcceptedValue: Double = 0.0
    
    var sessionDrVNetProductionValue: Int = 0
    var sessionDrVDaysWorkedValue: Int = 0
    var sessionDrVScheduledAppointmentsValue: Double = 0.0
    var sessionDrVAppointmentsKeptValue: Double = 0.0
    
    var sessionDrMcreeNetProductionValue: Int = 0
    var sessionDrMcreeDaysWorkedValue: Int = 0
    var sessionDrMcreeScheduledAppointmentsValue: Double = 0.0
    var sessionDrMcreeAppointmentsKeptValue: Double = 0.0
    
    var sessionDrOrzaNetProductionValue: Int = 0
    var sessionDrOrzaDaysWorkedValue: Int = 0
    var sessionDrOrzaScheduledAppointmentsValue: Double = 0.0
    var sessionDrOrzaAppointmentsKeptValue: Double = 0.0
    
    var sessionDrFranNetProductionValue: Int = 0
    var sessionDrFranDaysWorkedValue: Int = 0
    var sessionDrFranScheduledAppointmentsValue: Double = 0.0
    var sessionDrFranAppointmentsKeptValue: Double = 0.0
    
    var sessionAmyScheduledAppointmentsValue: Double = 0.0
    var sessionAmyAppointmentsKeptValue: Double = 0.0
    var sessionAmyNetProductionValue: Int = 0
    var sessionAmyDaysWorkedValue: Int = 0
    var sessionAmyHoursWorkedValue: Int = 0
    var sessionAmyFluoridePresentedValue: Double = 0
    var sessionAmyFluorideAcceptedValue: Double = 0
    var sessionAmyOralIDPresentedValue: Double = 0
    var sessionAmyOralIDAcceptedValue: Double = 0
    var sessionAmyArestinPresentedValue: Double = 0
    var sessionAmyArestinAcceptedValue: Double = 0
    var sessionAmyAppointmentsSeenValue: Double = 0
    var sessionAmyReappointmentsValue: Double = 0
    
    var sessionAubreyScheduledAppointmentsValue: Double = 0.0
    var sessionAubreyAppointmentsKeptValue: Double = 0.0
    var sessionAubreyNetProductionValue: Int = 0
    var sessionAubreyDaysWorkedValue: Int = 0
    var sessionAubreyHoursWorkedValue: Int = 0
    var sessionAubreyFluoridePresentedValue: Double = 0
    var sessionAubreyFluorideAcceptedValue: Double = 0
    var sessionAubreyOralIDPresentedValue: Double = 0
    var sessionAubreyOralIDAcceptedValue: Double = 0
    var sessionAubreyArestinPresentedValue: Double = 0
    var sessionAubreyArestinAcceptedValue: Double = 0
    var sessionAubreyAppointmentsSeenValue: Double = 0
    var sessionAubreyReappointmentsValue: Double = 0
    
    var sessionDawnScheduledAppointmentsValue: Double = 0.0
    var sessionDawnAppointmentsKeptValue: Double = 0.0
    var sessionDawnNetProductionValue: Int = 0
    var sessionDawnDaysWorkedValue: Int = 0
    var sessionDawnHoursWorkedValue: Int = 0
    var sessionDawnFluoridePresentedValue: Double = 0
    var sessionDawnFluorideAcceptedValue: Double = 0
    var sessionDawnOralIDPresentedValue: Double = 0
    var sessionDawnOralIDAcceptedValue: Double = 0
    var sessionDawnArestinPresentedValue: Double = 0
    var sessionDawnArestinAcceptedValue: Double = 0
    var sessionDawnAppointmentsSeenValue: Double = 0
    var sessionDawnReappointmentsValue: Double = 0
    
    var sessionSheilaScheduledAppointmentsValue: Double = 0.0
    var sessionSheilaAppointmentsKeptValue: Double = 0.0
    var sessionSheilaNetProductionValue: Int = 0
    var sessionSheilaDaysWorkedValue: Int = 0
    var sessionSheilaHoursWorkedValue: Int = 0
    var sessionSheilaFluoridePresentedValue: Double = 0
    var sessionSheilaFluorideAcceptedValue: Double = 0
    var sessionSheilaOralIDPresentedValue: Double = 0
    var sessionSheilaOralIDAcceptedValue: Double = 0
    var sessionSheilaArestinPresentedValue: Double = 0
    var sessionSheilaArestinAcceptedValue: Double = 0
    var sessionSheilaAppointmentsSeenValue: Double = 0
    var sessionSheilaReappointmentsValue: Double = 0
    
    var sessionAshleyScheduledAppointmentsValue: Double = 0.0
    var sessionAshleyAppointmentsKeptValue: Double = 0.0
    var sessionAshleyNetProductionValue: Int = 0
    var sessionAshleyDaysWorkedValue: Int = 0
    var sessionAshleyHoursWorkedValue: Int = 0
    var sessionAshleyFluoridePresentedValue: Double = 0
    var sessionAshleyFluorideAcceptedValue: Double = 0
    var sessionAshleyOralIDPresentedValue: Double = 0
    var sessionAshleyOralIDAcceptedValue: Double = 0
    var sessionAshleyArestinPresentedValue: Double = 0
    var sessionAshleyArestinAcceptedValue: Double = 0
    var sessionAshleyAppointmentsSeenValue: Double = 0
    var sessionAshleyReappointmentsValue: Double = 0
    
    lazy var resetButton: UIButton = {
        let button = UIButton(type:  .system)
        
        button.backgroundColor = UIColor.white
        button.setTitle("Reset", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.lightGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleReset), for: .touchUpInside)
        
        return button
    }()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        navigationItem.title = "MainViewController"
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.isNavigationBarHidden = true
        
        if currentUser == "juliancearley@gmail.com" {
            heatherDyerAmountPresentedTextField.isEnabled = true
            heatherDyerAmountAcceptedTextField.isEnabled = true
            heatherDyerPercentOfDollarAmountScheduledTextField.isEnabled = false
            heatherDyerNumberPatientsPresentedTreatmentTextField.isEnabled = true
            heatherDyerNumberPatientsAcceptedTreatmentTextField.isEnabled = true
            heatherDyerPercentPatientsAcceptedTreatmentTextField.isEnabled = false
            
            netProductionTextField1.isEnabled = true
            netProductionTextField2.isEnabled = true
            collectionsTextField1.isEnabled = true
            collectionsTextField2.isEnabled = true
            insuranceCollectionsTextField1.isEnabled = true
            insuranceCollectionsTextField2.isEnabled = true
            otcCollectionsTextField1.isEnabled = true
            otcCollectionsTextField2.isEnabled = true
            amountRefundedToInsuranceTextField1.isEnabled = true
            amountRefundedToInsuranceTextField2.isEnabled = true
            amountRefundedToPatientsTextField1.isEnabled = true
            amountRefundedToPatientsTextField2.isEnabled = true
            
            amountPresentedTextField1.isEnabled = true
            amountPresentedTextField2.isEnabled = true
            amountAcceptedTextField1.isEnabled = true
            amountAcceptedTextField2.isEnabled = true
            numberPatientsPresentedTreatmentTextField1.isEnabled = true
            numberPatientsPresentedTreatmentTextField2.isEnabled = true
            numberPatientsAcceptedTreatmentTextField1.isEnabled = true
            numberPatientsAcceptedTreatmentTextField2.isEnabled = true
            
            amountPresentedTextField3.isEnabled = true
            amountPresentedTextField4.isEnabled = true
            amountAcceptedTextField3.isEnabled = true
            amountAcceptedTextField4.isEnabled = true
            numberPatientsPresentedTreatmentTextField3.isEnabled = true
            numberPatientsPresentedTreatmentTextField4.isEnabled = true
            numberPatientsAcceptedTreatmentTextField3.isEnabled = true
            numberPatientsAcceptedTreatmentTextField4.isEnabled = true
            
            amountPresentedTextField5.isEnabled = true
            amountPresentedTextField6.isEnabled = true
            amountPresentedTextField7.isEnabled = true
            amountAcceptedTextField5.isEnabled = true
            amountAcceptedTextField6.isEnabled = true
            amountAcceptedTextField7.isEnabled = true
            numberPatientsPresentedTreatmentTextField5.isEnabled = true
            numberPatientsPresentedTreatmentTextField6.isEnabled = true
            numberPatientsPresentedTreatmentTextField7.isEnabled = true
            numberPatientsAcceptedTreatmentTextField5.isEnabled = true
            numberPatientsAcceptedTreatmentTextField6.isEnabled = true
            numberPatientsAcceptedTreatmentTextField7.isEnabled = true
            
            goalTextField1.isEnabled = true
            goalTextField2.isEnabled = true
            netProductionTextField3.isEnabled = true
            netProductionTextField4.isEnabled = true
            daysWorkedTextField1.isEnabled = true
            daysWorkedTextField2.isEnabled = true
            dollarAmountSameDayTreatmentTextField1.isEnabled = true
            dollarAmountSameDayTreatmentTextField2.isEnabled = true
            scheduledAppointmentsTextField1.isEnabled = true
            scheduledAppointmentsTextField2.isEnabled = true
            appointmentsKeptTextField1.isEnabled = true
            appointmentsKeptTextField2.isEnabled = true
            retentionRateTextField1.isEnabled = true
            retentionRateTextField2.isEnabled = true
            
            goalTextField3.isEnabled = true
            goalTextField4.isEnabled = true
            netProductionTextField5.isEnabled = true
            netProductionTextField6.isEnabled = true
            daysWorkedTextField3.isEnabled = true
            daysWorkedTextField4.isEnabled = true
            dollarAmountSameDayTreatmentTextField3.isEnabled = true
            dollarAmountSameDayTreatmentTextField4.isEnabled = true
            scheduledAppointmentsTextField3.isEnabled = true
            scheduledAppointmentsTextField4.isEnabled = true
            appointmentsKeptTextField3.isEnabled = true
            appointmentsKeptTextField4.isEnabled = true
            retentionRateTextField3.isEnabled = true
            retentionRateTextField4.isEnabled = true
            
            goalTextField5.isEnabled = true
            goalTextField6.isEnabled = true
            netProductionTextField7.isEnabled = true
            netProductionTextField8.isEnabled = true
            daysWorkedTextField5.isEnabled = true
            daysWorkedTextField6.isEnabled = true
            numberOfHoursWorkedTextField1.isEnabled = true
            numberOfHoursWorkedTextField2.isEnabled = true
            scheduledAppointmentsTextField5.isEnabled = true
            scheduledAppointmentsTextField6.isEnabled = true
            appointmentsKeptTextField5.isEnabled = true
            appointmentsKeptTextField6.isEnabled = true
            perioPercentTextField1.isEnabled = true
            perioPercentTextField2.isEnabled = true
            fluoridePresentedTextField1.isEnabled = true
            fluoridePresentedTextField2.isEnabled = true
            fluorideAcceptedTextField1.isEnabled = true
            fluorideAcceptedTextField2.isEnabled = true
            oralIDPresentedTextField1.isEnabled = true
            oralIDPresentedTextField2.isEnabled = true
            oralIDAcceptedTextField1.isEnabled = true
            oralIDAcceptedTextField2.isEnabled = true
            arestinPresentedTextField1.isEnabled = true
            arestinPresentedTextField2.isEnabled = true
            arestinAcceptedTextField1.isEnabled = true
            arestinAcceptedTextField2.isEnabled = true
            appointmentsSeenTextField1.isEnabled = true
            appointmentsSeenTextField2.isEnabled = true
            reappointmentsTextField1.isEnabled = true
            reappointmentsTextField2.isEnabled = true
            retentionRateTextField5.isEnabled = true
            retentionRateTextField6.isEnabled = true
            
            goalTextField7.isEnabled = true
            goalTextField8.isEnabled = true
            goalTextField9.isEnabled = true
            netProductionTextField9.isEnabled = true
            netProductionTextField10.isEnabled = true
            netProductionTextField11.isEnabled = true
            daysWorkedTextField7.isEnabled = true
            daysWorkedTextField8.isEnabled = true
            daysWorkedTextField9.isEnabled = true
            numberOfHoursWorkedTextField3.isEnabled = true
            numberOfHoursWorkedTextField4.isEnabled = true
            numberOfHoursWorkedTextField5.isEnabled = true
            scheduledAppointmentsTextField7.isEnabled = true
            scheduledAppointmentsTextField8.isEnabled = true
            scheduledAppointmentsTextField9.isEnabled = true
            appointmentsKeptTextField7.isEnabled = true
            appointmentsKeptTextField8.isEnabled = true
            appointmentsKeptTextField9.isEnabled = true
            perioPercentTextField3.isEnabled = true
            perioPercentTextField4.isEnabled = true
            perioPercentTextField5.isEnabled = true
            fluoridePresentedTextField3.isEnabled = true
            fluoridePresentedTextField4.isEnabled = true
            fluoridePresentedTextField5.isEnabled = true
            fluorideAcceptedTextField3.isEnabled = true
            fluorideAcceptedTextField4.isEnabled = true
            fluorideAcceptedTextField5.isEnabled = true
            oralIDPresentedTextField3.isEnabled = true
            oralIDPresentedTextField4.isEnabled = true
            oralIDPresentedTextField5.isEnabled = true
            oralIDAcceptedTextField3.isEnabled = true
            oralIDAcceptedTextField4.isEnabled = true
            oralIDAcceptedTextField5.isEnabled = true
            arestinPresentedTextField3.isEnabled = true
            arestinPresentedTextField4.isEnabled = true
            arestinPresentedTextField5.isEnabled = true
            arestinAcceptedTextField3.isEnabled = true
            arestinAcceptedTextField4.isEnabled = true
            arestinAcceptedTextField5.isEnabled = true
            appointmentsSeenTextField3.isEnabled = true
            appointmentsSeenTextField4.isEnabled = true
            appointmentsSeenTextField5.isEnabled = true
            reappointmentsTextField3.isEnabled = true
            reappointmentsTextField4.isEnabled = true
            reappointmentsTextField5.isEnabled = true
            retentionRateTextField7.isEnabled = true
            retentionRateTextField8.isEnabled = true
            retentionRateTextField9.isEnabled = true
            
        } else if currentUser == "drkvaughn1stchoice@gmail.com" {
            // Kelly
            heatherDyerAmountPresentedTextField.isEnabled = true
            heatherDyerAmountAcceptedTextField.isEnabled = true
            heatherDyerPercentOfDollarAmountScheduledTextField.isEnabled = false
            heatherDyerNumberPatientsPresentedTreatmentTextField.isEnabled = true
            heatherDyerNumberPatientsAcceptedTreatmentTextField.isEnabled = true
            heatherDyerPercentPatientsAcceptedTreatmentTextField.isEnabled = false
            
            netProductionTextField1.isEnabled = true
            netProductionTextField2.isEnabled = true
            collectionsTextField1.isEnabled = true
            collectionsTextField2.isEnabled = true
            insuranceCollectionsTextField1.isEnabled = true
            insuranceCollectionsTextField2.isEnabled = true
            otcCollectionsTextField1.isEnabled = true
            otcCollectionsTextField2.isEnabled = true
            amountRefundedToInsuranceTextField1.isEnabled = true
            amountRefundedToInsuranceTextField2.isEnabled = true
            amountRefundedToPatientsTextField1.isEnabled = true
            amountRefundedToPatientsTextField2.isEnabled = true
            
            amountPresentedTextField1.isEnabled = true
            amountPresentedTextField2.isEnabled = true
            amountAcceptedTextField1.isEnabled = true
            amountAcceptedTextField2.isEnabled = true
            numberPatientsPresentedTreatmentTextField1.isEnabled = true
            numberPatientsPresentedTreatmentTextField2.isEnabled = true
            numberPatientsAcceptedTreatmentTextField1.isEnabled = true
            numberPatientsAcceptedTreatmentTextField2.isEnabled = true
            
            amountPresentedTextField3.isEnabled = true
            amountPresentedTextField4.isEnabled = true
            amountAcceptedTextField3.isEnabled = true
            amountAcceptedTextField4.isEnabled = true
            numberPatientsPresentedTreatmentTextField3.isEnabled = true
            numberPatientsPresentedTreatmentTextField4.isEnabled = true
            numberPatientsAcceptedTreatmentTextField3.isEnabled = true
            numberPatientsAcceptedTreatmentTextField4.isEnabled = true
            
            amountPresentedTextField5.isEnabled = true
            amountPresentedTextField6.isEnabled = true
            amountPresentedTextField7.isEnabled = true
            amountAcceptedTextField5.isEnabled = true
            amountAcceptedTextField6.isEnabled = true
            amountAcceptedTextField7.isEnabled = true
            numberPatientsPresentedTreatmentTextField5.isEnabled = true
            numberPatientsPresentedTreatmentTextField6.isEnabled = true
            numberPatientsPresentedTreatmentTextField7.isEnabled = true
            numberPatientsAcceptedTreatmentTextField5.isEnabled = true
            numberPatientsAcceptedTreatmentTextField6.isEnabled = true
            numberPatientsAcceptedTreatmentTextField7.isEnabled = true
            
            goalTextField1.isEnabled = true
            goalTextField2.isEnabled = true
            netProductionTextField3.isEnabled = true
            netProductionTextField4.isEnabled = true
            daysWorkedTextField1.isEnabled = true
            daysWorkedTextField2.isEnabled = true
            dollarAmountSameDayTreatmentTextField1.isEnabled = true
            dollarAmountSameDayTreatmentTextField2.isEnabled = true
            scheduledAppointmentsTextField1.isEnabled = true
            scheduledAppointmentsTextField2.isEnabled = true
            appointmentsKeptTextField1.isEnabled = true
            appointmentsKeptTextField2.isEnabled = true
            retentionRateTextField1.isEnabled = true
            retentionRateTextField2.isEnabled = true
            
            goalTextField3.isEnabled = true
            goalTextField4.isEnabled = true
            netProductionTextField5.isEnabled = true
            netProductionTextField6.isEnabled = true
            daysWorkedTextField3.isEnabled = true
            daysWorkedTextField4.isEnabled = true
            dollarAmountSameDayTreatmentTextField3.isEnabled = true
            dollarAmountSameDayTreatmentTextField4.isEnabled = true
            scheduledAppointmentsTextField3.isEnabled = true
            scheduledAppointmentsTextField4.isEnabled = true
            appointmentsKeptTextField3.isEnabled = true
            appointmentsKeptTextField4.isEnabled = true
            retentionRateTextField3.isEnabled = true
            retentionRateTextField4.isEnabled = true
            
            goalTextField5.isEnabled = true
            goalTextField6.isEnabled = true
            netProductionTextField7.isEnabled = true
            netProductionTextField8.isEnabled = true
            daysWorkedTextField5.isEnabled = true
            daysWorkedTextField6.isEnabled = true
            numberOfHoursWorkedTextField1.isEnabled = true
            numberOfHoursWorkedTextField2.isEnabled = true
            scheduledAppointmentsTextField5.isEnabled = true
            scheduledAppointmentsTextField6.isEnabled = true
            appointmentsKeptTextField5.isEnabled = true
            appointmentsKeptTextField6.isEnabled = true
            perioPercentTextField1.isEnabled = true
            perioPercentTextField2.isEnabled = true
            fluoridePresentedTextField1.isEnabled = true
            fluoridePresentedTextField2.isEnabled = true
            fluorideAcceptedTextField1.isEnabled = true
            fluorideAcceptedTextField2.isEnabled = true
            oralIDPresentedTextField1.isEnabled = true
            oralIDPresentedTextField2.isEnabled = true
            oralIDAcceptedTextField1.isEnabled = true
            oralIDAcceptedTextField2.isEnabled = true
            arestinPresentedTextField1.isEnabled = true
            arestinPresentedTextField2.isEnabled = true
            arestinAcceptedTextField1.isEnabled = true
            arestinAcceptedTextField2.isEnabled = true
            appointmentsSeenTextField1.isEnabled = true
            appointmentsSeenTextField2.isEnabled = true
            reappointmentsTextField1.isEnabled = true
            reappointmentsTextField2.isEnabled = true
            retentionRateTextField5.isEnabled = true
            retentionRateTextField6.isEnabled = true
            
            goalTextField7.isEnabled = true
            goalTextField8.isEnabled = true
            goalTextField9.isEnabled = true
            netProductionTextField9.isEnabled = true
            netProductionTextField10.isEnabled = true
            netProductionTextField11.isEnabled = true
            daysWorkedTextField7.isEnabled = true
            daysWorkedTextField8.isEnabled = true
            daysWorkedTextField9.isEnabled = true
            numberOfHoursWorkedTextField3.isEnabled = true
            numberOfHoursWorkedTextField4.isEnabled = true
            numberOfHoursWorkedTextField5.isEnabled = true
            scheduledAppointmentsTextField7.isEnabled = true
            scheduledAppointmentsTextField8.isEnabled = true
            scheduledAppointmentsTextField9.isEnabled = true
            appointmentsKeptTextField7.isEnabled = true
            appointmentsKeptTextField8.isEnabled = true
            appointmentsKeptTextField9.isEnabled = true
            perioPercentTextField3.isEnabled = true
            perioPercentTextField4.isEnabled = true
            perioPercentTextField5.isEnabled = true
            fluoridePresentedTextField3.isEnabled = true
            fluoridePresentedTextField4.isEnabled = true
            fluoridePresentedTextField5.isEnabled = true
            fluorideAcceptedTextField3.isEnabled = true
            fluorideAcceptedTextField4.isEnabled = true
            fluorideAcceptedTextField5.isEnabled = true
            oralIDPresentedTextField3.isEnabled = true
            oralIDPresentedTextField4.isEnabled = true
            oralIDPresentedTextField5.isEnabled = true
            oralIDAcceptedTextField3.isEnabled = true
            oralIDAcceptedTextField4.isEnabled = true
            oralIDAcceptedTextField5.isEnabled = true
            arestinPresentedTextField3.isEnabled = true
            arestinPresentedTextField4.isEnabled = true
            arestinPresentedTextField5.isEnabled = true
            arestinAcceptedTextField3.isEnabled = true
            arestinAcceptedTextField4.isEnabled = true
            arestinAcceptedTextField5.isEnabled = true
            appointmentsSeenTextField3.isEnabled = true
            appointmentsSeenTextField4.isEnabled = true
            appointmentsSeenTextField5.isEnabled = true
            reappointmentsTextField3.isEnabled = true
            reappointmentsTextField4.isEnabled = true
            reappointmentsTextField5.isEnabled = true
            retentionRateTextField7.isEnabled = true
            retentionRateTextField8.isEnabled = true
            retentionRateTextField9.isEnabled = true
            
        } else if currentUser == "dmhunsinger@gmail.com" {
            // Dawn
            goalTextField7.isEnabled = true
            netProductionTextField9.isEnabled = true
            daysWorkedTextField7.isEnabled = true
            numberOfHoursWorkedTextField3.isEnabled = true
            scheduledAppointmentsTextField7.isEnabled = true
            appointmentsKeptTextField7.isEnabled = true
            perioPercentTextField3.isEnabled = true
            fluoridePresentedTextField3.isEnabled = true
            fluorideAcceptedTextField3.isEnabled = true
            oralIDPresentedTextField3.isEnabled = true
            oralIDAcceptedTextField3.isEnabled = true
            arestinPresentedTextField3.isEnabled = true
            arestinAcceptedTextField3.isEnabled = true
            appointmentsSeenTextField3.isEnabled = true
            reappointmentsTextField3.isEnabled = true
            retentionRateTextField7.isEnabled = true
            
        } else if currentUser == "debbie1stchoice@gmail.com" {
            // Debbie D.
            amountPresentedTextField5.isEnabled = true
            amountAcceptedTextField5.isEnabled = true
            numberPatientsPresentedTreatmentTextField5.isEnabled = true
            numberPatientsAcceptedTreatmentTextField5.isEnabled = true
            
        } else if currentUser == "holly1stchoice@gmail.com" {
            // Holly
            amountPresentedTextField1.isEnabled = true
            amountAcceptedTextField1.isEnabled = true
            numberPatientsPresentedTreatmentTextField1.isEnabled = true
            numberPatientsAcceptedTreatmentTextField1.isEnabled = true
            
            
        } else if currentUser == "jessica.gail.stephens@gmail.com" {
            // Jessica
            amountPresentedTextField7.isEnabled = true
            amountAcceptedTextField7.isEnabled = true
            numberPatientsPresentedTreatmentTextField7.isEnabled = true
            numberPatientsAcceptedTreatmentTextField7.isEnabled = true
            
        } else if currentUser == "s_dye@bellsouth.net" {
            // Sheila
            goalTextField8.isEnabled = true
            netProductionTextField10.isEnabled = true
            daysWorkedTextField8.isEnabled = true
            numberOfHoursWorkedTextField4.isEnabled = true
            scheduledAppointmentsTextField8.isEnabled = true
            appointmentsKeptTextField8.isEnabled = true
            perioPercentTextField4.isEnabled = true
            fluoridePresentedTextField4.isEnabled = true
            fluorideAcceptedTextField4.isEnabled = true
            oralIDPresentedTextField4.isEnabled = true
            oralIDAcceptedTextField4.isEnabled = true
            arestinPresentedTextField4.isEnabled = true
            arestinAcceptedTextField4.isEnabled = true
            appointmentsSeenTextField4.isEnabled = true
            reappointmentsTextField4.isEnabled = true
            retentionRateTextField8.isEnabled = true
            
        } else if currentUser == "sydneym1stchoice@gmail.com" {
            // Sydney
            amountPresentedTextField2.isEnabled = true
            amountAcceptedTextField2.isEnabled = true
            numberPatientsPresentedTreatmentTextField2.isEnabled = true
            numberPatientsAcceptedTreatmentTextField2.isEnabled = true
            
        } else if currentUser == "honeycombs03@hotmail.com" {
            // Aubrey
            goalTextField6.isEnabled = true
            netProductionTextField8.isEnabled = true
            daysWorkedTextField6.isEnabled = true
            numberOfHoursWorkedTextField2.isEnabled = true
            scheduledAppointmentsTextField6.isEnabled = true
            appointmentsKeptTextField6.isEnabled = true
            perioPercentTextField2.isEnabled = true
            fluoridePresentedTextField2.isEnabled = true
            fluorideAcceptedTextField2.isEnabled = true
            oralIDPresentedTextField2.isEnabled = true
            oralIDAcceptedTextField2.isEnabled = true
            arestinPresentedTextField2.isEnabled = true
            arestinAcceptedTextField2.isEnabled = true
            appointmentsSeenTextField2.isEnabled = true
            reappointmentsTextField2.isEnabled = true
            retentionRateTextField6.isEnabled = true
            
        } else if currentUser == "ashleyg1stchoice@gmail.com" {
            // Ashley G
            amountPresentedTextField4.isEnabled = true
            amountAcceptedTextField4.isEnabled = true
            numberPatientsPresentedTreatmentTextField4.isEnabled = true
            numberPatientsAcceptedTreatmentTextField4.isEnabled = true
            
        } else if currentUser == "ltinker21@yahoo.com" {
            // Ashley T
            goalTextField9.isEnabled = true
            netProductionTextField11.isEnabled = true
            daysWorkedTextField9.isEnabled = true
            numberOfHoursWorkedTextField5.isEnabled = true
            scheduledAppointmentsTextField9.isEnabled = true
            appointmentsKeptTextField9.isEnabled = true
            perioPercentTextField5.isEnabled = true
            fluoridePresentedTextField5.isEnabled = true
            fluorideAcceptedTextField5.isEnabled = true
            oralIDPresentedTextField5.isEnabled = true
            oralIDAcceptedTextField5.isEnabled = true
            arestinPresentedTextField5.isEnabled = true
            arestinAcceptedTextField5.isEnabled = true
            appointmentsSeenTextField5.isEnabled = true
            reappointmentsTextField5.isEnabled = true
            retentionRateTextField9.isEnabled = true
            
        } else if currentUser == "annacav18@gmail.com" {
            // Anna C.
            amountPresentedTextField6.isEnabled = true
            amountAcceptedTextField6.isEnabled = true
            numberPatientsPresentedTreatmentTextField6.isEnabled = true
            numberPatientsAcceptedTreatmentTextField6.isEnabled = true
            
        } else if currentUser == "amychanthaboury@aol.com" {
            // Amy
            goalTextField5.isEnabled = true
            netProductionTextField7.isEnabled = true
            daysWorkedTextField5.isEnabled = true
            numberOfHoursWorkedTextField1.isEnabled = true
            scheduledAppointmentsTextField5.isEnabled = true
            appointmentsKeptTextField5.isEnabled = true
            perioPercentTextField1.isEnabled = true
            fluoridePresentedTextField1.isEnabled = true
            fluorideAcceptedTextField1.isEnabled = true
            oralIDPresentedTextField1.isEnabled = true
            oralIDAcceptedTextField1.isEnabled = true
            arestinPresentedTextField1.isEnabled = true
            arestinAcceptedTextField1.isEnabled = true
            appointmentsSeenTextField1.isEnabled = true
            reappointmentsTextField1.isEnabled = true
            retentionRateTextField5.isEnabled = true
            
        } else if currentUser == "amanda.vickers83@gmail.com" {
            // Amanda
            amountPresentedTextField3.isEnabled = true
            amountAcceptedTextField3.isEnabled = true
            numberPatientsPresentedTreatmentTextField3.isEnabled = true
            numberPatientsAcceptedTreatmentTextField3.isEnabled = true
            
        } else if currentUser == "kvargas0225@gmail.com" || currentUser == "dusti1stchoice@gmail.com" {
            // Dr. V.
            
            goalTextField1.isEnabled = true
            netProductionTextField3.isEnabled = true
            daysWorkedTextField1.isEnabled = true
            dollarAmountSameDayTreatmentTextField1.isEnabled = true
            scheduledAppointmentsTextField1.isEnabled = true
            appointmentsKeptTextField1.isEnabled = true
            retentionRateTextField1.isEnabled = true
        } else if currentUser == "kvargas0225@gmail.com" || currentUser == "dusti1stchoice@gmail.com" {
            // Dr. Mcree
            
            goalTextField2.isEnabled = true
            netProductionTextField4.isEnabled = true
            daysWorkedTextField2.isEnabled = true
            dollarAmountSameDayTreatmentTextField2.isEnabled = true
            scheduledAppointmentsTextField2.isEnabled = true
            appointmentsKeptTextField2.isEnabled = true
            retentionRateTextField2.isEnabled = true
        } else if currentUser == "heatherlyn01@gmail.com" {
            // Dr. Orza
            
            goalTextField3.isEnabled = true
            netProductionTextField5.isEnabled = true
            daysWorkedTextField3.isEnabled = true
            dollarAmountSameDayTreatmentTextField3.isEnabled = true
            scheduledAppointmentsTextField3.isEnabled = true
            appointmentsKeptTextField3.isEnabled = true
            retentionRateTextField3.isEnabled = true
        } else if currentUser == "kincaid-skk.090@gmail.com" {
            // Dr. Fran
            
            goalTextField4.isEnabled = true
            netProductionTextField6.isEnabled = true
            daysWorkedTextField4.isEnabled = true
            dollarAmountSameDayTreatmentTextField4.isEnabled = true
            scheduledAppointmentsTextField4.isEnabled = true
            appointmentsKeptTextField4.isEnabled = true
            retentionRateTextField4.isEnabled = true
        } else if currentUser == "heatherD1stChoice@gmail.com" {
            
            heatherDyerAmountPresentedTextField.isEnabled = true
            heatherDyerAmountAcceptedTextField.isEnabled = true
            heatherDyerPercentOfDollarAmountScheduledTextField.isEnabled = false
            heatherDyerNumberPatientsPresentedTreatmentTextField.isEnabled = true
            heatherDyerNumberPatientsAcceptedTreatmentTextField.isEnabled = true
            heatherDyerPercentPatientsAcceptedTreatmentTextField.isEnabled = false
            
        } else if currentUser == "heatherR1stChoice@gmail.com" {
            heatherDyerAmountPresentedTextField.isEnabled = true
            heatherDyerAmountAcceptedTextField.isEnabled = true
            heatherDyerPercentOfDollarAmountScheduledTextField.isEnabled = false
            heatherDyerNumberPatientsPresentedTreatmentTextField.isEnabled = true
            heatherDyerNumberPatientsAcceptedTreatmentTextField.isEnabled = true
            heatherDyerPercentPatientsAcceptedTreatmentTextField.isEnabled = false
            
            netProductionTextField1.isEnabled = true
            netProductionTextField2.isEnabled = true
            collectionsTextField1.isEnabled = true
            collectionsTextField2.isEnabled = true
            insuranceCollectionsTextField1.isEnabled = true
            insuranceCollectionsTextField2.isEnabled = true
            otcCollectionsTextField1.isEnabled = true
            otcCollectionsTextField2.isEnabled = true
            amountRefundedToInsuranceTextField1.isEnabled = true
            amountRefundedToInsuranceTextField2.isEnabled = true
            amountRefundedToPatientsTextField1.isEnabled = true
            amountRefundedToPatientsTextField2.isEnabled = true
            
            amountPresentedTextField1.isEnabled = true
            amountPresentedTextField2.isEnabled = true
            amountAcceptedTextField1.isEnabled = true
            amountAcceptedTextField2.isEnabled = true
            numberPatientsPresentedTreatmentTextField1.isEnabled = true
            numberPatientsPresentedTreatmentTextField2.isEnabled = true
            numberPatientsAcceptedTreatmentTextField1.isEnabled = true
            numberPatientsAcceptedTreatmentTextField2.isEnabled = true
            
            amountPresentedTextField3.isEnabled = true
            amountPresentedTextField4.isEnabled = true
            amountAcceptedTextField3.isEnabled = true
            amountAcceptedTextField4.isEnabled = true
            numberPatientsPresentedTreatmentTextField3.isEnabled = true
            numberPatientsPresentedTreatmentTextField4.isEnabled = true
            numberPatientsAcceptedTreatmentTextField3.isEnabled = true
            numberPatientsAcceptedTreatmentTextField4.isEnabled = true
            
            amountPresentedTextField5.isEnabled = true
            amountPresentedTextField6.isEnabled = true
            amountPresentedTextField7.isEnabled = true
            amountAcceptedTextField5.isEnabled = true
            amountAcceptedTextField6.isEnabled = true
            amountAcceptedTextField7.isEnabled = true
            numberPatientsPresentedTreatmentTextField5.isEnabled = true
            numberPatientsPresentedTreatmentTextField6.isEnabled = true
            numberPatientsPresentedTreatmentTextField7.isEnabled = true
            numberPatientsAcceptedTreatmentTextField5.isEnabled = true
            numberPatientsAcceptedTreatmentTextField6.isEnabled = true
            numberPatientsAcceptedTreatmentTextField7.isEnabled = true
            
            goalTextField1.isEnabled = true
            goalTextField2.isEnabled = true
            netProductionTextField3.isEnabled = true
            netProductionTextField4.isEnabled = true
            daysWorkedTextField1.isEnabled = true
            daysWorkedTextField2.isEnabled = true
            dollarAmountSameDayTreatmentTextField1.isEnabled = true
            dollarAmountSameDayTreatmentTextField2.isEnabled = true
            scheduledAppointmentsTextField1.isEnabled = true
            scheduledAppointmentsTextField2.isEnabled = true
            appointmentsKeptTextField1.isEnabled = true
            appointmentsKeptTextField2.isEnabled = true
            retentionRateTextField1.isEnabled = true
            retentionRateTextField2.isEnabled = true
            
            goalTextField3.isEnabled = true
            goalTextField4.isEnabled = true
            netProductionTextField5.isEnabled = true
            netProductionTextField6.isEnabled = true
            daysWorkedTextField3.isEnabled = true
            daysWorkedTextField4.isEnabled = true
            dollarAmountSameDayTreatmentTextField3.isEnabled = true
            dollarAmountSameDayTreatmentTextField4.isEnabled = true
            scheduledAppointmentsTextField3.isEnabled = true
            scheduledAppointmentsTextField4.isEnabled = true
            appointmentsKeptTextField3.isEnabled = true
            appointmentsKeptTextField4.isEnabled = true
            retentionRateTextField3.isEnabled = true
            retentionRateTextField4.isEnabled = true
            
            goalTextField5.isEnabled = true
            goalTextField6.isEnabled = true
            netProductionTextField7.isEnabled = true
            netProductionTextField8.isEnabled = true
            daysWorkedTextField5.isEnabled = true
            daysWorkedTextField6.isEnabled = true
            numberOfHoursWorkedTextField1.isEnabled = true
            numberOfHoursWorkedTextField2.isEnabled = true
            scheduledAppointmentsTextField5.isEnabled = true
            scheduledAppointmentsTextField6.isEnabled = true
            appointmentsKeptTextField5.isEnabled = true
            appointmentsKeptTextField6.isEnabled = true
            perioPercentTextField1.isEnabled = true
            perioPercentTextField2.isEnabled = true
            fluoridePresentedTextField1.isEnabled = true
            fluoridePresentedTextField2.isEnabled = true
            fluorideAcceptedTextField1.isEnabled = true
            fluorideAcceptedTextField2.isEnabled = true
            oralIDPresentedTextField1.isEnabled = true
            oralIDPresentedTextField2.isEnabled = true
            oralIDAcceptedTextField1.isEnabled = true
            oralIDAcceptedTextField2.isEnabled = true
            arestinPresentedTextField1.isEnabled = true
            arestinPresentedTextField2.isEnabled = true
            arestinAcceptedTextField1.isEnabled = true
            arestinAcceptedTextField2.isEnabled = true
            appointmentsSeenTextField1.isEnabled = true
            appointmentsSeenTextField2.isEnabled = true
            reappointmentsTextField1.isEnabled = true
            reappointmentsTextField2.isEnabled = true
            retentionRateTextField5.isEnabled = true
            retentionRateTextField6.isEnabled = true
            
            goalTextField7.isEnabled = true
            goalTextField8.isEnabled = true
            goalTextField9.isEnabled = true
            netProductionTextField9.isEnabled = true
            netProductionTextField10.isEnabled = true
            netProductionTextField11.isEnabled = true
            daysWorkedTextField7.isEnabled = true
            daysWorkedTextField8.isEnabled = true
            daysWorkedTextField9.isEnabled = true
            numberOfHoursWorkedTextField3.isEnabled = true
            numberOfHoursWorkedTextField4.isEnabled = true
            numberOfHoursWorkedTextField5.isEnabled = true
            scheduledAppointmentsTextField7.isEnabled = true
            scheduledAppointmentsTextField8.isEnabled = true
            scheduledAppointmentsTextField9.isEnabled = true
            appointmentsKeptTextField7.isEnabled = true
            appointmentsKeptTextField8.isEnabled = true
            appointmentsKeptTextField9.isEnabled = true
            perioPercentTextField3.isEnabled = true
            perioPercentTextField4.isEnabled = true
            perioPercentTextField5.isEnabled = true
            fluoridePresentedTextField3.isEnabled = true
            fluoridePresentedTextField4.isEnabled = true
            fluoridePresentedTextField5.isEnabled = true
            fluorideAcceptedTextField3.isEnabled = true
            fluorideAcceptedTextField4.isEnabled = true
            fluorideAcceptedTextField5.isEnabled = true
            oralIDPresentedTextField3.isEnabled = true
            oralIDPresentedTextField4.isEnabled = true
            oralIDPresentedTextField5.isEnabled = true
            oralIDAcceptedTextField3.isEnabled = true
            oralIDAcceptedTextField4.isEnabled = true
            oralIDAcceptedTextField5.isEnabled = true
            arestinPresentedTextField3.isEnabled = true
            arestinPresentedTextField4.isEnabled = true
            arestinPresentedTextField5.isEnabled = true
            arestinAcceptedTextField3.isEnabled = true
            arestinAcceptedTextField4.isEnabled = true
            arestinAcceptedTextField5.isEnabled = true
            appointmentsSeenTextField3.isEnabled = true
            appointmentsSeenTextField4.isEnabled = true
            appointmentsSeenTextField5.isEnabled = true
            reappointmentsTextField3.isEnabled = true
            reappointmentsTextField4.isEnabled = true
            reappointmentsTextField5.isEnabled = true
            retentionRateTextField7.isEnabled = true
            retentionRateTextField8.isEnabled = true
            retentionRateTextField9.isEnabled = true
            
        } else if currentUser == "heatherd1stchoice@gmail.com" {
        
            heatherDyerAmountPresentedTextField.isEnabled = true
            heatherDyerAmountAcceptedTextField.isEnabled = true
            heatherDyerPercentOfDollarAmountScheduledTextField.isEnabled = false
            heatherDyerNumberPatientsPresentedTreatmentTextField.isEnabled = true
            heatherDyerNumberPatientsAcceptedTreatmentTextField.isEnabled = true
            heatherDyerPercentPatientsAcceptedTreatmentTextField.isEnabled = false
            
        }
    
        // how to run a timer now
        //percentTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.handlePercents), userInfo: nil, repeats: true)
        //percentTimer.fire()
        
        if view?.frame.width == 320 && view?.frame.height == 568 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 3380)
            //5
        } else if view?.frame.width == 375 && view?.frame.height == 667 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 3930)
            //normal 6,7,8
        } else if view?.frame.width == 414 && view?.frame.height ==  736 {
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 4305)
            //plus 6,7,8
        } else if view?.frame.width == 375 && view?.frame.height == 812 {
           scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 4715)
            //X and XS
        } else if view?.frame.width == 414 && view?.frame.height == 896 {
            // XR / XS Max
            scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 5180)
        }
        
        print("Width: \(view?.frame.width)")
        print("Height: \(view?.frame.height)")
        
        self.view.addSubview(titleUnderline)
        self.view.addSubview(titleLbl)
        self.view.addSubview(logo)
        self.view.addSubview(submitButton)
        self.view.addSubview(logOutButton)
        self.view.addSubview(scrollViewBorderView)
        self.scrollViewBorderView.addSubview(scrollView)
        
        validateUser()
        setupScrollView()
        setupView()
    }
    
    func setupView() {
        
        
        scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: titleUnderline.bottomAnchor, constant: 10).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95).isActive = true
        scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.68).isActive = true
        
        scrollViewBorderView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        scrollViewBorderView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
        scrollViewBorderView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1, constant: 2).isActive = true
        scrollViewBorderView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 1, constant: 10).isActive = true
        
        titleUnderline.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        titleUnderline.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 10).isActive = true
        titleUnderline.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95).isActive = true
        titleUnderline.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.005).isActive = true
        
        titleLbl.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        titleLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        titleLbl.font = UIFont(name: "AmericanTypewriter-Light", size: self.view.frame.width / 18)
        
        logo.rightAnchor.constraint(equalTo: titleUnderline.rightAnchor, constant: -35).isActive = true
        logo.centerYAnchor.constraint(equalTo: titleLbl.centerYAnchor).isActive = true
        logo.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.22).isActive = true
        logo.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.08).isActive = true
        
        submitButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        submitButton.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 15).isActive = true
        submitButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95).isActive = true
        submitButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true
        
        logOutButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        logOutButton.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 15).isActive = true
        logOutButton.widthAnchor.constraint(equalTo: submitButton.widthAnchor).isActive = true
        logOutButton.heightAnchor.constraint(equalTo: submitButton.heightAnchor).isActive = true
    }
    
    func setupScrollView() {
        
        scrollView.addSubview(heatherDyerLbl)
        scrollView.addSubview(heatherDyerAmountPresentedTextField)
        scrollView.addSubview(heatherDyerAmountAcceptedTextField)
        scrollView.addSubview(heatherDyerPercentOfDollarAmountScheduledTextField)
        scrollView.addSubview(heatherDyerNumberPatientsPresentedTreatmentTextField)
        scrollView.addSubview(heatherDyerNumberPatientsAcceptedTreatmentTextField)
        scrollView.addSubview(heatherDyerPercentPatientsAcceptedTreatmentTextField)
        
        scrollView.addSubview(categoryHighlight1)
        scrollView.addSubview(categoryDivider1)
        scrollView.addSubview(adminAndInsuranceLbl)
        scrollView.addSubview(categoryDivider2)
        scrollView.addSubview(woodstockLbl)
        scrollView.addSubview(kennesawLbl)
        scrollView.addSubview(netProdutionLbl)
        scrollView.addSubview(netProductionTextField1)
        scrollView.addSubview(netProductionTextField2)
        scrollView.addSubview(horizontalDivider1)
        scrollView.addSubview(collectionsLbl)
        scrollView.addSubview(collectionsTextField1)
        scrollView.addSubview(collectionsTextField2)
        scrollView.addSubview(horizontalDivider2)
        scrollView.addSubview(insuranceCollectionsLbl)
        scrollView.addSubview(insuranceCollectionsTextField1)
        scrollView.addSubview(insuranceCollectionsTextField2)
        scrollView.addSubview(horizontalDivider3)
        scrollView.addSubview(otcCollectionsLbl)
        scrollView.addSubview(otcCollectionsTextField1)
        scrollView.addSubview(otcCollectionsTextField2)
        scrollView.addSubview(amountRefundedToInsuranceLbl)
        scrollView.addSubview(amountRefundedToInsuranceTextField1)
        scrollView.addSubview(amountRefundedToInsuranceTextField2)
        scrollView.addSubview(amountRefundedToPatientsLbl)
        scrollView.addSubview(amountRefundedToPatientsTextField1)
        scrollView.addSubview(amountRefundedToPatientsTextField2)
        scrollView.addSubview(percentOTCToTotalCollectionsLbl)
        scrollView.addSubview(percentOTCToTotalCollectionsTextField1)
        scrollView.addSubview(percentOTCToTotalCollectionsTextField2)
        scrollView.addSubview(percentInsuranceToTotalCollectionsLbl)
        scrollView.addSubview(percentInsuranceToTotalCollectionsTextField1)
        scrollView.addSubview(percentInsuranceToTotalCollectionsTextField2)
        scrollView.addSubview(percentCollectionsToNetProducionLbl)
        scrollView.addSubview(percentCollectionsToNetProducionTextField1)
        scrollView.addSubview(percentCollectionsToNetProducionTextField2)
        scrollView.addSubview(productionPerActiveChairLbl)
        scrollView.addSubview(productionPerActiveChairTextField1)
        scrollView.addSubview(productionPerActiveChairTextField2)
        
        scrollView.addSubview(caseAcceptanceLbl)
        scrollView.addSubview(categoryHighlight2)
        scrollView.addSubview(categoryDivider3)
        scrollView.addSubview(treatmentCoordinatorsLbl)
        scrollView.addSubview(categoryDivider4)
        scrollView.addSubview(HollyLbl)
        scrollView.addSubview(amountPresentedLbl)
        scrollView.addSubview(amountPresentedTextField1)
        scrollView.addSubview(amountPresentedTextField2)
        scrollView.addSubview(sydneyLbl)
        scrollView.addSubview(amountAcceptedLbl)
        scrollView.addSubview(amountAcceptedTextField1)
        scrollView.addSubview(amountAcceptedTextField2)
        scrollView.addSubview(percentOfDollarAmountScheduledLbl)
        scrollView.addSubview(percentOfDollarAmountScheduledTextField1)
        scrollView.addSubview(percentOfDollarAmountScheduledTextField2)
        scrollView.addSubview(numberPatientsPresentedTreatmentLbl)
        scrollView.addSubview(numberPatientsPresentedTreatmentTextField1)
        scrollView.addSubview(numberPatientsPresentedTreatmentTextField2)
        scrollView.addSubview(numberPatientsAccpetedTreatmentLbl)
        scrollView.addSubview(numberPatientsAcceptedTreatmentTextField1)
        scrollView.addSubview(numberPatientsAcceptedTreatmentTextField2)
        scrollView.addSubview(percentPatientsAcceptedTreatmentLbl)
        scrollView.addSubview(percentPatientsAcceptedTreatmentTextField1)
        scrollView.addSubview(percentPatientsAcceptedTreatmentTextField2)
        
        scrollView.addSubview(categoryHighlight3)
        scrollView.addSubview(categoryDivider5)
        scrollView.addSubview(treatmentCoordinatorsLbl2)
        scrollView.addSubview(categoryDivider6)
        scrollView.addSubview(amandaLbl)
        scrollView.addSubview(amountPresentedLbl2)
        scrollView.addSubview(amountPresentedTextField3)
        scrollView.addSubview(amountPresentedTextField4)
        scrollView.addSubview(AshleyGLbl)
        scrollView.addSubview(amountAcceptedLbl2)
        scrollView.addSubview(amountAcceptedTextField3)
        scrollView.addSubview(amountAcceptedTextField4)
        scrollView.addSubview(percentOfDollarAmountScheduledLbl2)
        scrollView.addSubview(percentOfDollarAmountScheduledTextField3)
        scrollView.addSubview(percentOfDollarAmountScheduledTextField4)
        scrollView.addSubview(numberPatientsPresentedTreatmentLbl2)
        scrollView.addSubview(numberPatientsPresentedTreatmentTextField3)
        scrollView.addSubview(numberPatientsPresentedTreatmentTextField4)
        scrollView.addSubview(numberPatientsAccpetedTreatmentLbl2)
        scrollView.addSubview(numberPatientsAcceptedTreatmentTextField3)
        scrollView.addSubview(numberPatientsAcceptedTreatmentTextField4)
        scrollView.addSubview(percentPatientsAcceptedTreatmentLbl2)
        scrollView.addSubview(percentPatientsAcceptedTreatmentTextField3)
        scrollView.addSubview(percentPatientsAcceptedTreatmentTextField4)
        
        scrollView.addSubview(categoryHighlight4)
        scrollView.addSubview(categoryDivider7)
        scrollView.addSubview(treatmentCoordinatorsLbl3)
        scrollView.addSubview(categoryDivider8)
        scrollView.addSubview(debbieDLbl)
        scrollView.addSubview(amountPresentedLbl3)
        scrollView.addSubview(amountPresentedTextField5)
        scrollView.addSubview(amountPresentedTextField6)
        scrollView.addSubview(annaCLbl)
        scrollView.addSubview(amountAcceptedLbl3)
        scrollView.addSubview(amountAcceptedTextField5)
        scrollView.addSubview(amountAcceptedTextField6)
        scrollView.addSubview(percentOfDollarAmountScheduledLbl3)
        scrollView.addSubview(percentOfDollarAmountScheduledTextField5)
        scrollView.addSubview(percentOfDollarAmountScheduledTextField6)
        scrollView.addSubview(numberPatientsPresentedTreatmentLbl3)
        scrollView.addSubview(numberPatientsPresentedTreatmentTextField5)
        scrollView.addSubview(numberPatientsPresentedTreatmentTextField6)
        scrollView.addSubview(numberPatientsAccpetedTreatmentLbl3)
        scrollView.addSubview(numberPatientsAcceptedTreatmentTextField5)
        scrollView.addSubview(numberPatientsAcceptedTreatmentTextField6)
        scrollView.addSubview(percentPatientsAcceptedTreatmentLbl3)
        scrollView.addSubview(percentPatientsAcceptedTreatmentTextField5)
        scrollView.addSubview(percentPatientsAcceptedTreatmentTextField6)
        
        scrollView.addSubview(providersLbl)
        scrollView.addSubview(categoryHighlight5)
        scrollView.addSubview(categoryDivider9)
        scrollView.addSubview(doctorsLbl)
        scrollView.addSubview(categoryDivider10)
        scrollView.addSubview(drVLbl)
        scrollView.addSubview(goalLbl)
        scrollView.addSubview(goalTextField1)
        scrollView.addSubview(goalTextField2)
        scrollView.addSubview(drMcreeLbl)
        scrollView.addSubview(netProductionLbl)
        scrollView.addSubview(netProductionTextField3)
        scrollView.addSubview(netProductionTextField4)
        scrollView.addSubview(daysWorkedLbl)
        scrollView.addSubview(daysWorkedTextField1)
        scrollView.addSubview(daysWorkedTextField2)
        scrollView.addSubview(productionPerDayLbl)
        scrollView.addSubview(productionPerDayTextField1)
        scrollView.addSubview(productionPerDayTextField2)
        scrollView.addSubview(productionPerHourLbl)
        scrollView.addSubview(productionPerHourTextField1)
        scrollView.addSubview(productionPerHourTextField2)
        scrollView.addSubview(dollarAmountSameDayTreatmentLbl)
        scrollView.addSubview(dollarAmountSameDayTreatmentTextField1)
        scrollView.addSubview(dollarAmountSameDayTreatmentTextField2)
        scrollView.addSubview(percentAppointmentsKeptLbl)
        scrollView.addSubview(percentAppointmentsKeptTextField1)
        scrollView.addSubview(percentAppointmentsKeptTextField2)
        scrollView.addSubview(retentionRateLbl)
        scrollView.addSubview(retentionRateTextField1)
        scrollView.addSubview(retentionRateTextField2)
        
        scrollView.addSubview(categoryHighlight6)
        scrollView.addSubview(categoryDivider11)
        scrollView.addSubview(doctorsLbl2)
        scrollView.addSubview(categoryDivider12)
        scrollView.addSubview(drOrzaLbl)
        scrollView.addSubview(goalLbl2)
        scrollView.addSubview(goalTextField3)
        scrollView.addSubview(goalTextField4)
        scrollView.addSubview(drFranLbl)
        scrollView.addSubview(netProductionLbl2)
        scrollView.addSubview(netProductionTextField5)
        scrollView.addSubview(netProductionTextField6)
        scrollView.addSubview(daysWorkedLbl2)
        scrollView.addSubview(daysWorkedTextField3)
        scrollView.addSubview(daysWorkedTextField4)
        scrollView.addSubview(productionPerDayLbl2)
        scrollView.addSubview(productionPerDayTextField3)
        scrollView.addSubview(productionPerDayTextField4)
        scrollView.addSubview(productionPerHourLbl2)
        scrollView.addSubview(productionPerHourTextField3)
        scrollView.addSubview(productionPerHourTextField4)
        scrollView.addSubview(dollarAmountSameDayTreatmentLbl2)
        scrollView.addSubview(dollarAmountSameDayTreatmentTextField3)
        scrollView.addSubview(dollarAmountSameDayTreatmentTextField4)
        scrollView.addSubview(percentAppointmentsKeptLbl2)
        scrollView.addSubview(percentAppointmentsKeptTextField3)
        scrollView.addSubview(percentAppointmentsKeptTextField4)
        scrollView.addSubview(retentionRateLbl2)
        scrollView.addSubview(retentionRateTextField3)
        scrollView.addSubview(retentionRateTextField4)
        
        scrollView.addSubview(categoryHighlight7)
        scrollView.addSubview(categoryDivider13)
        scrollView.addSubview(hygieneLbl)
        scrollView.addSubview(categoryDivider14)
        scrollView.addSubview(amyLbl)
        scrollView.addSubview(goalLbl3)
        scrollView.addSubview(goalTextField5)
        scrollView.addSubview(goalTextField6)
        scrollView.addSubview(aubreyLbl)
        scrollView.addSubview(netProductionLbl3)
        scrollView.addSubview(netProductionTextField7)
        scrollView.addSubview(netProductionTextField8)
        scrollView.addSubview(daysWorkedLbl3)
        scrollView.addSubview(daysWorkedTextField5)
        scrollView.addSubview(daysWorkedTextField6)
        scrollView.addSubview(productionPerDayLbl3)
        scrollView.addSubview(productionPerDayTextField5)
        scrollView.addSubview(productionPerDayTextField6)
        scrollView.addSubview(numberOfHoursWorkedLbl)
        scrollView.addSubview(numberOfHoursWorkedTextField1)
        scrollView.addSubview(numberOfHoursWorkedTextField2)
        scrollView.addSubview(productionPerHourLbl3)
        scrollView.addSubview(productionPerHourTextField5)
        scrollView.addSubview(productionPerHourTextField6)
        scrollView.addSubview(percentAppointmentsKeptLbl3)
        scrollView.addSubview(percentAppointmentsKeptTextField5)
        scrollView.addSubview(percentAppointmentsKeptTextField6)
        scrollView.addSubview(perioPercentLbl)
        scrollView.addSubview(perioPercentTextField1)
        scrollView.addSubview(perioPercentTextField2)
        scrollView.addSubview(fluoridePercentLbl)
        scrollView.addSubview(fluoridePercentTextField1)
        scrollView.addSubview(fluoridePercentTextField2)
        scrollView.addSubview(oralIdPercentLbl)
        scrollView.addSubview(oralIdPercentTextField1)
        scrollView.addSubview(oralIdPercentTextField2)
        scrollView.addSubview(arestinPercentLbl)
        scrollView.addSubview(arestinPercentTextField1)
        scrollView.addSubview(arestinPercentTextField2)
        scrollView.addSubview(reappointmentRateLbl)
        scrollView.addSubview(reappointmentRateTextField1)
        scrollView.addSubview(reappointmentRateTextField2)
        scrollView.addSubview(retentionRateLbl3)
        scrollView.addSubview(retentionRateTextField5)
        scrollView.addSubview(retentionRateTextField6)
        
        scrollView.addSubview(categoryHighlight8)
        scrollView.addSubview(categoryDivider15)
        scrollView.addSubview(hygieneLbl2)
        scrollView.addSubview(categoryDivider16)
        scrollView.addSubview(dawnLbl)
        scrollView.addSubview(goalLbl4)
        scrollView.addSubview(goalTextField7)
        scrollView.addSubview(goalTextField8)
        scrollView.addSubview(sheilaLbl)
        scrollView.addSubview(netProductionLbl4)
        scrollView.addSubview(netProductionTextField9)
        scrollView.addSubview(netProductionTextField10)
        scrollView.addSubview(daysWorkedLbl4)
        scrollView.addSubview(daysWorkedTextField7)
        scrollView.addSubview(daysWorkedTextField8)
        scrollView.addSubview(productionPerDayLbl4)
        scrollView.addSubview(productionPerDayTextField7)
        scrollView.addSubview(productionPerDayTextField8)
        scrollView.addSubview(numberOfHoursWorkedLbl2)
        scrollView.addSubview(numberOfHoursWorkedTextField3)
        scrollView.addSubview(numberOfHoursWorkedTextField4)
        scrollView.addSubview(productionPerHourLbl4)
        scrollView.addSubview(productionPerHourTextField7)
        scrollView.addSubview(productionPerHourTextField8)
        scrollView.addSubview(percentAppointmentsKeptLbl4)
        scrollView.addSubview(percentAppointmentsKeptTextField7)
        scrollView.addSubview(percentAppointmentsKeptTextField8)
        scrollView.addSubview(perioPercentLbl2)
        scrollView.addSubview(perioPercentTextField3)
        scrollView.addSubview(perioPercentTextField4)
        scrollView.addSubview(fluoridePercentLbl2)
        scrollView.addSubview(fluoridePercentTextField3)
        scrollView.addSubview(fluoridePercentTextField4)
        scrollView.addSubview(oralIdPercentLbl2)
        scrollView.addSubview(oralIdPercentTextField3)
        scrollView.addSubview(oralIdPercentTextField4)
        scrollView.addSubview(arestinPercentLbl2)
        scrollView.addSubview(arestinPercentTextField3)
        scrollView.addSubview(arestinPercentTextField4)
        scrollView.addSubview(reappointmentRateLbl2)
        scrollView.addSubview(reappointmentRateTextField3)
        scrollView.addSubview(reappointmentRateTextField4)
        scrollView.addSubview(retentionRateLbl4)
        scrollView.addSubview(retentionRateTextField7)
        scrollView.addSubview(retentionRateTextField8)
        scrollView.addSubview(categoryDivider17)
        scrollView.addSubview(goalTextField9)
        scrollView.addSubview(ashleyLbl)
        scrollView.addSubview(netProductionTextField11)
        scrollView.addSubview(daysWorkedTextField9)
        scrollView.addSubview(productionPerDayTextField9)
        scrollView.addSubview(numberOfHoursWorkedTextField5)
        scrollView.addSubview(productionPerHourTextField9)
        scrollView.addSubview(percentAppointmentsKeptTextField9)
        scrollView.addSubview(perioPercentTextField5)
        scrollView.addSubview(fluoridePercentTextField5)
        scrollView.addSubview(oralIdPercentTextField5)
        scrollView.addSubview(arestinPercentTextField5)
        scrollView.addSubview(reappointmentRateTextField5)
        scrollView.addSubview(retentionRateTextField9)
        scrollView.addSubview(jessicaLbl)
        
        scrollView.addSubview(amountPresentedTextField7)
        scrollView.addSubview(amountAcceptedTextField7)
        scrollView.addSubview(percentOfDollarAmountScheduledTextField7)
        scrollView.addSubview(numberPatientsPresentedTreatmentTextField7)
        scrollView.addSubview(numberPatientsAcceptedTreatmentTextField7)
        scrollView.addSubview(percentPatientsAcceptedTreatmentTextField7)
        
        scrollView.addSubview(scheduledAppointmentsLbl)
        scrollView.addSubview(scheduledAppointmentsLbl2)
        scrollView.addSubview(scheduledAppointmentsTextField1)
        scrollView.addSubview(scheduledAppointmentsTextField2)
        scrollView.addSubview(scheduledAppointmentsTextField3)
        scrollView.addSubview(scheduledAppointmentsTextField4)
        
        scrollView.addSubview(appointmentsKeptLbl)
        scrollView.addSubview(appointmentsKeptLbl2)
        scrollView.addSubview(appointmentsKeptTextField1)
        scrollView.addSubview(appointmentsKeptTextField2)
        scrollView.addSubview(appointmentsKeptTextField3)
        scrollView.addSubview(appointmentsKeptTextField4)
        
        scrollView.addSubview(appointmentsKeptLbl3)
        scrollView.addSubview(appointmentsKeptTextField5)
        scrollView.addSubview(appointmentsKeptTextField6)
        
        scrollView.addSubview(scheduledAppointmentsLbl3)
        scrollView.addSubview(scheduledAppointmentsTextField5)
        scrollView.addSubview(scheduledAppointmentsTextField6)
        
        scrollView.addSubview(fluoridePresentedLbl)
        scrollView.addSubview(fluoridePresentedTextField1)
        scrollView.addSubview(fluoridePresentedTextField2)
        
        scrollView.addSubview(fluorideAcceptedLbl)
        scrollView.addSubview(fluorideAcceptedTextField1)
        scrollView.addSubview(fluorideAcceptedTextField2)
        
        scrollView.addSubview(oralIDPresentedLbl)
        scrollView.addSubview(oralIDPresentedTextField1)
        scrollView.addSubview(oralIDPresentedTextField2)
        
        scrollView.addSubview(oralIDAcceptedLbl)
        scrollView.addSubview(oralIDAcceptedTextField1)
        scrollView.addSubview(oralIDAcceptedTextField2)
        
        scrollView.addSubview(arestinPresentedLbl)
        scrollView.addSubview(arestinPresentedTextField1)
        scrollView.addSubview(arestinPresentedTextField2)
        
        scrollView.addSubview(arestinAcceptedLbl)
        scrollView.addSubview(arestinAcceptedTextField1)
        scrollView.addSubview(arestinAcceptedTextField2)
        
        scrollView.addSubview(appointmentsSeenLbl)
        scrollView.addSubview(appointmentsSeenTextField1)
        scrollView.addSubview(appointmentsSeenTextField2)
        
        scrollView.addSubview(reappointmentsLbl)
        scrollView.addSubview(reappointmentsTextField1)
        scrollView.addSubview(reappointmentsTextField2)
        
        scrollView.addSubview(scheduledAppointmentsLbl4)
        scrollView.addSubview(scheduledAppointmentsTextField7)
        scrollView.addSubview(scheduledAppointmentsTextField8)
        scrollView.addSubview(scheduledAppointmentsTextField9)
        scrollView.addSubview(appointmentsKeptLbl4)
        scrollView.addSubview(appointmentsKeptTextField7)
        scrollView.addSubview(appointmentsKeptTextField8)
        scrollView.addSubview(appointmentsKeptTextField9)
        scrollView.addSubview(fluoridePresentedLbl2)
        scrollView.addSubview(fluoridePresentedTextField3)
        scrollView.addSubview(fluoridePresentedTextField4)
        scrollView.addSubview(fluoridePresentedTextField5)
        scrollView.addSubview(fluorideAcceptedLbl2)
        scrollView.addSubview(fluorideAcceptedTextField3)
        scrollView.addSubview(fluorideAcceptedTextField4)
        scrollView.addSubview(fluorideAcceptedTextField5)
        scrollView.addSubview(oralIDPresentedLbl2)
        scrollView.addSubview(oralIDPresentedTextField3)
        scrollView.addSubview(oralIDPresentedTextField4)
        scrollView.addSubview(oralIDPresentedTextField5)
        scrollView.addSubview(oralIDAcceptedLbl2)
        scrollView.addSubview(oralIDAcceptedTextField3)
        scrollView.addSubview(oralIDAcceptedTextField4)
        scrollView.addSubview(oralIDAcceptedTextField5)
        scrollView.addSubview(arestinPresentedLbl2)
        scrollView.addSubview(arestinPresentedTextField3)
        scrollView.addSubview(arestinPresentedTextField4)
        scrollView.addSubview(arestinPresentedTextField5)
        scrollView.addSubview(arestinAcceptedLbl2)
        scrollView.addSubview(arestinAcceptedTextField3)
        scrollView.addSubview(arestinAcceptedTextField4)
        scrollView.addSubview(arestinAcceptedTextField5)
        scrollView.addSubview(appointmentsSeenLbl2)
        scrollView.addSubview(appointmentsSeenTextField3)
        scrollView.addSubview(appointmentsSeenTextField4)
        scrollView.addSubview(appointmentsSeenTextField5)
        scrollView.addSubview(reappointmentsLbl2)
        scrollView.addSubview(reappointmentsTextField3)
        scrollView.addSubview(reappointmentsTextField4)
        scrollView.addSubview(reappointmentsTextField5)
        
        scrollView.addSubview(resetButton)
        
        resetButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        resetButton.topAnchor.constraint(equalTo: retentionRateLbl4.bottomAnchor, constant: 15).isActive = true
        resetButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        resetButton.heightAnchor.constraint(equalTo: submitButton.heightAnchor, multiplier: 0.95).isActive = true
        
        categoryHighlight1.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        categoryHighlight1.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        categoryHighlight1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        categoryHighlight1.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.1).isActive = true
        
        categoryDivider1.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        categoryDivider1.topAnchor.constraint(equalTo: categoryHighlight1.bottomAnchor, constant: 0).isActive = true
        categoryDivider1.widthAnchor.constraint(equalTo: categoryHighlight1.widthAnchor, multiplier: 1).isActive = true
        categoryDivider1.heightAnchor.constraint(equalTo: categoryHighlight1.heightAnchor, multiplier: 0.1).isActive = true
        
        adminAndInsuranceLbl.leftAnchor.constraint(equalTo: categoryHighlight1.leftAnchor, constant: 5).isActive = true
        adminAndInsuranceLbl.centerYAnchor.constraint(equalTo: categoryHighlight1.centerYAnchor).isActive = true
        adminAndInsuranceLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.03)
        
        categoryDivider2.centerXAnchor.constraint(equalTo: scrollView.leftAnchor, constant: view.frame.width * 0.4).isActive = true
        categoryDivider2.topAnchor.constraint(equalTo: categoryDivider1.bottomAnchor, constant: 0).isActive = true
        categoryDivider2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.001).isActive = true
        categoryDivider2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.85).isActive = true
        
        woodstockLbl.leftAnchor.constraint(equalTo: categoryDivider2.leftAnchor, constant: 5).isActive = true
        woodstockLbl.centerYAnchor.constraint(equalTo: categoryHighlight1.centerYAnchor).isActive = true
        woodstockLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.03)
        
        netProdutionLbl.leftAnchor.constraint(equalTo: categoryHighlight1.leftAnchor, constant: 0).isActive = true
        netProdutionLbl.topAnchor.constraint(equalTo: categoryDivider1.bottomAnchor, constant: 0).isActive = true
        netProdutionLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        netProdutionLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        netProdutionLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        netProductionTextField1.leftAnchor.constraint(equalTo: categoryDivider2.leftAnchor, constant: 0).isActive = true
        netProductionTextField1.centerYAnchor.constraint(equalTo: netProdutionLbl.centerYAnchor).isActive = true
        netProductionTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        netProductionTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        netProductionTextField2.leftAnchor.constraint(equalTo: netProductionTextField1.rightAnchor, constant: 0.5).isActive = true
        netProductionTextField2.centerYAnchor.constraint(equalTo: netProdutionLbl.centerYAnchor).isActive = true
        netProductionTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        netProductionTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        kennesawLbl.centerXAnchor.constraint(equalTo: netProductionTextField2.centerXAnchor).isActive = true
        kennesawLbl.centerYAnchor.constraint(equalTo: categoryHighlight1.centerYAnchor).isActive = true
        kennesawLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.03)
        
        horizontalDivider1.centerXAnchor.constraint(equalTo: categoryDivider1.centerXAnchor).isActive = true
        horizontalDivider1.topAnchor.constraint(equalTo: netProdutionLbl.bottomAnchor, constant: 0).isActive = true
        horizontalDivider1.widthAnchor.constraint(equalTo: categoryDivider1.widthAnchor, multiplier: 1).isActive = true
        horizontalDivider1.heightAnchor.constraint(equalTo: categoryDivider2.widthAnchor, multiplier: 1).isActive = true
        
        collectionsLbl.centerXAnchor.constraint(equalTo: netProdutionLbl.centerXAnchor).isActive = true
        collectionsLbl.topAnchor.constraint(equalTo: horizontalDivider1.bottomAnchor, constant: 0).isActive = true
        collectionsLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        collectionsLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        collectionsLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        collectionsTextField1.leftAnchor.constraint(equalTo: categoryDivider2.leftAnchor, constant: 0).isActive = true
        collectionsTextField1.centerYAnchor.constraint(equalTo: collectionsLbl.centerYAnchor).isActive = true
        collectionsTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        collectionsTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        collectionsTextField2.leftAnchor.constraint(equalTo: collectionsTextField1.rightAnchor, constant: 0.5).isActive = true
        collectionsTextField2.centerYAnchor.constraint(equalTo: collectionsLbl.centerYAnchor).isActive = true
        collectionsTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        collectionsTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        horizontalDivider2.centerXAnchor.constraint(equalTo: categoryDivider1.centerXAnchor).isActive = true
        horizontalDivider2.topAnchor.constraint(equalTo: collectionsLbl.bottomAnchor, constant: 0).isActive = true
        horizontalDivider2.widthAnchor.constraint(equalTo: categoryDivider1.widthAnchor, multiplier: 1).isActive = true
        horizontalDivider2.heightAnchor.constraint(equalTo: categoryDivider2.widthAnchor, multiplier: 1).isActive = true
        
        insuranceCollectionsLbl.centerXAnchor.constraint(equalTo: netProdutionLbl.centerXAnchor).isActive = true
        insuranceCollectionsLbl.topAnchor.constraint(equalTo: horizontalDivider2.bottomAnchor, constant: 0).isActive = true
        insuranceCollectionsLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        insuranceCollectionsLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        insuranceCollectionsLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        insuranceCollectionsTextField1.leftAnchor.constraint(equalTo: categoryDivider2.leftAnchor, constant: 0).isActive = true
        insuranceCollectionsTextField1.centerYAnchor.constraint(equalTo: insuranceCollectionsLbl.centerYAnchor).isActive = true
        insuranceCollectionsTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        insuranceCollectionsTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        insuranceCollectionsTextField2.leftAnchor.constraint(equalTo: insuranceCollectionsTextField1.rightAnchor, constant: 0.5).isActive = true
        insuranceCollectionsTextField2.centerYAnchor.constraint(equalTo: insuranceCollectionsLbl.centerYAnchor).isActive = true
        insuranceCollectionsTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        insuranceCollectionsTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        horizontalDivider3.centerXAnchor.constraint(equalTo: categoryDivider1.centerXAnchor).isActive = true
        horizontalDivider3.topAnchor.constraint(equalTo: insuranceCollectionsLbl.bottomAnchor, constant: 0).isActive = true
        horizontalDivider3.widthAnchor.constraint(equalTo: categoryDivider1.widthAnchor, multiplier: 1).isActive = true
        horizontalDivider3.heightAnchor.constraint(equalTo: categoryDivider2.widthAnchor, multiplier: 1).isActive = true
        
        otcCollectionsLbl.centerXAnchor.constraint(equalTo: netProdutionLbl.centerXAnchor).isActive = true
        otcCollectionsLbl.topAnchor.constraint(equalTo: horizontalDivider3.bottomAnchor, constant: 0.5).isActive = true
        otcCollectionsLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        otcCollectionsLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        otcCollectionsLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        otcCollectionsTextField1.leftAnchor.constraint(equalTo: categoryDivider2.leftAnchor, constant: 0).isActive = true
        otcCollectionsTextField1.centerYAnchor.constraint(equalTo: otcCollectionsLbl.centerYAnchor).isActive = true
        otcCollectionsTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        otcCollectionsTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        otcCollectionsTextField2.leftAnchor.constraint(equalTo: otcCollectionsTextField1.rightAnchor, constant: 0.5).isActive = true
        otcCollectionsTextField2.centerYAnchor.constraint(equalTo: otcCollectionsLbl.centerYAnchor).isActive = true
        otcCollectionsTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        otcCollectionsTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        amountRefundedToInsuranceLbl.centerXAnchor.constraint(equalTo: otcCollectionsLbl.centerXAnchor).isActive = true
        amountRefundedToInsuranceLbl.topAnchor.constraint(equalTo: otcCollectionsLbl.bottomAnchor, constant: 0.5).isActive = true
        amountRefundedToInsuranceLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        amountRefundedToInsuranceLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        amountRefundedToInsuranceLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        amountRefundedToInsuranceTextField1.leftAnchor.constraint(equalTo: categoryDivider2.leftAnchor, constant: 0).isActive = true
        amountRefundedToInsuranceTextField1.centerYAnchor.constraint(equalTo: amountRefundedToInsuranceLbl.centerYAnchor).isActive = true
        amountRefundedToInsuranceTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        amountRefundedToInsuranceTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        amountRefundedToInsuranceTextField2.leftAnchor.constraint(equalTo: amountRefundedToInsuranceTextField1.rightAnchor, constant: 0.5).isActive = true
        amountRefundedToInsuranceTextField2.centerYAnchor.constraint(equalTo: amountRefundedToInsuranceLbl.centerYAnchor).isActive = true
        amountRefundedToInsuranceTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        amountRefundedToInsuranceTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        amountRefundedToPatientsLbl.centerXAnchor.constraint(equalTo: otcCollectionsLbl.centerXAnchor).isActive = true
        amountRefundedToPatientsLbl.topAnchor.constraint(equalTo: amountRefundedToInsuranceLbl.bottomAnchor, constant: 0.5).isActive = true
        amountRefundedToPatientsLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        amountRefundedToPatientsLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        amountRefundedToPatientsLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        amountRefundedToPatientsTextField1.leftAnchor.constraint(equalTo: categoryDivider2.leftAnchor, constant: 0).isActive = true
        amountRefundedToPatientsTextField1.centerYAnchor.constraint(equalTo: amountRefundedToPatientsLbl.centerYAnchor).isActive = true
        amountRefundedToPatientsTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        amountRefundedToPatientsTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        amountRefundedToPatientsTextField2.leftAnchor.constraint(equalTo: amountRefundedToPatientsTextField1.rightAnchor, constant: 0.5).isActive = true
        amountRefundedToPatientsTextField2.centerYAnchor.constraint(equalTo: amountRefundedToPatientsLbl.centerYAnchor).isActive = true
        amountRefundedToPatientsTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        amountRefundedToPatientsTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentOTCToTotalCollectionsLbl.centerXAnchor.constraint(equalTo: otcCollectionsLbl.centerXAnchor).isActive = true
        percentOTCToTotalCollectionsLbl.topAnchor.constraint(equalTo: amountRefundedToPatientsLbl.bottomAnchor, constant: 0.5).isActive = true
        percentOTCToTotalCollectionsLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        percentOTCToTotalCollectionsLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        percentOTCToTotalCollectionsLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        percentOTCToTotalCollectionsTextField1.leftAnchor.constraint(equalTo: categoryDivider2.leftAnchor, constant: 0).isActive = true
        percentOTCToTotalCollectionsTextField1.centerYAnchor.constraint(equalTo: percentOTCToTotalCollectionsLbl.centerYAnchor).isActive = true
        percentOTCToTotalCollectionsTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        percentOTCToTotalCollectionsTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentOTCToTotalCollectionsTextField2.leftAnchor.constraint(equalTo: percentOTCToTotalCollectionsTextField1.rightAnchor, constant: 0.5).isActive = true
        percentOTCToTotalCollectionsTextField2.centerYAnchor.constraint(equalTo: percentOTCToTotalCollectionsLbl.centerYAnchor).isActive = true
        percentOTCToTotalCollectionsTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        percentOTCToTotalCollectionsTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentInsuranceToTotalCollectionsLbl.centerXAnchor.constraint(equalTo: otcCollectionsLbl.centerXAnchor).isActive = true
        percentInsuranceToTotalCollectionsLbl.topAnchor.constraint(equalTo: percentOTCToTotalCollectionsLbl.bottomAnchor, constant: 0.5).isActive = true
        percentInsuranceToTotalCollectionsLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        percentInsuranceToTotalCollectionsLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        percentInsuranceToTotalCollectionsLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        percentInsuranceToTotalCollectionsTextField1.leftAnchor.constraint(equalTo: categoryDivider2.leftAnchor, constant: 0).isActive = true
        percentInsuranceToTotalCollectionsTextField1.centerYAnchor.constraint(equalTo: percentInsuranceToTotalCollectionsLbl.centerYAnchor).isActive = true
        percentInsuranceToTotalCollectionsTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        percentInsuranceToTotalCollectionsTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentInsuranceToTotalCollectionsTextField2.leftAnchor.constraint(equalTo: percentInsuranceToTotalCollectionsTextField1.rightAnchor, constant: 0.5).isActive = true
        percentInsuranceToTotalCollectionsTextField2.centerYAnchor.constraint(equalTo: percentInsuranceToTotalCollectionsLbl.centerYAnchor).isActive = true
        percentInsuranceToTotalCollectionsTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        percentInsuranceToTotalCollectionsTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentCollectionsToNetProducionLbl.centerXAnchor.constraint(equalTo: otcCollectionsLbl.centerXAnchor).isActive = true
        percentCollectionsToNetProducionLbl.topAnchor.constraint(equalTo: percentInsuranceToTotalCollectionsLbl.bottomAnchor, constant: 0.5).isActive = true
        percentCollectionsToNetProducionLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        percentCollectionsToNetProducionLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        percentCollectionsToNetProducionLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        percentCollectionsToNetProducionTextField1.leftAnchor.constraint(equalTo: categoryDivider2.leftAnchor, constant: 0).isActive = true
        percentCollectionsToNetProducionTextField1.centerYAnchor.constraint(equalTo: percentCollectionsToNetProducionLbl.centerYAnchor).isActive = true
        percentCollectionsToNetProducionTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        percentCollectionsToNetProducionTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentCollectionsToNetProducionTextField2.leftAnchor.constraint(equalTo: percentCollectionsToNetProducionTextField1.rightAnchor, constant: 0.5).isActive = true
        percentCollectionsToNetProducionTextField2.centerYAnchor.constraint(equalTo: percentCollectionsToNetProducionLbl.centerYAnchor).isActive = true
        percentCollectionsToNetProducionTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        percentCollectionsToNetProducionTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        productionPerActiveChairLbl.centerXAnchor.constraint(equalTo: otcCollectionsLbl.centerXAnchor).isActive = true
        productionPerActiveChairLbl.topAnchor.constraint(equalTo: percentCollectionsToNetProducionLbl.bottomAnchor, constant: 0.5).isActive = true
        productionPerActiveChairLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        productionPerActiveChairLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        productionPerActiveChairLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        productionPerActiveChairTextField1.leftAnchor.constraint(equalTo: categoryDivider2.leftAnchor, constant: 0).isActive = true
        productionPerActiveChairTextField1.centerYAnchor.constraint(equalTo: productionPerActiveChairLbl.centerYAnchor).isActive = true
        productionPerActiveChairTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        productionPerActiveChairTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        productionPerActiveChairTextField2.leftAnchor.constraint(equalTo: productionPerActiveChairTextField1.rightAnchor, constant: 0.5).isActive = true
        productionPerActiveChairTextField2.centerYAnchor.constraint(equalTo: productionPerActiveChairLbl.centerYAnchor).isActive = true
        productionPerActiveChairTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        productionPerActiveChairTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        caseAcceptanceLbl.leftAnchor.constraint(equalTo: adminAndInsuranceLbl.leftAnchor).isActive = true
        caseAcceptanceLbl.topAnchor.constraint(equalTo: productionPerActiveChairLbl.bottomAnchor, constant: 50).isActive = true
        caseAcceptanceLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width / 18)
        
        categoryHighlight2.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        categoryHighlight2.topAnchor.constraint(equalTo: caseAcceptanceLbl.bottomAnchor, constant: 10).isActive = true
        categoryHighlight2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        categoryHighlight2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.1).isActive = true
        
        categoryDivider3.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        categoryDivider3.topAnchor.constraint(equalTo: categoryHighlight2.bottomAnchor, constant: 0).isActive = true
        categoryDivider3.widthAnchor.constraint(equalTo: categoryHighlight2.widthAnchor, multiplier: 1).isActive = true
        categoryDivider3.heightAnchor.constraint(equalTo: categoryHighlight1.heightAnchor, multiplier: 0.1).isActive = true
        
        treatmentCoordinatorsLbl.leftAnchor.constraint(equalTo: categoryHighlight2.leftAnchor, constant: 5).isActive = true
        treatmentCoordinatorsLbl.centerYAnchor.constraint(equalTo: categoryHighlight2.centerYAnchor).isActive = true
        treatmentCoordinatorsLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.025)
        
        categoryDivider4.centerXAnchor.constraint(equalTo: scrollView.leftAnchor, constant: view.frame.width * 0.4).isActive = true
        categoryDivider4.topAnchor.constraint(equalTo: categoryDivider3.bottomAnchor, constant: 0).isActive = true
        categoryDivider4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.001).isActive = true
        categoryDivider4.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.472).isActive = true
        
        HollyLbl.leftAnchor.constraint(equalTo: categoryDivider4.leftAnchor, constant: 5).isActive = true
        HollyLbl.centerYAnchor.constraint(equalTo: categoryHighlight2.centerYAnchor).isActive = true
        HollyLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.025)
        
        amountPresentedLbl.leftAnchor.constraint(equalTo: categoryHighlight2.leftAnchor, constant: 0).isActive = true
        amountPresentedLbl.topAnchor.constraint(equalTo: categoryDivider3.bottomAnchor, constant: 0).isActive = true
        amountPresentedLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        amountPresentedLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        amountPresentedLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        amountPresentedTextField1.leftAnchor.constraint(equalTo: categoryDivider4.leftAnchor, constant: 0).isActive = true
        amountPresentedTextField1.centerYAnchor.constraint(equalTo: amountPresentedLbl.centerYAnchor).isActive = true
        amountPresentedTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        amountPresentedTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        amountPresentedTextField2.leftAnchor.constraint(equalTo: amountPresentedTextField1.rightAnchor, constant: 0.5).isActive = true
        amountPresentedTextField2.centerYAnchor.constraint(equalTo: amountPresentedLbl.centerYAnchor).isActive = true
        amountPresentedTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        amountPresentedTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        sydneyLbl.leftAnchor.constraint(equalTo: amountPresentedTextField2.leftAnchor, constant: 1).isActive = true
        sydneyLbl.centerYAnchor.constraint(equalTo: categoryHighlight2.centerYAnchor).isActive = true
        sydneyLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.025)
        
        amountAcceptedLbl.centerXAnchor.constraint(equalTo: amountPresentedLbl.centerXAnchor).isActive = true
        amountAcceptedLbl.topAnchor.constraint(equalTo: amountPresentedLbl.bottomAnchor, constant: 0.5).isActive = true
        amountAcceptedLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        amountAcceptedLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        amountAcceptedLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        amountAcceptedTextField1.leftAnchor.constraint(equalTo: categoryDivider4.leftAnchor, constant: 0).isActive = true
        amountAcceptedTextField1.centerYAnchor.constraint(equalTo: amountAcceptedLbl.centerYAnchor).isActive = true
        amountAcceptedTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        amountAcceptedTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        amountAcceptedTextField2.leftAnchor.constraint(equalTo: amountAcceptedTextField1.rightAnchor, constant: 0.5).isActive = true
        amountAcceptedTextField2.centerYAnchor.constraint(equalTo: amountAcceptedLbl.centerYAnchor).isActive = true
        amountAcceptedTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        amountAcceptedTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentOfDollarAmountScheduledLbl.centerXAnchor.constraint(equalTo: amountAcceptedLbl.centerXAnchor).isActive = true
        percentOfDollarAmountScheduledLbl.topAnchor.constraint(equalTo: amountAcceptedLbl.bottomAnchor, constant: 0.5).isActive = true
        percentOfDollarAmountScheduledLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        percentOfDollarAmountScheduledLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        percentOfDollarAmountScheduledLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        percentOfDollarAmountScheduledTextField1.leftAnchor.constraint(equalTo: categoryDivider4.leftAnchor, constant: 0).isActive = true
        percentOfDollarAmountScheduledTextField1.centerYAnchor.constraint(equalTo: percentOfDollarAmountScheduledLbl.centerYAnchor).isActive = true
        percentOfDollarAmountScheduledTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        percentOfDollarAmountScheduledTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentOfDollarAmountScheduledTextField2.leftAnchor.constraint(equalTo: percentOfDollarAmountScheduledTextField1.rightAnchor, constant: 0.5).isActive = true
        percentOfDollarAmountScheduledTextField2.centerYAnchor.constraint(equalTo: percentOfDollarAmountScheduledLbl.centerYAnchor).isActive = true
        percentOfDollarAmountScheduledTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        percentOfDollarAmountScheduledTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        numberPatientsPresentedTreatmentLbl.centerXAnchor.constraint(equalTo: percentOfDollarAmountScheduledLbl.centerXAnchor).isActive = true
        numberPatientsPresentedTreatmentLbl.topAnchor.constraint(equalTo: percentOfDollarAmountScheduledLbl.bottomAnchor, constant: 0.5).isActive = true
        numberPatientsPresentedTreatmentLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        numberPatientsPresentedTreatmentLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        numberPatientsPresentedTreatmentLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        numberPatientsPresentedTreatmentTextField1.leftAnchor.constraint(equalTo: categoryDivider4.leftAnchor, constant: 0).isActive = true
        numberPatientsPresentedTreatmentTextField1.centerYAnchor.constraint(equalTo: numberPatientsPresentedTreatmentLbl.centerYAnchor).isActive = true
        numberPatientsPresentedTreatmentTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        numberPatientsPresentedTreatmentTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        numberPatientsPresentedTreatmentTextField2.leftAnchor.constraint(equalTo: numberPatientsPresentedTreatmentTextField1.rightAnchor, constant: 0.5).isActive = true
        numberPatientsPresentedTreatmentTextField2.centerYAnchor.constraint(equalTo: numberPatientsPresentedTreatmentLbl.centerYAnchor).isActive = true
        numberPatientsPresentedTreatmentTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        numberPatientsPresentedTreatmentTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        numberPatientsAccpetedTreatmentLbl.centerXAnchor.constraint(equalTo: numberPatientsPresentedTreatmentLbl.centerXAnchor).isActive = true
        numberPatientsAccpetedTreatmentLbl.topAnchor.constraint(equalTo: numberPatientsPresentedTreatmentLbl.bottomAnchor, constant: 0.5).isActive = true
        numberPatientsAccpetedTreatmentLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        numberPatientsAccpetedTreatmentLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        numberPatientsAccpetedTreatmentLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        numberPatientsAcceptedTreatmentTextField1.leftAnchor.constraint(equalTo: categoryDivider4.leftAnchor, constant: 0).isActive = true
        numberPatientsAcceptedTreatmentTextField1.centerYAnchor.constraint(equalTo: numberPatientsAccpetedTreatmentLbl.centerYAnchor).isActive = true
        numberPatientsAcceptedTreatmentTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        numberPatientsAcceptedTreatmentTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        numberPatientsAcceptedTreatmentTextField2.leftAnchor.constraint(equalTo: numberPatientsAcceptedTreatmentTextField1.rightAnchor, constant: 0.5).isActive = true
        numberPatientsAcceptedTreatmentTextField2.centerYAnchor.constraint(equalTo: numberPatientsAccpetedTreatmentLbl.centerYAnchor).isActive = true
        numberPatientsAcceptedTreatmentTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        numberPatientsAcceptedTreatmentTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentPatientsAcceptedTreatmentLbl.centerXAnchor.constraint(equalTo: numberPatientsAccpetedTreatmentLbl.centerXAnchor).isActive = true
        percentPatientsAcceptedTreatmentLbl.topAnchor.constraint(equalTo: numberPatientsAccpetedTreatmentLbl.bottomAnchor, constant: 0.5).isActive = true
        percentPatientsAcceptedTreatmentLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        percentPatientsAcceptedTreatmentLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        percentPatientsAcceptedTreatmentLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        percentPatientsAcceptedTreatmentTextField1.leftAnchor.constraint(equalTo: categoryDivider4.leftAnchor, constant: 0).isActive = true
        percentPatientsAcceptedTreatmentTextField1.centerYAnchor.constraint(equalTo: percentPatientsAcceptedTreatmentLbl.centerYAnchor).isActive = true
        percentPatientsAcceptedTreatmentTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        percentPatientsAcceptedTreatmentTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentPatientsAcceptedTreatmentTextField2.leftAnchor.constraint(equalTo: percentPatientsAcceptedTreatmentTextField1.rightAnchor, constant: 0.5).isActive = true
        percentPatientsAcceptedTreatmentTextField2.centerYAnchor.constraint(equalTo: percentPatientsAcceptedTreatmentLbl.centerYAnchor).isActive = true
        percentPatientsAcceptedTreatmentTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        percentPatientsAcceptedTreatmentTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        categoryHighlight3.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        categoryHighlight3.topAnchor.constraint(equalTo: percentPatientsAcceptedTreatmentLbl.bottomAnchor, constant: 10).isActive = true
        categoryHighlight3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        categoryHighlight3.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.1).isActive = true
        
        categoryDivider5.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        categoryDivider5.topAnchor.constraint(equalTo: categoryHighlight3.bottomAnchor, constant: 0).isActive = true
        categoryDivider5.widthAnchor.constraint(equalTo: categoryHighlight3.widthAnchor, multiplier: 1).isActive = true
        categoryDivider5.heightAnchor.constraint(equalTo: categoryHighlight3.heightAnchor, multiplier: 0.1).isActive = true
        
        treatmentCoordinatorsLbl2.leftAnchor.constraint(equalTo: categoryHighlight3.leftAnchor, constant: 5).isActive = true
        treatmentCoordinatorsLbl2.centerYAnchor.constraint(equalTo: categoryHighlight3.centerYAnchor).isActive = true
        treatmentCoordinatorsLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.02)
        
        categoryDivider6.centerXAnchor.constraint(equalTo: amountPresentedLbl2.leftAnchor, constant: view.frame.width * 0.3).isActive = true
        categoryDivider6.topAnchor.constraint(equalTo: categoryDivider5.bottomAnchor, constant: 0).isActive = true
        categoryDivider6.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.001).isActive = true
        categoryDivider6.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.48).isActive = true
        
        amandaLbl.leftAnchor.constraint(equalTo: categoryDivider6.leftAnchor, constant: 5).isActive = true
        amandaLbl.centerYAnchor.constraint(equalTo: categoryHighlight3.centerYAnchor).isActive = true
        amandaLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.025)
        
        amountPresentedLbl2.leftAnchor.constraint(equalTo: categoryHighlight3.leftAnchor, constant: 0).isActive = true
        amountPresentedLbl2.topAnchor.constraint(equalTo: categoryDivider5.bottomAnchor, constant: 0).isActive = true
        amountPresentedLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.315).isActive = true
        amountPresentedLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        amountPresentedLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        amountPresentedTextField3.leftAnchor.constraint(equalTo: categoryDivider6.leftAnchor, constant: 0).isActive = true
        amountPresentedTextField3.centerYAnchor.constraint(equalTo: amountPresentedLbl2.centerYAnchor).isActive = true
        amountPresentedTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        amountPresentedTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        amountPresentedTextField4.leftAnchor.constraint(equalTo: amountPresentedTextField3.rightAnchor, constant: 0.5).isActive = true
        amountPresentedTextField4.centerYAnchor.constraint(equalTo: amountPresentedLbl2.centerYAnchor).isActive = true
        amountPresentedTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        amountPresentedTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        AshleyGLbl.leftAnchor.constraint(equalTo: amountPresentedTextField4.leftAnchor, constant: 1).isActive = true
        AshleyGLbl.centerYAnchor.constraint(equalTo: categoryHighlight3.centerYAnchor).isActive = true
        AshleyGLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.025)
        
        amountAcceptedLbl2.centerXAnchor.constraint(equalTo: amountPresentedLbl2.centerXAnchor).isActive = true
        amountAcceptedLbl2.topAnchor.constraint(equalTo: amountPresentedLbl2.bottomAnchor, constant: 0.5).isActive = true
        amountAcceptedLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.315).isActive = true
        amountAcceptedLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        amountAcceptedLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        amountAcceptedTextField3.leftAnchor.constraint(equalTo: categoryDivider6.leftAnchor, constant: 0).isActive = true
        amountAcceptedTextField3.centerYAnchor.constraint(equalTo: amountAcceptedLbl2.centerYAnchor).isActive = true
        amountAcceptedTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        amountAcceptedTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        amountAcceptedTextField4.leftAnchor.constraint(equalTo: amountAcceptedTextField3.rightAnchor, constant: 0.5).isActive = true
        amountAcceptedTextField4.centerYAnchor.constraint(equalTo: amountAcceptedLbl2.centerYAnchor).isActive = true
        amountAcceptedTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        amountAcceptedTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentOfDollarAmountScheduledLbl2.centerXAnchor.constraint(equalTo: amountAcceptedLbl2.centerXAnchor).isActive = true
        percentOfDollarAmountScheduledLbl2.topAnchor.constraint(equalTo: amountAcceptedLbl2.bottomAnchor, constant: 0.5).isActive = true
        percentOfDollarAmountScheduledLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.315).isActive = true
        percentOfDollarAmountScheduledLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        percentOfDollarAmountScheduledLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        percentOfDollarAmountScheduledTextField3.leftAnchor.constraint(equalTo: categoryDivider6.leftAnchor, constant: 0).isActive = true
        percentOfDollarAmountScheduledTextField3.centerYAnchor.constraint(equalTo: percentOfDollarAmountScheduledLbl2.centerYAnchor).isActive = true
        percentOfDollarAmountScheduledTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        percentOfDollarAmountScheduledTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentOfDollarAmountScheduledTextField4.leftAnchor.constraint(equalTo: percentOfDollarAmountScheduledTextField3.rightAnchor, constant: 0.5).isActive = true
        percentOfDollarAmountScheduledTextField4.centerYAnchor.constraint(equalTo: percentOfDollarAmountScheduledLbl2.centerYAnchor).isActive = true
        percentOfDollarAmountScheduledTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        percentOfDollarAmountScheduledTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        numberPatientsPresentedTreatmentLbl2.centerXAnchor.constraint(equalTo: percentOfDollarAmountScheduledLbl2.centerXAnchor).isActive = true
        numberPatientsPresentedTreatmentLbl2.topAnchor.constraint(equalTo: percentOfDollarAmountScheduledLbl2.bottomAnchor, constant: 0.5).isActive = true
        numberPatientsPresentedTreatmentLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.315).isActive = true
        numberPatientsPresentedTreatmentLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        numberPatientsPresentedTreatmentLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        numberPatientsPresentedTreatmentTextField3.leftAnchor.constraint(equalTo: categoryDivider6.leftAnchor, constant: 0).isActive = true
        numberPatientsPresentedTreatmentTextField3.centerYAnchor.constraint(equalTo: numberPatientsPresentedTreatmentLbl2.centerYAnchor).isActive = true
        numberPatientsPresentedTreatmentTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        numberPatientsPresentedTreatmentTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        numberPatientsPresentedTreatmentTextField4.leftAnchor.constraint(equalTo: numberPatientsPresentedTreatmentTextField3.rightAnchor, constant: 0.5).isActive = true
        numberPatientsPresentedTreatmentTextField4.centerYAnchor.constraint(equalTo: numberPatientsPresentedTreatmentLbl2.centerYAnchor).isActive = true
        numberPatientsPresentedTreatmentTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        numberPatientsPresentedTreatmentTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        numberPatientsAccpetedTreatmentLbl2.centerXAnchor.constraint(equalTo: numberPatientsPresentedTreatmentLbl2.centerXAnchor).isActive = true
        numberPatientsAccpetedTreatmentLbl2.topAnchor.constraint(equalTo: numberPatientsPresentedTreatmentLbl2.bottomAnchor, constant: 0.5).isActive = true
        numberPatientsAccpetedTreatmentLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.315).isActive = true
        numberPatientsAccpetedTreatmentLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        numberPatientsAccpetedTreatmentLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        numberPatientsAcceptedTreatmentTextField3.leftAnchor.constraint(equalTo: categoryDivider6.leftAnchor, constant: 0).isActive = true
        numberPatientsAcceptedTreatmentTextField3.centerYAnchor.constraint(equalTo: numberPatientsAccpetedTreatmentLbl2.centerYAnchor).isActive = true
        numberPatientsAcceptedTreatmentTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        numberPatientsAcceptedTreatmentTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        numberPatientsAcceptedTreatmentTextField4.leftAnchor.constraint(equalTo: numberPatientsAcceptedTreatmentTextField3.rightAnchor, constant: 0.5).isActive = true
        numberPatientsAcceptedTreatmentTextField4.centerYAnchor.constraint(equalTo: numberPatientsAccpetedTreatmentLbl2.centerYAnchor).isActive = true
        numberPatientsAcceptedTreatmentTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        numberPatientsAcceptedTreatmentTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentPatientsAcceptedTreatmentLbl2.centerXAnchor.constraint(equalTo: numberPatientsAccpetedTreatmentLbl2.centerXAnchor).isActive = true
        percentPatientsAcceptedTreatmentLbl2.topAnchor.constraint(equalTo: numberPatientsAccpetedTreatmentLbl2.bottomAnchor, constant: 0.5).isActive = true
        percentPatientsAcceptedTreatmentLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.315).isActive = true
        percentPatientsAcceptedTreatmentLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        percentPatientsAcceptedTreatmentLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        percentPatientsAcceptedTreatmentTextField3.leftAnchor.constraint(equalTo: categoryDivider6.leftAnchor, constant: 0).isActive = true
        percentPatientsAcceptedTreatmentTextField3.centerYAnchor.constraint(equalTo: percentPatientsAcceptedTreatmentLbl2.centerYAnchor).isActive = true
        percentPatientsAcceptedTreatmentTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        percentPatientsAcceptedTreatmentTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentPatientsAcceptedTreatmentTextField4.leftAnchor.constraint(equalTo: percentPatientsAcceptedTreatmentTextField3.rightAnchor, constant: 0.5).isActive = true
        percentPatientsAcceptedTreatmentTextField4.centerYAnchor.constraint(equalTo: percentPatientsAcceptedTreatmentLbl2.centerYAnchor).isActive = true
        percentPatientsAcceptedTreatmentTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        percentPatientsAcceptedTreatmentTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        heatherDyerAmountPresentedTextField.leftAnchor.constraint(equalTo: amountPresentedTextField4.rightAnchor, constant: 0.5).isActive = true
        heatherDyerAmountPresentedTextField.centerYAnchor.constraint(equalTo: amountPresentedLbl2.centerYAnchor).isActive = true
        heatherDyerAmountPresentedTextField.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        heatherDyerAmountPresentedTextField.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
         
         heatherDyerLbl.centerXAnchor.constraint(equalTo: heatherDyerAmountPresentedTextField.centerXAnchor, constant: 0).isActive = true
         heatherDyerLbl.centerYAnchor.constraint(equalTo: categoryHighlight3.centerYAnchor).isActive = true
         heatherDyerLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.025)
        
        heatherDyerAmountAcceptedTextField.leftAnchor.constraint(equalTo: amountAcceptedTextField4.rightAnchor, constant: 0.5).isActive = true
        heatherDyerAmountAcceptedTextField.centerYAnchor.constraint(equalTo: amountAcceptedLbl2.centerYAnchor).isActive = true
        heatherDyerAmountAcceptedTextField.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        heatherDyerAmountAcceptedTextField.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        heatherDyerPercentOfDollarAmountScheduledTextField.leftAnchor.constraint(equalTo: percentOfDollarAmountScheduledTextField4.rightAnchor, constant: 0.5).isActive = true
        heatherDyerPercentOfDollarAmountScheduledTextField.centerYAnchor.constraint(equalTo: percentOfDollarAmountScheduledLbl2.centerYAnchor).isActive = true
        heatherDyerPercentOfDollarAmountScheduledTextField.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        heatherDyerPercentOfDollarAmountScheduledTextField.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        heatherDyerNumberPatientsPresentedTreatmentTextField.leftAnchor.constraint(equalTo: numberPatientsPresentedTreatmentTextField4.rightAnchor, constant: 0.5).isActive = true
        heatherDyerNumberPatientsPresentedTreatmentTextField.centerYAnchor.constraint(equalTo: numberPatientsPresentedTreatmentLbl2.centerYAnchor).isActive = true
        heatherDyerNumberPatientsPresentedTreatmentTextField.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        heatherDyerNumberPatientsPresentedTreatmentTextField.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        heatherDyerNumberPatientsAcceptedTreatmentTextField.leftAnchor.constraint(equalTo: numberPatientsAcceptedTreatmentTextField4.rightAnchor, constant: 0.5).isActive = true
        heatherDyerNumberPatientsAcceptedTreatmentTextField.centerYAnchor.constraint(equalTo: numberPatientsAccpetedTreatmentLbl2.centerYAnchor).isActive = true
        heatherDyerNumberPatientsAcceptedTreatmentTextField.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        heatherDyerNumberPatientsAcceptedTreatmentTextField.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        heatherDyerPercentPatientsAcceptedTreatmentTextField.leftAnchor.constraint(equalTo: percentPatientsAcceptedTreatmentTextField4.rightAnchor, constant: 0.5).isActive = true
        heatherDyerPercentPatientsAcceptedTreatmentTextField.centerYAnchor.constraint(equalTo: percentPatientsAcceptedTreatmentLbl2.centerYAnchor).isActive = true
        heatherDyerPercentPatientsAcceptedTreatmentTextField.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        heatherDyerPercentPatientsAcceptedTreatmentTextField.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        categoryHighlight4.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        categoryHighlight4.topAnchor.constraint(equalTo: percentPatientsAcceptedTreatmentLbl2.bottomAnchor, constant: 10).isActive = true
        categoryHighlight4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        categoryHighlight4.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.1).isActive = true
        
        categoryDivider7.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        categoryDivider7.topAnchor.constraint(equalTo: categoryHighlight4.bottomAnchor, constant: 0).isActive = true
        categoryDivider7.widthAnchor.constraint(equalTo: categoryHighlight4.widthAnchor, multiplier: 1).isActive = true
        categoryDivider7.heightAnchor.constraint(equalTo: categoryHighlight4.heightAnchor, multiplier: 0.1).isActive = true
        
        treatmentCoordinatorsLbl3.leftAnchor.constraint(equalTo: categoryHighlight4.leftAnchor, constant: 5).isActive = true
        treatmentCoordinatorsLbl3.centerYAnchor.constraint(equalTo: categoryHighlight4.centerYAnchor).isActive = true
        treatmentCoordinatorsLbl3.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.02)
        
        categoryDivider8.centerXAnchor.constraint(equalTo: amountPresentedLbl3.leftAnchor, constant: view.frame.width * 0.3).isActive = true
        categoryDivider8.topAnchor.constraint(equalTo: categoryDivider7.bottomAnchor, constant: 0).isActive = true
        categoryDivider8.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.001).isActive = true
        categoryDivider8.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.6).isActive = true
        
        amountPresentedLbl3.leftAnchor.constraint(equalTo: categoryHighlight4.leftAnchor, constant: 0).isActive = true
        amountPresentedLbl3.topAnchor.constraint(equalTo: categoryDivider7.bottomAnchor, constant: 0).isActive = true
        amountPresentedLbl3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.315).isActive = true
        amountPresentedLbl3.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        amountPresentedLbl3.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        amountPresentedTextField5.leftAnchor.constraint(equalTo: categoryDivider8.leftAnchor, constant: 0).isActive = true
        amountPresentedTextField5.centerYAnchor.constraint(equalTo: amountPresentedLbl3.centerYAnchor).isActive = true
        amountPresentedTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        amountPresentedTextField5.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        
        amountPresentedTextField6.leftAnchor.constraint(equalTo: amountPresentedTextField5.rightAnchor, constant: 0.5).isActive = true
        amountPresentedTextField6.centerYAnchor.constraint(equalTo: amountPresentedLbl3.centerYAnchor).isActive = true
        amountPresentedTextField6.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        amountPresentedTextField6.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        
        amountAcceptedLbl3.centerXAnchor.constraint(equalTo: amountPresentedLbl3.centerXAnchor).isActive = true
        amountAcceptedLbl3.topAnchor.constraint(equalTo: amountPresentedLbl3.bottomAnchor, constant: 0.5).isActive = true
        amountAcceptedLbl3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.315).isActive = true
        amountAcceptedLbl3.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        amountAcceptedLbl3.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        amountAcceptedTextField5.leftAnchor.constraint(equalTo: categoryDivider8.leftAnchor, constant: 0).isActive = true
        amountAcceptedTextField5.centerYAnchor.constraint(equalTo: amountAcceptedLbl3.centerYAnchor).isActive = true
        amountAcceptedTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        amountAcceptedTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        amountAcceptedTextField6.leftAnchor.constraint(equalTo: amountAcceptedTextField5.rightAnchor, constant: 0.5).isActive = true
        amountAcceptedTextField6.centerYAnchor.constraint(equalTo: amountAcceptedLbl3.centerYAnchor).isActive = true
        amountAcceptedTextField6.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        amountAcceptedTextField6.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentOfDollarAmountScheduledLbl3.centerXAnchor.constraint(equalTo: amountAcceptedLbl3.centerXAnchor).isActive = true
        percentOfDollarAmountScheduledLbl3.topAnchor.constraint(equalTo: amountAcceptedLbl3.bottomAnchor, constant: 0.5).isActive = true
        percentOfDollarAmountScheduledLbl3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.315).isActive = true
        percentOfDollarAmountScheduledLbl3.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        percentOfDollarAmountScheduledLbl3.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        percentOfDollarAmountScheduledTextField5.leftAnchor.constraint(equalTo: categoryDivider8.leftAnchor, constant: 0).isActive = true
        percentOfDollarAmountScheduledTextField5.centerYAnchor.constraint(equalTo: percentOfDollarAmountScheduledLbl3.centerYAnchor).isActive = true
        percentOfDollarAmountScheduledTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        percentOfDollarAmountScheduledTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentOfDollarAmountScheduledTextField6.leftAnchor.constraint(equalTo: percentOfDollarAmountScheduledTextField5.rightAnchor, constant: 0.5).isActive = true
        percentOfDollarAmountScheduledTextField6.centerYAnchor.constraint(equalTo: percentOfDollarAmountScheduledLbl3.centerYAnchor).isActive = true
        percentOfDollarAmountScheduledTextField6.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        percentOfDollarAmountScheduledTextField6.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        numberPatientsPresentedTreatmentLbl3.centerXAnchor.constraint(equalTo: percentOfDollarAmountScheduledLbl3.centerXAnchor).isActive = true
        numberPatientsPresentedTreatmentLbl3.topAnchor.constraint(equalTo: percentOfDollarAmountScheduledLbl3.bottomAnchor, constant: 0.5).isActive = true
        numberPatientsPresentedTreatmentLbl3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.315).isActive = true
        numberPatientsPresentedTreatmentLbl3.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        numberPatientsPresentedTreatmentLbl3.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        numberPatientsPresentedTreatmentTextField5.leftAnchor.constraint(equalTo: categoryDivider8.leftAnchor, constant: 0).isActive = true
        numberPatientsPresentedTreatmentTextField5.centerYAnchor.constraint(equalTo: numberPatientsPresentedTreatmentLbl3.centerYAnchor).isActive = true
        numberPatientsPresentedTreatmentTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        numberPatientsPresentedTreatmentTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        numberPatientsPresentedTreatmentTextField6.leftAnchor.constraint(equalTo: numberPatientsPresentedTreatmentTextField5.rightAnchor, constant: 0.5).isActive = true
        numberPatientsPresentedTreatmentTextField6.centerYAnchor.constraint(equalTo: numberPatientsPresentedTreatmentLbl3.centerYAnchor).isActive = true
        numberPatientsPresentedTreatmentTextField6.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        numberPatientsPresentedTreatmentTextField6.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        numberPatientsAccpetedTreatmentLbl3.centerXAnchor.constraint(equalTo: numberPatientsPresentedTreatmentLbl3.centerXAnchor).isActive = true
        numberPatientsAccpetedTreatmentLbl3.topAnchor.constraint(equalTo: numberPatientsPresentedTreatmentLbl3.bottomAnchor, constant: 0.5).isActive = true
        numberPatientsAccpetedTreatmentLbl3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.315).isActive = true
        numberPatientsAccpetedTreatmentLbl3.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        numberPatientsAccpetedTreatmentLbl3.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        numberPatientsAcceptedTreatmentTextField5.leftAnchor.constraint(equalTo: categoryDivider8.leftAnchor, constant: 0).isActive = true
        numberPatientsAcceptedTreatmentTextField5.centerYAnchor.constraint(equalTo: numberPatientsAccpetedTreatmentLbl3.centerYAnchor).isActive = true
        numberPatientsAcceptedTreatmentTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        numberPatientsAcceptedTreatmentTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        numberPatientsAcceptedTreatmentTextField6.leftAnchor.constraint(equalTo: numberPatientsAcceptedTreatmentTextField5.rightAnchor, constant: 0.5).isActive = true
        numberPatientsAcceptedTreatmentTextField6.centerYAnchor.constraint(equalTo: numberPatientsAccpetedTreatmentLbl3.centerYAnchor).isActive = true
        numberPatientsAcceptedTreatmentTextField6.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        numberPatientsAcceptedTreatmentTextField6.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentPatientsAcceptedTreatmentLbl3.centerXAnchor.constraint(equalTo: numberPatientsAccpetedTreatmentLbl3.centerXAnchor).isActive = true
        percentPatientsAcceptedTreatmentLbl3.topAnchor.constraint(equalTo: numberPatientsAccpetedTreatmentLbl3.bottomAnchor, constant: 0.5).isActive = true
        percentPatientsAcceptedTreatmentLbl3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.315).isActive = true
        percentPatientsAcceptedTreatmentLbl3.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        percentPatientsAcceptedTreatmentLbl3.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        percentPatientsAcceptedTreatmentTextField5.leftAnchor.constraint(equalTo: categoryDivider8.leftAnchor, constant: 0).isActive = true
        percentPatientsAcceptedTreatmentTextField5.centerYAnchor.constraint(equalTo: percentPatientsAcceptedTreatmentLbl3.centerYAnchor).isActive = true
        percentPatientsAcceptedTreatmentTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        percentPatientsAcceptedTreatmentTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentPatientsAcceptedTreatmentTextField6.leftAnchor.constraint(equalTo: percentPatientsAcceptedTreatmentTextField5.rightAnchor, constant: 0.5).isActive = true
        percentPatientsAcceptedTreatmentTextField6.centerYAnchor.constraint(equalTo: percentPatientsAcceptedTreatmentLbl3.centerYAnchor).isActive = true
        percentPatientsAcceptedTreatmentTextField6.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        percentPatientsAcceptedTreatmentTextField6.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        providersLbl.leftAnchor.constraint(equalTo: treatmentCoordinatorsLbl3.leftAnchor).isActive = true
        providersLbl.topAnchor.constraint(equalTo: percentPatientsAcceptedTreatmentLbl3.bottomAnchor, constant: 50).isActive = true
        providersLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width / 18)
        
        categoryHighlight5.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        categoryHighlight5.topAnchor.constraint(equalTo: providersLbl.bottomAnchor, constant: 10).isActive = true
        categoryHighlight5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        categoryHighlight5.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.1).isActive = true
        
        categoryDivider9.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        categoryDivider9.topAnchor.constraint(equalTo: categoryHighlight5.bottomAnchor, constant: 0).isActive = true
        categoryDivider9.widthAnchor.constraint(equalTo: categoryHighlight5.widthAnchor, multiplier: 1).isActive = true
        categoryDivider9.heightAnchor.constraint(equalTo: categoryHighlight5.heightAnchor, multiplier: 0.1).isActive = true
        
        doctorsLbl.leftAnchor.constraint(equalTo: categoryHighlight5.leftAnchor, constant: 5).isActive = true
        doctorsLbl.centerYAnchor.constraint(equalTo: categoryHighlight5.centerYAnchor).isActive = true
        doctorsLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.038)
        
        categoryDivider10.centerXAnchor.constraint(equalTo: scrollView.leftAnchor, constant: view.frame.width * 0.4).isActive = true
        categoryDivider10.topAnchor.constraint(equalTo: categoryDivider9.bottomAnchor, constant: 0).isActive = true
        categoryDivider10.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.001).isActive = true
        categoryDivider10.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.6).isActive = true
        
        drVLbl.leftAnchor.constraint(equalTo: categoryDivider10.leftAnchor, constant: 5).isActive = true
        drVLbl.centerYAnchor.constraint(equalTo: categoryHighlight5.centerYAnchor).isActive = true
        drVLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.038)
        
        goalLbl.leftAnchor.constraint(equalTo: categoryHighlight5.leftAnchor, constant: 0).isActive = true
        goalLbl.topAnchor.constraint(equalTo: categoryDivider9.bottomAnchor, constant: 0).isActive = true
        goalLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        goalLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        goalLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        goalTextField1.leftAnchor.constraint(equalTo: categoryDivider10.leftAnchor, constant: 0).isActive = true
        goalTextField1.centerYAnchor.constraint(equalTo: goalLbl.centerYAnchor).isActive = true
        goalTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        goalTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        goalTextField2.leftAnchor.constraint(equalTo: goalTextField1.rightAnchor, constant: 0.5).isActive = true
        goalTextField2.centerYAnchor.constraint(equalTo: goalLbl.centerYAnchor).isActive = true
        goalTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        goalTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        drMcreeLbl.leftAnchor.constraint(equalTo: goalTextField2.leftAnchor, constant: 1).isActive = true
        drMcreeLbl.centerYAnchor.constraint(equalTo: categoryHighlight5.centerYAnchor).isActive = true
        drMcreeLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.038)
        
        netProductionLbl.centerXAnchor.constraint(equalTo: goalLbl.centerXAnchor).isActive = true
        netProductionLbl.topAnchor.constraint(equalTo: goalLbl.bottomAnchor, constant: 0.5).isActive = true
        netProductionLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        netProductionLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        netProductionLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        netProductionTextField3.leftAnchor.constraint(equalTo: categoryDivider10.leftAnchor, constant: 0).isActive = true
        netProductionTextField3.centerYAnchor.constraint(equalTo:netProductionLbl.centerYAnchor).isActive = true
        netProductionTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        netProductionTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        netProductionTextField4.leftAnchor.constraint(equalTo: netProductionTextField3.rightAnchor, constant: 0.5).isActive = true
        netProductionTextField4.centerYAnchor.constraint(equalTo: netProductionLbl.centerYAnchor).isActive = true
        netProductionTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        netProductionTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        daysWorkedLbl.centerXAnchor.constraint(equalTo: netProductionLbl.centerXAnchor).isActive = true
        daysWorkedLbl.topAnchor.constraint(equalTo: netProductionLbl.bottomAnchor, constant: 0.5).isActive = true
        daysWorkedLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        daysWorkedLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        daysWorkedLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        daysWorkedTextField1.leftAnchor.constraint(equalTo: categoryDivider10.leftAnchor, constant: 0).isActive = true
        daysWorkedTextField1.centerYAnchor.constraint(equalTo: daysWorkedLbl.centerYAnchor).isActive = true
        daysWorkedTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        daysWorkedTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        daysWorkedTextField2.leftAnchor.constraint(equalTo: daysWorkedTextField1.rightAnchor, constant: 0.5).isActive = true
        daysWorkedTextField2.centerYAnchor.constraint(equalTo: daysWorkedLbl.centerYAnchor).isActive = true
        daysWorkedTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        daysWorkedTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        productionPerDayLbl.centerXAnchor.constraint(equalTo: daysWorkedLbl.centerXAnchor).isActive = true
        productionPerDayLbl.topAnchor.constraint(equalTo: daysWorkedLbl.bottomAnchor, constant: 0.5).isActive = true
        productionPerDayLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        productionPerDayLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        productionPerDayLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        productionPerDayTextField1.leftAnchor.constraint(equalTo: categoryDivider10.leftAnchor, constant: 0).isActive = true
        productionPerDayTextField1.centerYAnchor.constraint(equalTo: productionPerDayLbl.centerYAnchor).isActive = true
        productionPerDayTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        productionPerDayTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        productionPerDayTextField2.leftAnchor.constraint(equalTo: productionPerDayTextField1.rightAnchor, constant: 0.5).isActive = true
        productionPerDayTextField2.centerYAnchor.constraint(equalTo: productionPerDayLbl.centerYAnchor).isActive = true
        productionPerDayTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        productionPerDayTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        productionPerHourLbl.centerXAnchor.constraint(equalTo: productionPerDayLbl.centerXAnchor).isActive = true
        productionPerHourLbl.topAnchor.constraint(equalTo: productionPerDayLbl.bottomAnchor, constant: 0.5).isActive = true
        productionPerHourLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        productionPerHourLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        productionPerHourLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        productionPerHourTextField1.leftAnchor.constraint(equalTo: categoryDivider10.leftAnchor, constant: 0).isActive = true
        productionPerHourTextField1.centerYAnchor.constraint(equalTo: productionPerHourLbl.centerYAnchor).isActive = true
        productionPerHourTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        productionPerHourTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        productionPerHourTextField2.leftAnchor.constraint(equalTo: productionPerHourTextField1.rightAnchor, constant: 0.5).isActive = true
        productionPerHourTextField2.centerYAnchor.constraint(equalTo: productionPerHourLbl.centerYAnchor).isActive = true
        productionPerHourTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        productionPerHourTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        dollarAmountSameDayTreatmentLbl.centerXAnchor.constraint(equalTo: productionPerHourLbl.centerXAnchor).isActive = true
        dollarAmountSameDayTreatmentLbl.topAnchor.constraint(equalTo: productionPerHourLbl.bottomAnchor, constant: 0.5).isActive = true
        dollarAmountSameDayTreatmentLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        dollarAmountSameDayTreatmentLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        dollarAmountSameDayTreatmentLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        dollarAmountSameDayTreatmentTextField1.leftAnchor.constraint(equalTo: categoryDivider10.leftAnchor, constant: 0).isActive = true
        dollarAmountSameDayTreatmentTextField1.centerYAnchor.constraint(equalTo: dollarAmountSameDayTreatmentLbl.centerYAnchor).isActive = true
        dollarAmountSameDayTreatmentTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        dollarAmountSameDayTreatmentTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        dollarAmountSameDayTreatmentTextField2.leftAnchor.constraint(equalTo: dollarAmountSameDayTreatmentTextField1.rightAnchor, constant: 0.5).isActive = true
        dollarAmountSameDayTreatmentTextField2.centerYAnchor.constraint(equalTo: dollarAmountSameDayTreatmentLbl.centerYAnchor).isActive = true
        dollarAmountSameDayTreatmentTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        dollarAmountSameDayTreatmentTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        scheduledAppointmentsLbl.centerXAnchor.constraint(equalTo: dollarAmountSameDayTreatmentLbl.centerXAnchor).isActive = true
        scheduledAppointmentsLbl.topAnchor.constraint(equalTo: dollarAmountSameDayTreatmentLbl.bottomAnchor, constant: 0.5).isActive = true
        scheduledAppointmentsLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        scheduledAppointmentsLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        scheduledAppointmentsLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        scheduledAppointmentsTextField1.leftAnchor.constraint(equalTo: categoryDivider10.leftAnchor, constant: 0).isActive = true
        scheduledAppointmentsTextField1.centerYAnchor.constraint(equalTo: scheduledAppointmentsLbl.centerYAnchor).isActive = true
        scheduledAppointmentsTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        scheduledAppointmentsTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        scheduledAppointmentsTextField2.leftAnchor.constraint(equalTo: scheduledAppointmentsTextField1.rightAnchor, constant: 0.5).isActive = true
        scheduledAppointmentsTextField2.centerYAnchor.constraint(equalTo: scheduledAppointmentsLbl.centerYAnchor).isActive = true
        scheduledAppointmentsTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        scheduledAppointmentsTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        appointmentsKeptLbl.centerXAnchor.constraint(equalTo: scheduledAppointmentsLbl.centerXAnchor).isActive = true
        appointmentsKeptLbl.topAnchor.constraint(equalTo: scheduledAppointmentsLbl.bottomAnchor, constant: 0.5).isActive = true
        appointmentsKeptLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        appointmentsKeptLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        appointmentsKeptLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        appointmentsKeptTextField1.leftAnchor.constraint(equalTo: categoryDivider10.leftAnchor, constant: 0).isActive = true
        appointmentsKeptTextField1.centerYAnchor.constraint(equalTo: appointmentsKeptLbl.centerYAnchor).isActive = true
        appointmentsKeptTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        appointmentsKeptTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        appointmentsKeptTextField2.leftAnchor.constraint(equalTo: appointmentsKeptTextField1.rightAnchor, constant: 0.5).isActive = true
        appointmentsKeptTextField2.centerYAnchor.constraint(equalTo: appointmentsKeptLbl.centerYAnchor).isActive = true
        appointmentsKeptTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        appointmentsKeptTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentAppointmentsKeptLbl.centerXAnchor.constraint(equalTo: appointmentsKeptLbl.centerXAnchor).isActive = true
        percentAppointmentsKeptLbl.topAnchor.constraint(equalTo: appointmentsKeptLbl.bottomAnchor, constant: 0.5).isActive = true
        percentAppointmentsKeptLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        percentAppointmentsKeptLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        percentAppointmentsKeptLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        percentAppointmentsKeptTextField1.leftAnchor.constraint(equalTo: categoryDivider10.leftAnchor, constant: 0).isActive = true
        percentAppointmentsKeptTextField1.centerYAnchor.constraint(equalTo: percentAppointmentsKeptLbl.centerYAnchor).isActive = true
        percentAppointmentsKeptTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        percentAppointmentsKeptTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentAppointmentsKeptTextField2.leftAnchor.constraint(equalTo: percentAppointmentsKeptTextField1.rightAnchor, constant: 0.5).isActive = true
        percentAppointmentsKeptTextField2.centerYAnchor.constraint(equalTo: percentAppointmentsKeptLbl.centerYAnchor).isActive = true
        percentAppointmentsKeptTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        percentAppointmentsKeptTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        retentionRateLbl.centerXAnchor.constraint(equalTo: percentAppointmentsKeptLbl.centerXAnchor).isActive = true
        retentionRateLbl.topAnchor.constraint(equalTo: percentAppointmentsKeptLbl.bottomAnchor, constant: 0.5).isActive = true
        retentionRateLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        retentionRateLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        retentionRateLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        retentionRateTextField1.leftAnchor.constraint(equalTo: categoryDivider10.leftAnchor, constant: 0).isActive = true
        retentionRateTextField1.centerYAnchor.constraint(equalTo: retentionRateLbl.centerYAnchor).isActive = true
        retentionRateTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        retentionRateTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        retentionRateTextField2.leftAnchor.constraint(equalTo: retentionRateTextField1.rightAnchor, constant: 0.5).isActive = true
        retentionRateTextField2.centerYAnchor.constraint(equalTo: retentionRateLbl.centerYAnchor).isActive = true
        retentionRateTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        retentionRateTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        categoryHighlight6.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        categoryHighlight6.topAnchor.constraint(equalTo: retentionRateLbl.bottomAnchor, constant: 10).isActive = true
        categoryHighlight6.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        categoryHighlight6.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.1).isActive = true
        
        categoryDivider11.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        categoryDivider11.topAnchor.constraint(equalTo: categoryHighlight6.bottomAnchor, constant: 0).isActive = true
        categoryDivider11.widthAnchor.constraint(equalTo: categoryHighlight6.widthAnchor, multiplier: 1).isActive = true
        categoryDivider11.heightAnchor.constraint(equalTo: categoryHighlight5.heightAnchor, multiplier: 0.1).isActive = true
        
        doctorsLbl2.leftAnchor.constraint(equalTo: categoryHighlight6.leftAnchor, constant: 5).isActive = true
        doctorsLbl2.centerYAnchor.constraint(equalTo: categoryHighlight6.centerYAnchor).isActive = true
        doctorsLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.038)
        
        categoryDivider12.centerXAnchor.constraint(equalTo: scrollView.leftAnchor, constant: view.frame.width * 0.4).isActive = true
        categoryDivider12.topAnchor.constraint(equalTo: categoryDivider11.bottomAnchor, constant: 0).isActive = true
        categoryDivider12.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.001).isActive = true
        categoryDivider12.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.6).isActive = true
        
        drOrzaLbl.leftAnchor.constraint(equalTo: categoryDivider12.leftAnchor, constant: 5).isActive = true
        drOrzaLbl.centerYAnchor.constraint(equalTo: categoryHighlight6.centerYAnchor).isActive = true
        drOrzaLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.038)
        
        goalLbl2.leftAnchor.constraint(equalTo: categoryHighlight6.leftAnchor, constant: 0).isActive = true
        goalLbl2.topAnchor.constraint(equalTo: categoryDivider11.bottomAnchor, constant: 0).isActive = true
        goalLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        goalLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        goalLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        goalTextField3.leftAnchor.constraint(equalTo: categoryDivider12.leftAnchor, constant: 0).isActive = true
        goalTextField3.centerYAnchor.constraint(equalTo: goalLbl2.centerYAnchor).isActive = true
        goalTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        goalTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        goalTextField4.leftAnchor.constraint(equalTo: goalTextField3.rightAnchor, constant: 0.5).isActive = true
        goalTextField4.centerYAnchor.constraint(equalTo: goalLbl2.centerYAnchor).isActive = true
        goalTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        goalTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        drFranLbl.leftAnchor.constraint(equalTo: goalTextField4.leftAnchor, constant: 1).isActive = true
        drFranLbl.centerYAnchor.constraint(equalTo: categoryHighlight6.centerYAnchor).isActive = true
        drFranLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.038)
        
        netProductionLbl2.centerXAnchor.constraint(equalTo: goalLbl2.centerXAnchor).isActive = true
        netProductionLbl2.topAnchor.constraint(equalTo: goalLbl2.bottomAnchor, constant: 0.5).isActive = true
        netProductionLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        netProductionLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        netProductionLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        netProductionTextField5.leftAnchor.constraint(equalTo: categoryDivider12.leftAnchor, constant: 0).isActive = true
        netProductionTextField5.centerYAnchor.constraint(equalTo:netProductionLbl2.centerYAnchor).isActive = true
        netProductionTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        netProductionTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        netProductionTextField6.leftAnchor.constraint(equalTo: netProductionTextField5.rightAnchor, constant: 0.5).isActive = true
        netProductionTextField6.centerYAnchor.constraint(equalTo: netProductionLbl2.centerYAnchor).isActive = true
        netProductionTextField6.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        netProductionTextField6.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        daysWorkedLbl2.centerXAnchor.constraint(equalTo: netProductionLbl2.centerXAnchor).isActive = true
        daysWorkedLbl2.topAnchor.constraint(equalTo: netProductionLbl2.bottomAnchor, constant: 0.5).isActive = true
        daysWorkedLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        daysWorkedLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        daysWorkedLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        daysWorkedTextField3.leftAnchor.constraint(equalTo: categoryDivider12.leftAnchor, constant: 0).isActive = true
        daysWorkedTextField3.centerYAnchor.constraint(equalTo: daysWorkedLbl2.centerYAnchor).isActive = true
        daysWorkedTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        daysWorkedTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        daysWorkedTextField4.leftAnchor.constraint(equalTo: daysWorkedTextField3.rightAnchor, constant: 0.5).isActive = true
        daysWorkedTextField4.centerYAnchor.constraint(equalTo: daysWorkedLbl2.centerYAnchor).isActive = true
        daysWorkedTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        daysWorkedTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        productionPerDayLbl2.centerXAnchor.constraint(equalTo: daysWorkedLbl2.centerXAnchor).isActive = true
        productionPerDayLbl2.topAnchor.constraint(equalTo: daysWorkedLbl2.bottomAnchor, constant: 0.5).isActive = true
        productionPerDayLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        productionPerDayLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        productionPerDayLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        productionPerDayTextField3.leftAnchor.constraint(equalTo: categoryDivider12.leftAnchor, constant: 0).isActive = true
        productionPerDayTextField3.centerYAnchor.constraint(equalTo: productionPerDayLbl2.centerYAnchor).isActive = true
        productionPerDayTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        productionPerDayTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        productionPerDayTextField4.leftAnchor.constraint(equalTo: productionPerDayTextField3.rightAnchor, constant: 0.5).isActive = true
        productionPerDayTextField4.centerYAnchor.constraint(equalTo: productionPerDayLbl2.centerYAnchor).isActive = true
        productionPerDayTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        productionPerDayTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        productionPerHourLbl2.centerXAnchor.constraint(equalTo: productionPerDayLbl2.centerXAnchor).isActive = true
        productionPerHourLbl2.topAnchor.constraint(equalTo: productionPerDayLbl2.bottomAnchor, constant: 0.5).isActive = true
        productionPerHourLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        productionPerHourLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        productionPerHourLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        productionPerHourTextField3.leftAnchor.constraint(equalTo: categoryDivider12.leftAnchor, constant: 0).isActive = true
        productionPerHourTextField3.centerYAnchor.constraint(equalTo: productionPerHourLbl2.centerYAnchor).isActive = true
        productionPerHourTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        productionPerHourTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        productionPerHourTextField4.leftAnchor.constraint(equalTo: productionPerHourTextField3.rightAnchor, constant: 0.5).isActive = true
        productionPerHourTextField4.centerYAnchor.constraint(equalTo: productionPerHourLbl2.centerYAnchor).isActive = true
        productionPerHourTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        productionPerHourTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        dollarAmountSameDayTreatmentLbl2.centerXAnchor.constraint(equalTo: productionPerHourLbl2.centerXAnchor).isActive = true
        dollarAmountSameDayTreatmentLbl2.topAnchor.constraint(equalTo: productionPerHourLbl2.bottomAnchor, constant: 0.5).isActive = true
        dollarAmountSameDayTreatmentLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        dollarAmountSameDayTreatmentLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        dollarAmountSameDayTreatmentLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        dollarAmountSameDayTreatmentTextField3.leftAnchor.constraint(equalTo: categoryDivider12.leftAnchor, constant: 0).isActive = true
        dollarAmountSameDayTreatmentTextField3.centerYAnchor.constraint(equalTo: dollarAmountSameDayTreatmentLbl2.centerYAnchor).isActive = true
        dollarAmountSameDayTreatmentTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        dollarAmountSameDayTreatmentTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        dollarAmountSameDayTreatmentTextField4.leftAnchor.constraint(equalTo: dollarAmountSameDayTreatmentTextField3.rightAnchor, constant: 0.5).isActive = true
        dollarAmountSameDayTreatmentTextField4.centerYAnchor.constraint(equalTo: dollarAmountSameDayTreatmentLbl2.centerYAnchor).isActive = true
        dollarAmountSameDayTreatmentTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        dollarAmountSameDayTreatmentTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true 
        
        scheduledAppointmentsLbl2.centerXAnchor.constraint(equalTo: dollarAmountSameDayTreatmentLbl2.centerXAnchor).isActive = true
        scheduledAppointmentsLbl2.topAnchor.constraint(equalTo: dollarAmountSameDayTreatmentLbl2.bottomAnchor, constant: 0.5).isActive = true
        scheduledAppointmentsLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        scheduledAppointmentsLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        scheduledAppointmentsLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        scheduledAppointmentsTextField3.leftAnchor.constraint(equalTo: categoryDivider12.leftAnchor, constant: 0).isActive = true
        scheduledAppointmentsTextField3.centerYAnchor.constraint(equalTo: scheduledAppointmentsLbl2.centerYAnchor).isActive = true
        scheduledAppointmentsTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        scheduledAppointmentsTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        scheduledAppointmentsTextField4.leftAnchor.constraint(equalTo: scheduledAppointmentsTextField3.rightAnchor, constant: 0.5).isActive = true
        scheduledAppointmentsTextField4.centerYAnchor.constraint(equalTo: scheduledAppointmentsLbl2.centerYAnchor).isActive = true
        scheduledAppointmentsTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        scheduledAppointmentsTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        appointmentsKeptLbl2.centerXAnchor.constraint(equalTo: scheduledAppointmentsLbl2.centerXAnchor).isActive = true
        appointmentsKeptLbl2.topAnchor.constraint(equalTo: scheduledAppointmentsLbl2.bottomAnchor, constant: 0.5).isActive = true
        appointmentsKeptLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        appointmentsKeptLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        appointmentsKeptLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        appointmentsKeptTextField3.leftAnchor.constraint(equalTo: categoryDivider12.leftAnchor, constant: 0).isActive = true
        appointmentsKeptTextField3.centerYAnchor.constraint(equalTo: appointmentsKeptLbl2.centerYAnchor).isActive = true
        appointmentsKeptTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        appointmentsKeptTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        appointmentsKeptTextField4.leftAnchor.constraint(equalTo: appointmentsKeptTextField3.rightAnchor, constant: 0.5).isActive = true
        appointmentsKeptTextField4.centerYAnchor.constraint(equalTo: appointmentsKeptLbl2.centerYAnchor).isActive = true
        appointmentsKeptTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        appointmentsKeptTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
    
        percentAppointmentsKeptLbl2.centerXAnchor.constraint(equalTo: appointmentsKeptLbl2.centerXAnchor).isActive = true
        percentAppointmentsKeptLbl2.topAnchor.constraint(equalTo: appointmentsKeptTextField4.bottomAnchor, constant: 0.5).isActive = true
        percentAppointmentsKeptLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        percentAppointmentsKeptLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        percentAppointmentsKeptLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        percentAppointmentsKeptTextField3.leftAnchor.constraint(equalTo: categoryDivider12.leftAnchor, constant: 0).isActive = true
        percentAppointmentsKeptTextField3.centerYAnchor.constraint(equalTo: percentAppointmentsKeptLbl2.centerYAnchor).isActive = true
        percentAppointmentsKeptTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        percentAppointmentsKeptTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentAppointmentsKeptTextField4.leftAnchor.constraint(equalTo: percentAppointmentsKeptTextField3.rightAnchor, constant: 0.5).isActive = true
        percentAppointmentsKeptTextField4.centerYAnchor.constraint(equalTo: percentAppointmentsKeptLbl2.centerYAnchor).isActive = true
        percentAppointmentsKeptTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        percentAppointmentsKeptTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        retentionRateLbl2.centerXAnchor.constraint(equalTo: percentAppointmentsKeptLbl2.centerXAnchor).isActive = true
        retentionRateLbl2.topAnchor.constraint(equalTo: percentAppointmentsKeptLbl2.bottomAnchor, constant: 0.5).isActive = true
        retentionRateLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        retentionRateLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        retentionRateLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        retentionRateTextField3.leftAnchor.constraint(equalTo: categoryDivider12.leftAnchor, constant: 0).isActive = true
        retentionRateTextField3.centerYAnchor.constraint(equalTo: retentionRateLbl2.centerYAnchor).isActive = true
        retentionRateTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        retentionRateTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        retentionRateTextField4.leftAnchor.constraint(equalTo: retentionRateTextField3.rightAnchor, constant: 0.5).isActive = true
        retentionRateTextField4.centerYAnchor.constraint(equalTo: retentionRateLbl2.centerYAnchor).isActive = true
        retentionRateTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        retentionRateTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        categoryHighlight7.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        categoryHighlight7.topAnchor.constraint(equalTo: retentionRateLbl2.bottomAnchor, constant: 10).isActive = true
        categoryHighlight7.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        categoryHighlight7.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.1).isActive = true
        
        categoryDivider13.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        categoryDivider13.topAnchor.constraint(equalTo: categoryHighlight7.bottomAnchor, constant: 0).isActive = true
        categoryDivider13.widthAnchor.constraint(equalTo: categoryHighlight7.widthAnchor, multiplier: 1).isActive = true
        categoryDivider13.heightAnchor.constraint(equalTo: categoryHighlight1.heightAnchor, multiplier: 0.1).isActive = true
        
        hygieneLbl.leftAnchor.constraint(equalTo: categoryHighlight7.leftAnchor, constant: 5).isActive = true
        hygieneLbl.centerYAnchor.constraint(equalTo: categoryHighlight7.centerYAnchor).isActive = true
        hygieneLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.038)
        
        categoryDivider14.centerXAnchor.constraint(equalTo: scrollView.leftAnchor, constant: view.frame.width * 0.4).isActive = true
        categoryDivider14.topAnchor.constraint(equalTo: categoryDivider13.bottomAnchor, constant: 0).isActive = true
        categoryDivider14.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.001).isActive = true
        categoryDivider14.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.9).isActive = true
        
        amyLbl.leftAnchor.constraint(equalTo: categoryDivider14.leftAnchor, constant: 5).isActive = true
        amyLbl.centerYAnchor.constraint(equalTo: categoryHighlight7.centerYAnchor).isActive = true
        amyLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.038)
        
        goalLbl3.leftAnchor.constraint(equalTo: categoryHighlight7.leftAnchor, constant: 0).isActive = true
        goalLbl3.topAnchor.constraint(equalTo: categoryDivider13.bottomAnchor, constant: 0).isActive = true
        goalLbl3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        goalLbl3.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        goalLbl3.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        goalTextField5.leftAnchor.constraint(equalTo: categoryDivider14.leftAnchor, constant: 0).isActive = true
        goalTextField5.centerYAnchor.constraint(equalTo: goalLbl3.centerYAnchor).isActive = true
        goalTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        goalTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        goalTextField6.leftAnchor.constraint(equalTo: goalTextField5.rightAnchor, constant: 0.5).isActive = true
        goalTextField6.centerYAnchor.constraint(equalTo: goalLbl3.centerYAnchor).isActive = true
        goalTextField6.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        goalTextField6.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        aubreyLbl.leftAnchor.constraint(equalTo: goalTextField6.leftAnchor, constant: 1).isActive = true
        aubreyLbl.centerYAnchor.constraint(equalTo: categoryHighlight7.centerYAnchor).isActive = true
        aubreyLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.038)
        
        netProductionLbl3.centerXAnchor.constraint(equalTo: goalLbl3.centerXAnchor).isActive = true
        netProductionLbl3.topAnchor.constraint(equalTo: goalLbl3.bottomAnchor, constant: 0.5).isActive = true
        netProductionLbl3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        netProductionLbl3.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        netProductionLbl3.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        netProductionTextField7.leftAnchor.constraint(equalTo: categoryDivider14.leftAnchor, constant: 0).isActive = true
        netProductionTextField7.centerYAnchor.constraint(equalTo:netProductionLbl3.centerYAnchor).isActive = true
        netProductionTextField7.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        netProductionTextField7.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        netProductionTextField8.leftAnchor.constraint(equalTo: netProductionTextField7.rightAnchor, constant: 0.5).isActive = true
        netProductionTextField8.centerYAnchor.constraint(equalTo: netProductionLbl3.centerYAnchor).isActive = true
        netProductionTextField8.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        netProductionTextField8.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        daysWorkedLbl3.centerXAnchor.constraint(equalTo: netProductionLbl3.centerXAnchor).isActive = true
        daysWorkedLbl3.topAnchor.constraint(equalTo: netProductionLbl3.bottomAnchor, constant: 0.5).isActive = true
        daysWorkedLbl3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        daysWorkedLbl3.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        daysWorkedLbl3.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        daysWorkedTextField5.leftAnchor.constraint(equalTo: categoryDivider14.leftAnchor, constant: 0).isActive = true
        daysWorkedTextField5.centerYAnchor.constraint(equalTo: daysWorkedLbl3.centerYAnchor).isActive = true
        daysWorkedTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        daysWorkedTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        daysWorkedTextField6.leftAnchor.constraint(equalTo: daysWorkedTextField5.rightAnchor, constant: 0.5).isActive = true
        daysWorkedTextField6.centerYAnchor.constraint(equalTo: daysWorkedLbl3.centerYAnchor).isActive = true
        daysWorkedTextField6.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        daysWorkedTextField6.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        productionPerDayLbl3.centerXAnchor.constraint(equalTo: daysWorkedLbl3.centerXAnchor).isActive = true
        productionPerDayLbl3.topAnchor.constraint(equalTo: daysWorkedLbl3.bottomAnchor, constant: 0.5).isActive = true
        productionPerDayLbl3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        productionPerDayLbl3.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        productionPerDayLbl3.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        productionPerDayTextField5.leftAnchor.constraint(equalTo: categoryDivider14.leftAnchor, constant: 0).isActive = true
        productionPerDayTextField5.centerYAnchor.constraint(equalTo: productionPerDayLbl3.centerYAnchor).isActive = true
        productionPerDayTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        productionPerDayTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        productionPerDayTextField6.leftAnchor.constraint(equalTo: productionPerDayTextField5.rightAnchor, constant: 0.5).isActive = true
        productionPerDayTextField6.centerYAnchor.constraint(equalTo: productionPerDayLbl3.centerYAnchor).isActive = true
        productionPerDayTextField6.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        productionPerDayTextField6.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        numberOfHoursWorkedLbl.centerXAnchor.constraint(equalTo: productionPerDayLbl3.centerXAnchor).isActive = true
        numberOfHoursWorkedLbl.topAnchor.constraint(equalTo: productionPerDayLbl3.bottomAnchor, constant: 0.5).isActive = true
        numberOfHoursWorkedLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        numberOfHoursWorkedLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        numberOfHoursWorkedLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        numberOfHoursWorkedTextField1.leftAnchor.constraint(equalTo: categoryDivider14.leftAnchor, constant: 0).isActive = true
        numberOfHoursWorkedTextField1.centerYAnchor.constraint(equalTo: numberOfHoursWorkedLbl.centerYAnchor).isActive = true
        numberOfHoursWorkedTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        numberOfHoursWorkedTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        numberOfHoursWorkedTextField2.leftAnchor.constraint(equalTo: numberOfHoursWorkedTextField1.rightAnchor, constant: 0.5).isActive = true
        numberOfHoursWorkedTextField2.centerYAnchor.constraint(equalTo: numberOfHoursWorkedLbl.centerYAnchor).isActive = true
        numberOfHoursWorkedTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        numberOfHoursWorkedTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        productionPerHourLbl3.centerXAnchor.constraint(equalTo: numberOfHoursWorkedLbl.centerXAnchor).isActive = true
        productionPerHourLbl3.topAnchor.constraint(equalTo: numberOfHoursWorkedLbl.bottomAnchor, constant: 0.5).isActive = true
        productionPerHourLbl3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        productionPerHourLbl3.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        productionPerHourLbl3.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        productionPerHourTextField5.leftAnchor.constraint(equalTo: categoryDivider14.leftAnchor, constant: 0).isActive = true
        productionPerHourTextField5.centerYAnchor.constraint(equalTo: productionPerHourLbl3.centerYAnchor).isActive = true
        productionPerHourTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        productionPerHourTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        productionPerHourTextField6.leftAnchor.constraint(equalTo: netProductionTextField5.rightAnchor, constant: 0.5).isActive = true
        productionPerHourTextField6.centerYAnchor.constraint(equalTo: productionPerHourLbl3.centerYAnchor).isActive = true
        productionPerHourTextField6.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        productionPerHourTextField6.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        scheduledAppointmentsLbl3.centerXAnchor.constraint(equalTo: productionPerHourLbl3.centerXAnchor).isActive = true
        scheduledAppointmentsLbl3.topAnchor.constraint(equalTo: productionPerHourLbl3.bottomAnchor, constant: 0.5).isActive = true
        scheduledAppointmentsLbl3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        scheduledAppointmentsLbl3.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        scheduledAppointmentsLbl3.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        scheduledAppointmentsTextField5.leftAnchor.constraint(equalTo: categoryDivider14.leftAnchor, constant: 0).isActive = true
        scheduledAppointmentsTextField5.centerYAnchor.constraint(equalTo: scheduledAppointmentsLbl3.centerYAnchor).isActive = true
        scheduledAppointmentsTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        scheduledAppointmentsTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        scheduledAppointmentsTextField6.leftAnchor.constraint(equalTo: scheduledAppointmentsTextField5.rightAnchor, constant: 0.5).isActive = true
        scheduledAppointmentsTextField6.centerYAnchor.constraint(equalTo: scheduledAppointmentsLbl3.centerYAnchor).isActive = true
        scheduledAppointmentsTextField6.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        scheduledAppointmentsTextField6.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        appointmentsKeptLbl3.centerXAnchor.constraint(equalTo: scheduledAppointmentsLbl3.centerXAnchor).isActive = true
        appointmentsKeptLbl3.topAnchor.constraint(equalTo: scheduledAppointmentsLbl3.bottomAnchor, constant: 0.5).isActive = true
        appointmentsKeptLbl3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        appointmentsKeptLbl3.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        appointmentsKeptLbl3.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        appointmentsKeptTextField5.leftAnchor.constraint(equalTo: categoryDivider14.leftAnchor, constant: 0).isActive = true
        appointmentsKeptTextField5.centerYAnchor.constraint(equalTo: appointmentsKeptLbl3.centerYAnchor).isActive = true
        appointmentsKeptTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        appointmentsKeptTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        appointmentsKeptTextField6.leftAnchor.constraint(equalTo: appointmentsKeptTextField5.rightAnchor, constant: 0.5).isActive = true
        appointmentsKeptTextField6.centerYAnchor.constraint(equalTo: appointmentsKeptLbl3.centerYAnchor).isActive = true
        appointmentsKeptTextField6.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        appointmentsKeptTextField6.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentAppointmentsKeptLbl3.centerXAnchor.constraint(equalTo: appointmentsKeptLbl3.centerXAnchor).isActive = true
        percentAppointmentsKeptLbl3.topAnchor.constraint(equalTo: appointmentsKeptLbl3.bottomAnchor, constant: 0.5).isActive = true
        percentAppointmentsKeptLbl3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        percentAppointmentsKeptLbl3.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        percentAppointmentsKeptLbl3.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        percentAppointmentsKeptTextField5.leftAnchor.constraint(equalTo: categoryDivider14.leftAnchor, constant: 0).isActive = true
        percentAppointmentsKeptTextField5.centerYAnchor.constraint(equalTo: percentAppointmentsKeptLbl3.centerYAnchor).isActive = true
        percentAppointmentsKeptTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        percentAppointmentsKeptTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentAppointmentsKeptTextField6.leftAnchor.constraint(equalTo: percentAppointmentsKeptTextField5.rightAnchor, constant: 0.5).isActive = true
        percentAppointmentsKeptTextField6.centerYAnchor.constraint(equalTo: percentAppointmentsKeptLbl3.centerYAnchor).isActive = true
        percentAppointmentsKeptTextField6.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        percentAppointmentsKeptTextField6.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        perioPercentLbl.centerXAnchor.constraint(equalTo: percentAppointmentsKeptLbl3.centerXAnchor).isActive = true
        perioPercentLbl.topAnchor.constraint(equalTo: percentAppointmentsKeptLbl3.bottomAnchor, constant: 0.5).isActive = true
        perioPercentLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        perioPercentLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        perioPercentLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        perioPercentTextField1.leftAnchor.constraint(equalTo: categoryDivider14.leftAnchor, constant: 0).isActive = true
        perioPercentTextField1.centerYAnchor.constraint(equalTo: perioPercentLbl.centerYAnchor).isActive = true
        perioPercentTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        perioPercentTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        perioPercentTextField2.leftAnchor.constraint(equalTo: perioPercentTextField1.rightAnchor, constant: 0.5).isActive = true
        perioPercentTextField2.centerYAnchor.constraint(equalTo: perioPercentLbl.centerYAnchor).isActive = true
        perioPercentTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        perioPercentTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        fluoridePresentedLbl.centerXAnchor.constraint(equalTo: perioPercentLbl.centerXAnchor).isActive = true
        fluoridePresentedLbl.topAnchor.constraint(equalTo: perioPercentLbl.bottomAnchor, constant: 0.5).isActive = true
        fluoridePresentedLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        fluoridePresentedLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        fluoridePresentedLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        fluoridePresentedTextField1.leftAnchor.constraint(equalTo: categoryDivider14.leftAnchor, constant: 0).isActive = true
        fluoridePresentedTextField1.centerYAnchor.constraint(equalTo: fluoridePresentedLbl.centerYAnchor).isActive = true
        fluoridePresentedTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        fluoridePresentedTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        fluoridePresentedTextField2.leftAnchor.constraint(equalTo: fluoridePresentedTextField1.rightAnchor, constant: 0.5).isActive = true
        fluoridePresentedTextField2.centerYAnchor.constraint(equalTo: fluoridePresentedLbl.centerYAnchor).isActive = true
        fluoridePresentedTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        fluoridePresentedTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        fluorideAcceptedLbl.centerXAnchor.constraint(equalTo: fluoridePresentedLbl.centerXAnchor).isActive = true
        fluorideAcceptedLbl.topAnchor.constraint(equalTo: fluoridePresentedLbl.bottomAnchor, constant: 0.5).isActive = true
        fluorideAcceptedLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        fluorideAcceptedLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        fluorideAcceptedLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        fluorideAcceptedTextField1.leftAnchor.constraint(equalTo: categoryDivider14.leftAnchor, constant: 0).isActive = true
        fluorideAcceptedTextField1.centerYAnchor.constraint(equalTo: fluorideAcceptedLbl.centerYAnchor).isActive = true
        fluorideAcceptedTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        fluorideAcceptedTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        fluorideAcceptedTextField2.leftAnchor.constraint(equalTo: fluorideAcceptedTextField1.rightAnchor, constant: 0.5).isActive = true
        fluorideAcceptedTextField2.centerYAnchor.constraint(equalTo: fluorideAcceptedLbl.centerYAnchor).isActive = true
        fluorideAcceptedTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        fluorideAcceptedTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        fluoridePercentLbl.centerXAnchor.constraint(equalTo: fluorideAcceptedLbl.centerXAnchor).isActive = true
        fluoridePercentLbl.topAnchor.constraint(equalTo: fluorideAcceptedLbl.bottomAnchor, constant: 0.5).isActive = true
        fluoridePercentLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        fluoridePercentLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        fluoridePercentLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        fluoridePercentTextField1.leftAnchor.constraint(equalTo: categoryDivider14.leftAnchor, constant: 0).isActive = true
        fluoridePercentTextField1.centerYAnchor.constraint(equalTo: fluoridePercentLbl.centerYAnchor).isActive = true
        fluoridePercentTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        fluoridePercentTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        fluoridePercentTextField2.leftAnchor.constraint(equalTo: fluoridePercentTextField1.rightAnchor, constant: 0.5).isActive = true
        fluoridePercentTextField2.centerYAnchor.constraint(equalTo: fluoridePercentLbl.centerYAnchor).isActive = true
        fluoridePercentTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        fluoridePercentTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        oralIDPresentedLbl.centerXAnchor.constraint(equalTo: fluoridePercentLbl.centerXAnchor).isActive = true
        oralIDPresentedLbl.topAnchor.constraint(equalTo: fluoridePercentLbl.bottomAnchor, constant: 0.5).isActive = true
        oralIDPresentedLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        oralIDPresentedLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        oralIDPresentedLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        oralIDPresentedTextField1.leftAnchor.constraint(equalTo: categoryDivider14.leftAnchor, constant: 0).isActive = true
        oralIDPresentedTextField1.centerYAnchor.constraint(equalTo: oralIDPresentedLbl.centerYAnchor).isActive = true
        oralIDPresentedTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        oralIDPresentedTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        oralIDPresentedTextField2.leftAnchor.constraint(equalTo: oralIDPresentedTextField1.rightAnchor, constant: 0.5).isActive = true
        oralIDPresentedTextField2.centerYAnchor.constraint(equalTo: oralIDPresentedLbl.centerYAnchor).isActive = true
        oralIDPresentedTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        oralIDPresentedTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        oralIDAcceptedLbl.centerXAnchor.constraint(equalTo: oralIDPresentedLbl.centerXAnchor).isActive = true
        oralIDAcceptedLbl.topAnchor.constraint(equalTo: oralIDPresentedLbl.bottomAnchor, constant: 0.5).isActive = true
        oralIDAcceptedLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        oralIDAcceptedLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        oralIDAcceptedLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        oralIDAcceptedTextField1.leftAnchor.constraint(equalTo: categoryDivider14.leftAnchor, constant: 0).isActive = true
        oralIDAcceptedTextField1.centerYAnchor.constraint(equalTo: oralIDAcceptedLbl.centerYAnchor).isActive = true
        oralIDAcceptedTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        oralIDAcceptedTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        oralIDAcceptedTextField2.leftAnchor.constraint(equalTo: oralIDAcceptedTextField1.rightAnchor, constant: 0.5).isActive = true
        oralIDAcceptedTextField2.centerYAnchor.constraint(equalTo: oralIDAcceptedLbl.centerYAnchor).isActive = true
        oralIDAcceptedTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        oralIDAcceptedTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        oralIdPercentLbl.centerXAnchor.constraint(equalTo: oralIDAcceptedLbl.centerXAnchor).isActive = true
        oralIdPercentLbl.topAnchor.constraint(equalTo: oralIDAcceptedLbl.bottomAnchor, constant: 0.5).isActive = true
        oralIdPercentLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        oralIdPercentLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        oralIdPercentLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        oralIdPercentTextField1.leftAnchor.constraint(equalTo: categoryDivider14.leftAnchor, constant: 0).isActive = true
        oralIdPercentTextField1.centerYAnchor.constraint(equalTo: oralIdPercentLbl.centerYAnchor).isActive = true
        oralIdPercentTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        oralIdPercentTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        oralIdPercentTextField2.leftAnchor.constraint(equalTo: oralIdPercentTextField1.rightAnchor, constant: 0.5).isActive = true
        oralIdPercentTextField2.centerYAnchor.constraint(equalTo: oralIdPercentLbl.centerYAnchor).isActive = true
        oralIdPercentTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        oralIdPercentTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        arestinPresentedLbl.centerXAnchor.constraint(equalTo: oralIdPercentLbl.centerXAnchor).isActive = true
        arestinPresentedLbl.topAnchor.constraint(equalTo: oralIdPercentLbl.bottomAnchor, constant: 0.5).isActive = true
        arestinPresentedLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        arestinPresentedLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        arestinPresentedLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        arestinPresentedTextField1.leftAnchor.constraint(equalTo: categoryDivider14.leftAnchor, constant: 0).isActive = true
        arestinPresentedTextField1.centerYAnchor.constraint(equalTo: arestinPresentedLbl.centerYAnchor).isActive = true
        arestinPresentedTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        arestinPresentedTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        arestinPresentedTextField2.leftAnchor.constraint(equalTo: arestinPresentedTextField1.rightAnchor, constant: 0.5).isActive = true
        arestinPresentedTextField2.centerYAnchor.constraint(equalTo: arestinPresentedLbl.centerYAnchor).isActive = true
        arestinPresentedTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        arestinPresentedTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        arestinAcceptedLbl.centerXAnchor.constraint(equalTo: arestinPresentedLbl.centerXAnchor).isActive = true
        arestinAcceptedLbl.topAnchor.constraint(equalTo: arestinPresentedLbl.bottomAnchor, constant: 0.5).isActive = true
        arestinAcceptedLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        arestinAcceptedLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        arestinAcceptedLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        arestinAcceptedTextField1.leftAnchor.constraint(equalTo: categoryDivider14.leftAnchor, constant: 0).isActive = true
        arestinAcceptedTextField1.centerYAnchor.constraint(equalTo: arestinAcceptedLbl.centerYAnchor).isActive = true
        arestinAcceptedTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        arestinAcceptedTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        arestinAcceptedTextField2.leftAnchor.constraint(equalTo: arestinAcceptedTextField1.rightAnchor, constant: 0.5).isActive = true
        arestinAcceptedTextField2.centerYAnchor.constraint(equalTo: arestinAcceptedLbl.centerYAnchor).isActive = true
        arestinAcceptedTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        arestinAcceptedTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        arestinPercentLbl.centerXAnchor.constraint(equalTo: arestinAcceptedLbl.centerXAnchor).isActive = true
        arestinPercentLbl.topAnchor.constraint(equalTo: arestinAcceptedLbl.bottomAnchor, constant: 0.5).isActive = true
        arestinPercentLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        arestinPercentLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        arestinPercentLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        arestinPercentTextField1.leftAnchor.constraint(equalTo: categoryDivider14.leftAnchor, constant: 0).isActive = true
        arestinPercentTextField1.centerYAnchor.constraint(equalTo: arestinPercentLbl.centerYAnchor).isActive = true
        arestinPercentTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        arestinPercentTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        arestinPercentTextField2.leftAnchor.constraint(equalTo: arestinPercentTextField1.rightAnchor, constant: 0.5).isActive = true
        arestinPercentTextField2.centerYAnchor.constraint(equalTo: arestinPercentLbl.centerYAnchor).isActive = true
        arestinPercentTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        arestinPercentTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        appointmentsSeenLbl.centerXAnchor.constraint(equalTo: arestinPercentLbl.centerXAnchor).isActive = true
        appointmentsSeenLbl.topAnchor.constraint(equalTo: arestinPercentLbl.bottomAnchor, constant: 0.5).isActive = true
        appointmentsSeenLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        appointmentsSeenLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        appointmentsSeenLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        appointmentsSeenTextField1.leftAnchor.constraint(equalTo: categoryDivider14.leftAnchor, constant: 0).isActive = true
        appointmentsSeenTextField1.centerYAnchor.constraint(equalTo: appointmentsSeenLbl.centerYAnchor).isActive = true
        appointmentsSeenTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        appointmentsSeenTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        appointmentsSeenTextField2.leftAnchor.constraint(equalTo: appointmentsSeenTextField1.rightAnchor, constant: 0.5).isActive = true
        appointmentsSeenTextField2.centerYAnchor.constraint(equalTo: appointmentsSeenLbl.centerYAnchor).isActive = true
        appointmentsSeenTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        appointmentsSeenTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        reappointmentsLbl.centerXAnchor.constraint(equalTo: appointmentsSeenLbl.centerXAnchor).isActive = true
        reappointmentsLbl.topAnchor.constraint(equalTo: appointmentsSeenLbl.bottomAnchor, constant: 0.5).isActive = true
        reappointmentsLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        reappointmentsLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        reappointmentsLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        reappointmentsTextField1.leftAnchor.constraint(equalTo: categoryDivider14.leftAnchor, constant: 0).isActive = true
        reappointmentsTextField1.centerYAnchor.constraint(equalTo: reappointmentsLbl.centerYAnchor).isActive = true
        reappointmentsTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        reappointmentsTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        reappointmentsTextField2.leftAnchor.constraint(equalTo: reappointmentsTextField1.rightAnchor, constant: 0.5).isActive = true
        reappointmentsTextField2.centerYAnchor.constraint(equalTo: reappointmentsLbl.centerYAnchor).isActive = true
        reappointmentsTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        reappointmentsTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        reappointmentRateLbl.centerXAnchor.constraint(equalTo: reappointmentsLbl.centerXAnchor).isActive = true
        reappointmentRateLbl.topAnchor.constraint(equalTo: reappointmentsLbl.bottomAnchor, constant: 0.5).isActive = true
        reappointmentRateLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        reappointmentRateLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        reappointmentRateLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        reappointmentRateTextField1.leftAnchor.constraint(equalTo: categoryDivider14.leftAnchor, constant: 0).isActive = true
        reappointmentRateTextField1.centerYAnchor.constraint(equalTo: reappointmentRateLbl.centerYAnchor).isActive = true
        reappointmentRateTextField1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        reappointmentRateTextField1.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        reappointmentRateTextField2.leftAnchor.constraint(equalTo: reappointmentRateTextField1.rightAnchor, constant: 0.5).isActive = true
        reappointmentRateTextField2.centerYAnchor.constraint(equalTo: reappointmentRateLbl.centerYAnchor).isActive = true
        reappointmentRateTextField2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        reappointmentRateTextField2.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        retentionRateLbl3.centerXAnchor.constraint(equalTo: reappointmentRateLbl.centerXAnchor).isActive = true
        retentionRateLbl3.topAnchor.constraint(equalTo: reappointmentRateLbl.bottomAnchor, constant: 0.5).isActive = true
        retentionRateLbl3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        retentionRateLbl3.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        retentionRateLbl3.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        retentionRateTextField5.leftAnchor.constraint(equalTo: categoryDivider14.leftAnchor, constant: 0).isActive = true
        retentionRateTextField5.centerYAnchor.constraint(equalTo: retentionRateLbl3.centerYAnchor).isActive = true
        retentionRateTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        retentionRateTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        retentionRateTextField6.leftAnchor.constraint(equalTo: retentionRateTextField5.rightAnchor, constant: 0.5).isActive = true
        retentionRateTextField6.centerYAnchor.constraint(equalTo: retentionRateLbl3.centerYAnchor).isActive = true
        retentionRateTextField6.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        retentionRateTextField6.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        categoryHighlight8.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        categoryHighlight8.topAnchor.constraint(equalTo: retentionRateLbl3.bottomAnchor, constant: 10).isActive = true
        categoryHighlight8.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        categoryHighlight8.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.1).isActive = true
        
        categoryDivider15.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        categoryDivider15.topAnchor.constraint(equalTo: categoryHighlight8.bottomAnchor, constant: 0).isActive = true
        categoryDivider15.widthAnchor.constraint(equalTo: categoryHighlight7.widthAnchor, multiplier: 1).isActive = true
        categoryDivider15.heightAnchor.constraint(equalTo: categoryHighlight1.heightAnchor, multiplier: 0.1).isActive = true
        
        hygieneLbl2.leftAnchor.constraint(equalTo: categoryHighlight8.leftAnchor, constant: 5).isActive = true
        hygieneLbl2.centerYAnchor.constraint(equalTo: categoryHighlight8.centerYAnchor).isActive = true
        hygieneLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.038)
        
        dawnLbl.leftAnchor.constraint(equalTo: categoryDivider16.leftAnchor, constant: 5).isActive = true
        dawnLbl.centerYAnchor.constraint(equalTo: categoryHighlight8.centerYAnchor).isActive = true
        dawnLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.038)
        
        goalLbl4.leftAnchor.constraint(equalTo: categoryHighlight8.leftAnchor, constant: 0).isActive = true
        goalLbl4.topAnchor.constraint(equalTo: categoryDivider15.bottomAnchor, constant: 0).isActive = true
        goalLbl4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.27).isActive = true
        goalLbl4.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        goalLbl4.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        categoryDivider16.centerXAnchor.constraint(equalTo: goalLbl4.rightAnchor, constant: 0).isActive = true
        categoryDivider16.topAnchor.constraint(equalTo: categoryDivider15.bottomAnchor, constant: 0).isActive = true
        categoryDivider16.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.001).isActive = true
        categoryDivider16.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 1.75).isActive = true
        
        goalTextField7.leftAnchor.constraint(equalTo: categoryDivider16.leftAnchor, constant: 0).isActive = true
        goalTextField7.centerYAnchor.constraint(equalTo: goalLbl4.centerYAnchor).isActive = true
        goalTextField7.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        goalTextField7.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        goalTextField8.leftAnchor.constraint(equalTo: goalTextField7.rightAnchor, constant: 0.5).isActive = true
        goalTextField8.centerYAnchor.constraint(equalTo: goalLbl4.centerYAnchor).isActive = true
        goalTextField8.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        goalTextField8.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        sheilaLbl.leftAnchor.constraint(equalTo: goalTextField8.leftAnchor, constant: 1).isActive = true
        sheilaLbl.centerYAnchor.constraint(equalTo: categoryHighlight8.centerYAnchor).isActive = true
        sheilaLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.038)
        
        netProductionLbl4.centerXAnchor.constraint(equalTo: goalLbl4.centerXAnchor).isActive = true
        netProductionLbl4.topAnchor.constraint(equalTo: goalLbl4.bottomAnchor, constant: 0.5).isActive = true
        netProductionLbl4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.27).isActive = true
        netProductionLbl4.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        netProductionLbl4.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        netProductionTextField9.leftAnchor.constraint(equalTo: categoryDivider16.leftAnchor, constant: 0).isActive = true
        netProductionTextField9.centerYAnchor.constraint(equalTo: netProductionLbl4.centerYAnchor).isActive = true
        netProductionTextField9.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        netProductionTextField9.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        netProductionTextField10.leftAnchor.constraint(equalTo: netProductionTextField9.rightAnchor, constant: 0.5).isActive = true
        netProductionTextField10.centerYAnchor.constraint(equalTo: netProductionLbl4.centerYAnchor).isActive = true
        netProductionTextField10.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        netProductionTextField10.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        daysWorkedLbl4.centerXAnchor.constraint(equalTo: netProductionLbl4.centerXAnchor).isActive = true
        daysWorkedLbl4.topAnchor.constraint(equalTo: netProductionLbl4.bottomAnchor, constant: 0.5).isActive = true
        daysWorkedLbl4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.27).isActive = true
        daysWorkedLbl4.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        daysWorkedLbl4.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        daysWorkedTextField7.leftAnchor.constraint(equalTo: categoryDivider16.leftAnchor, constant: 0).isActive = true
        daysWorkedTextField7.centerYAnchor.constraint(equalTo: daysWorkedLbl4.centerYAnchor).isActive = true
        daysWorkedTextField7.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        daysWorkedTextField7.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        daysWorkedTextField8.leftAnchor.constraint(equalTo: daysWorkedTextField7.rightAnchor, constant: 0.5).isActive = true
        daysWorkedTextField8.centerYAnchor.constraint(equalTo: daysWorkedLbl4.centerYAnchor).isActive = true
        daysWorkedTextField8.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        daysWorkedTextField8.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        productionPerDayLbl4.centerXAnchor.constraint(equalTo: daysWorkedLbl4.centerXAnchor).isActive = true
        productionPerDayLbl4.topAnchor.constraint(equalTo: daysWorkedLbl4.bottomAnchor, constant: 0.5).isActive = true
        productionPerDayLbl4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.27).isActive = true
        productionPerDayLbl4.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        productionPerDayLbl4.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        productionPerDayTextField7.leftAnchor.constraint(equalTo: categoryDivider16.leftAnchor, constant: 0).isActive = true
        productionPerDayTextField7.centerYAnchor.constraint(equalTo: productionPerDayLbl4.centerYAnchor).isActive = true
        productionPerDayTextField7.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        productionPerDayTextField7.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        productionPerDayTextField8.leftAnchor.constraint(equalTo: productionPerDayTextField7.rightAnchor, constant: 0.5).isActive = true
        productionPerDayTextField8.centerYAnchor.constraint(equalTo: productionPerDayLbl4.centerYAnchor).isActive = true
        productionPerDayTextField8.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        productionPerDayTextField8.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        numberOfHoursWorkedLbl2.centerXAnchor.constraint(equalTo: productionPerDayLbl4.centerXAnchor).isActive = true
        numberOfHoursWorkedLbl2.topAnchor.constraint(equalTo: productionPerDayLbl4.bottomAnchor, constant: 0.5).isActive = true
        numberOfHoursWorkedLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.27).isActive = true
        numberOfHoursWorkedLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        numberOfHoursWorkedLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        numberOfHoursWorkedTextField3.leftAnchor.constraint(equalTo: categoryDivider16.leftAnchor, constant: 0).isActive = true
        numberOfHoursWorkedTextField3.centerYAnchor.constraint(equalTo: numberOfHoursWorkedLbl2.centerYAnchor).isActive = true
        numberOfHoursWorkedTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        numberOfHoursWorkedTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        numberOfHoursWorkedTextField4.leftAnchor.constraint(equalTo: numberOfHoursWorkedTextField3.rightAnchor, constant: 0.5).isActive = true
        numberOfHoursWorkedTextField4.centerYAnchor.constraint(equalTo: numberOfHoursWorkedLbl2.centerYAnchor).isActive = true
        numberOfHoursWorkedTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        numberOfHoursWorkedTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        productionPerHourLbl4.centerXAnchor.constraint(equalTo: numberOfHoursWorkedLbl2.centerXAnchor).isActive = true
        productionPerHourLbl4.topAnchor.constraint(equalTo: numberOfHoursWorkedLbl2.bottomAnchor, constant: 0.5).isActive = true
        productionPerHourLbl4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.27).isActive = true
        productionPerHourLbl4.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        productionPerHourLbl4.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        productionPerHourTextField7.leftAnchor.constraint(equalTo: categoryDivider16.leftAnchor, constant: 0).isActive = true
        productionPerHourTextField7.centerYAnchor.constraint(equalTo: productionPerHourLbl4.centerYAnchor).isActive = true
        productionPerHourTextField7.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        productionPerHourTextField7.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        productionPerHourTextField8.leftAnchor.constraint(equalTo: productionPerHourTextField7.rightAnchor, constant: 0.5).isActive = true
        productionPerHourTextField8.centerYAnchor.constraint(equalTo: productionPerHourLbl4.centerYAnchor).isActive = true
        productionPerHourTextField8.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        productionPerHourTextField8.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        scheduledAppointmentsLbl4.centerXAnchor.constraint(equalTo: productionPerHourLbl4.centerXAnchor).isActive = true
        scheduledAppointmentsLbl4.topAnchor.constraint(equalTo: productionPerHourLbl4.bottomAnchor, constant: 0.5).isActive = true
        scheduledAppointmentsLbl4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.27).isActive = true
        scheduledAppointmentsLbl4.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        scheduledAppointmentsLbl4.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        scheduledAppointmentsTextField7.leftAnchor.constraint(equalTo: categoryDivider16.leftAnchor, constant: 0).isActive = true
        scheduledAppointmentsTextField7.centerYAnchor.constraint(equalTo: scheduledAppointmentsLbl4.centerYAnchor).isActive = true
        scheduledAppointmentsTextField7.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        scheduledAppointmentsTextField7.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        scheduledAppointmentsTextField8.leftAnchor.constraint(equalTo: scheduledAppointmentsTextField7.rightAnchor, constant: 0.5).isActive = true
        scheduledAppointmentsTextField8.centerYAnchor.constraint(equalTo: scheduledAppointmentsLbl4.centerYAnchor).isActive = true
        scheduledAppointmentsTextField8.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        scheduledAppointmentsTextField8.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        scheduledAppointmentsTextField9.leftAnchor.constraint(equalTo: categoryDivider17.rightAnchor, constant: 0).isActive = true
        scheduledAppointmentsTextField9.centerYAnchor.constraint(equalTo: scheduledAppointmentsLbl4.centerYAnchor).isActive = true
        scheduledAppointmentsTextField9.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.22).isActive = true
        scheduledAppointmentsTextField9.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        appointmentsKeptLbl4.centerXAnchor.constraint(equalTo: scheduledAppointmentsLbl4.centerXAnchor).isActive = true
        appointmentsKeptLbl4.topAnchor.constraint(equalTo: scheduledAppointmentsLbl4.bottomAnchor, constant: 0.5).isActive = true
        appointmentsKeptLbl4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.27).isActive = true
        appointmentsKeptLbl4.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        appointmentsKeptLbl4.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        appointmentsKeptTextField7.leftAnchor.constraint(equalTo: categoryDivider16.leftAnchor, constant: 0).isActive = true
        appointmentsKeptTextField7.centerYAnchor.constraint(equalTo: appointmentsKeptLbl4.centerYAnchor).isActive = true
        appointmentsKeptTextField7.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        appointmentsKeptTextField7.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        appointmentsKeptTextField8.leftAnchor.constraint(equalTo: appointmentsKeptTextField7.rightAnchor, constant: 0.5).isActive = true
        appointmentsKeptTextField8.centerYAnchor.constraint(equalTo: appointmentsKeptLbl4.centerYAnchor).isActive = true
        appointmentsKeptTextField8.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        appointmentsKeptTextField8.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        appointmentsKeptTextField9.leftAnchor.constraint(equalTo: categoryDivider17.rightAnchor, constant: 0).isActive = true
        appointmentsKeptTextField9.centerYAnchor.constraint(equalTo: appointmentsKeptLbl4.centerYAnchor).isActive = true
        appointmentsKeptTextField9.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.22).isActive = true
        appointmentsKeptTextField9.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentAppointmentsKeptLbl4.centerXAnchor.constraint(equalTo: appointmentsKeptLbl4.centerXAnchor).isActive = true
        percentAppointmentsKeptLbl4.topAnchor.constraint(equalTo: appointmentsKeptLbl4.bottomAnchor, constant: 0.5).isActive = true
        percentAppointmentsKeptLbl4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.27).isActive = true
        percentAppointmentsKeptLbl4.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        percentAppointmentsKeptLbl4.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        percentAppointmentsKeptTextField7.leftAnchor.constraint(equalTo: categoryDivider16.leftAnchor, constant: 0).isActive = true
        percentAppointmentsKeptTextField7.centerYAnchor.constraint(equalTo: percentAppointmentsKeptLbl4.centerYAnchor).isActive = true
        percentAppointmentsKeptTextField7.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        percentAppointmentsKeptTextField7.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentAppointmentsKeptTextField8.leftAnchor.constraint(equalTo: percentAppointmentsKeptTextField7.rightAnchor, constant: 0.5).isActive = true
        percentAppointmentsKeptTextField8.centerYAnchor.constraint(equalTo: percentAppointmentsKeptLbl4.centerYAnchor).isActive = true
        percentAppointmentsKeptTextField8.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        percentAppointmentsKeptTextField8.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        perioPercentLbl2.centerXAnchor.constraint(equalTo: percentAppointmentsKeptLbl4.centerXAnchor).isActive = true
        perioPercentLbl2.topAnchor.constraint(equalTo: percentAppointmentsKeptLbl4.bottomAnchor, constant: 0.5).isActive = true
        perioPercentLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.27).isActive = true
        perioPercentLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        perioPercentLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        perioPercentTextField3.leftAnchor.constraint(equalTo: categoryDivider16.leftAnchor, constant: 0).isActive = true
        perioPercentTextField3.centerYAnchor.constraint(equalTo: perioPercentLbl2.centerYAnchor).isActive = true
        perioPercentTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        perioPercentTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        perioPercentTextField4.leftAnchor.constraint(equalTo: perioPercentTextField3.rightAnchor, constant: 0.5).isActive = true
        perioPercentTextField4.centerYAnchor.constraint(equalTo: perioPercentLbl2.centerYAnchor).isActive = true
        perioPercentTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        perioPercentTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        fluoridePresentedLbl2.centerXAnchor.constraint(equalTo: perioPercentLbl2.centerXAnchor).isActive = true
        fluoridePresentedLbl2.topAnchor.constraint(equalTo: perioPercentLbl2.bottomAnchor, constant: 0.5).isActive = true
        fluoridePresentedLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.27).isActive = true
        fluoridePresentedLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        fluoridePresentedLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        fluoridePresentedTextField3.leftAnchor.constraint(equalTo: categoryDivider16.leftAnchor, constant: 0).isActive = true
        fluoridePresentedTextField3.centerYAnchor.constraint(equalTo: fluoridePresentedLbl2.centerYAnchor).isActive = true
        fluoridePresentedTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        fluoridePresentedTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        fluoridePresentedTextField4.leftAnchor.constraint(equalTo: fluoridePresentedTextField3.rightAnchor, constant: 0.5).isActive = true
        fluoridePresentedTextField4.centerYAnchor.constraint(equalTo: fluoridePresentedLbl2.centerYAnchor).isActive = true
        fluoridePresentedTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        fluoridePresentedTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        fluoridePresentedTextField5.leftAnchor.constraint(equalTo: categoryDivider17.rightAnchor, constant: 0).isActive = true
        fluoridePresentedTextField5.centerYAnchor.constraint(equalTo: fluoridePresentedLbl2.centerYAnchor).isActive = true
        fluoridePresentedTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.22).isActive = true
        fluoridePresentedTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        fluorideAcceptedLbl2.centerXAnchor.constraint(equalTo: fluoridePresentedLbl2.centerXAnchor).isActive = true
        fluorideAcceptedLbl2.topAnchor.constraint(equalTo: fluoridePresentedLbl2.bottomAnchor, constant: 0.5).isActive = true
        fluorideAcceptedLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.27).isActive = true
        fluorideAcceptedLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        fluorideAcceptedLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        fluorideAcceptedTextField3.leftAnchor.constraint(equalTo: categoryDivider16.leftAnchor, constant: 0).isActive = true
        fluorideAcceptedTextField3.centerYAnchor.constraint(equalTo: fluorideAcceptedLbl2.centerYAnchor).isActive = true
        fluorideAcceptedTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        fluorideAcceptedTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        fluorideAcceptedTextField4.leftAnchor.constraint(equalTo: fluorideAcceptedTextField3.rightAnchor, constant: 0.5).isActive = true
        fluorideAcceptedTextField4.centerYAnchor.constraint(equalTo: fluorideAcceptedLbl2.centerYAnchor).isActive = true
        fluorideAcceptedTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        fluorideAcceptedTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        fluorideAcceptedTextField5.leftAnchor.constraint(equalTo: categoryDivider17.rightAnchor, constant: 0).isActive = true
        fluorideAcceptedTextField5.centerYAnchor.constraint(equalTo: fluorideAcceptedLbl2.centerYAnchor).isActive = true
        fluorideAcceptedTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.22).isActive = true
        fluorideAcceptedTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        fluoridePercentLbl2.centerXAnchor.constraint(equalTo: fluorideAcceptedLbl2.centerXAnchor).isActive = true
        fluoridePercentLbl2.topAnchor.constraint(equalTo: fluorideAcceptedLbl2.bottomAnchor, constant: 0.5).isActive = true
        fluoridePercentLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.27).isActive = true
        fluoridePercentLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        fluoridePercentLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        fluoridePercentTextField3.leftAnchor.constraint(equalTo: categoryDivider16.leftAnchor, constant: 0).isActive = true
        fluoridePercentTextField3.centerYAnchor.constraint(equalTo: fluoridePercentLbl2.centerYAnchor).isActive = true
        fluoridePercentTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        fluoridePercentTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        fluoridePercentTextField4.leftAnchor.constraint(equalTo: fluoridePercentTextField3.rightAnchor, constant: 0.5).isActive = true
        fluoridePercentTextField4.centerYAnchor.constraint(equalTo: fluoridePercentLbl2.centerYAnchor).isActive = true
        fluoridePercentTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        fluoridePercentTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        oralIDPresentedLbl2.centerXAnchor.constraint(equalTo: fluoridePercentLbl2.centerXAnchor).isActive = true
        oralIDPresentedLbl2.topAnchor.constraint(equalTo: fluoridePercentLbl2.bottomAnchor, constant: 0.5).isActive = true
        oralIDPresentedLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.27).isActive = true
        oralIDPresentedLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        oralIDPresentedLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        oralIDPresentedTextField3.leftAnchor.constraint(equalTo: categoryDivider16.leftAnchor, constant: 0).isActive = true
        oralIDPresentedTextField3.centerYAnchor.constraint(equalTo: oralIDPresentedLbl2.centerYAnchor).isActive = true
        oralIDPresentedTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        oralIDPresentedTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        oralIDPresentedTextField4.leftAnchor.constraint(equalTo: oralIDPresentedTextField3.rightAnchor, constant: 0.5).isActive = true
        oralIDPresentedTextField4.centerYAnchor.constraint(equalTo: oralIDPresentedLbl2.centerYAnchor).isActive = true
        oralIDPresentedTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        oralIDPresentedTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        oralIDPresentedTextField5.leftAnchor.constraint(equalTo: categoryDivider17.rightAnchor, constant: 0).isActive = true
        oralIDPresentedTextField5.centerYAnchor.constraint(equalTo: oralIDPresentedLbl2.centerYAnchor).isActive = true
        oralIDPresentedTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.22).isActive = true
        oralIDPresentedTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        oralIDAcceptedLbl2.centerXAnchor.constraint(equalTo: oralIDPresentedLbl2.centerXAnchor).isActive = true
        oralIDAcceptedLbl2.topAnchor.constraint(equalTo: oralIDPresentedLbl2.bottomAnchor, constant: 0.5).isActive = true
        oralIDAcceptedLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.27).isActive = true
        oralIDAcceptedLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        oralIDAcceptedLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        oralIDAcceptedTextField3.leftAnchor.constraint(equalTo: categoryDivider16.leftAnchor, constant: 0).isActive = true
        oralIDAcceptedTextField3.centerYAnchor.constraint(equalTo: oralIDAcceptedLbl2.centerYAnchor).isActive = true
        oralIDAcceptedTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        oralIDAcceptedTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        oralIDAcceptedTextField4.leftAnchor.constraint(equalTo: oralIDAcceptedTextField3.rightAnchor, constant: 0.5).isActive = true
        oralIDAcceptedTextField4.centerYAnchor.constraint(equalTo: oralIDAcceptedLbl2.centerYAnchor).isActive = true
        oralIDAcceptedTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        oralIDAcceptedTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        oralIDAcceptedTextField5.leftAnchor.constraint(equalTo: categoryDivider17.rightAnchor, constant: 0).isActive = true
        oralIDAcceptedTextField5.centerYAnchor.constraint(equalTo: oralIDAcceptedLbl2.centerYAnchor).isActive = true
        oralIDAcceptedTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.22).isActive = true
        oralIDAcceptedTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        oralIdPercentLbl2.centerXAnchor.constraint(equalTo: oralIDAcceptedLbl2.centerXAnchor).isActive = true
        oralIdPercentLbl2.topAnchor.constraint(equalTo: oralIDAcceptedLbl2.bottomAnchor, constant: 0.5).isActive = true
        oralIdPercentLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.27).isActive = true
        oralIdPercentLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        oralIdPercentLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        oralIdPercentTextField3.leftAnchor.constraint(equalTo: categoryDivider16.leftAnchor, constant: 0).isActive = true
        oralIdPercentTextField3.centerYAnchor.constraint(equalTo: oralIdPercentLbl2.centerYAnchor).isActive = true
        oralIdPercentTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        oralIdPercentTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        oralIdPercentTextField4.leftAnchor.constraint(equalTo: oralIdPercentTextField3.rightAnchor, constant: 0.5).isActive = true
        oralIdPercentTextField4.centerYAnchor.constraint(equalTo: oralIdPercentLbl2.centerYAnchor).isActive = true
        oralIdPercentTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        oralIdPercentTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        arestinPresentedLbl2.centerXAnchor.constraint(equalTo: oralIdPercentLbl2.centerXAnchor).isActive = true
        arestinPresentedLbl2.topAnchor.constraint(equalTo: oralIdPercentLbl2.bottomAnchor, constant: 0.5).isActive = true
        arestinPresentedLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.27).isActive = true
        arestinPresentedLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        arestinPresentedLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        arestinPresentedTextField3.leftAnchor.constraint(equalTo: categoryDivider16.leftAnchor, constant: 0).isActive = true
        arestinPresentedTextField3.centerYAnchor.constraint(equalTo: arestinPresentedLbl2.centerYAnchor).isActive = true
        arestinPresentedTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        arestinPresentedTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        arestinPresentedTextField4.leftAnchor.constraint(equalTo: arestinPresentedTextField3.rightAnchor, constant: 0.5).isActive = true
        arestinPresentedTextField4.centerYAnchor.constraint(equalTo: arestinPresentedLbl2.centerYAnchor).isActive = true
        arestinPresentedTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        arestinPresentedTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        arestinPresentedTextField5.leftAnchor.constraint(equalTo: categoryDivider17.rightAnchor, constant: 0).isActive = true
        arestinPresentedTextField5.centerYAnchor.constraint(equalTo: arestinPresentedLbl2.centerYAnchor).isActive = true
        arestinPresentedTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.22).isActive = true
        arestinPresentedTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        arestinAcceptedLbl2.centerXAnchor.constraint(equalTo: arestinPresentedLbl2.centerXAnchor).isActive = true
        arestinAcceptedLbl2.topAnchor.constraint(equalTo: arestinPresentedLbl2.bottomAnchor, constant: 0.5).isActive = true
        arestinAcceptedLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.27).isActive = true
        arestinAcceptedLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        arestinAcceptedLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        arestinAcceptedTextField3.leftAnchor.constraint(equalTo: categoryDivider16.leftAnchor, constant: 0).isActive = true
        arestinAcceptedTextField3.centerYAnchor.constraint(equalTo: arestinAcceptedLbl2.centerYAnchor).isActive = true
        arestinAcceptedTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        arestinAcceptedTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        arestinAcceptedTextField4.leftAnchor.constraint(equalTo: arestinAcceptedTextField3.rightAnchor, constant: 0.5).isActive = true
        arestinAcceptedTextField4.centerYAnchor.constraint(equalTo: arestinAcceptedLbl2.centerYAnchor).isActive = true
        arestinAcceptedTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        arestinAcceptedTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        arestinAcceptedTextField5.leftAnchor.constraint(equalTo: categoryDivider17.rightAnchor, constant: 0).isActive = true
        arestinAcceptedTextField5.centerYAnchor.constraint(equalTo: arestinAcceptedLbl2.centerYAnchor).isActive = true
        arestinAcceptedTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.22).isActive = true
        arestinAcceptedTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        arestinPercentLbl2.centerXAnchor.constraint(equalTo: arestinAcceptedLbl2.centerXAnchor).isActive = true
        arestinPercentLbl2.topAnchor.constraint(equalTo: arestinAcceptedLbl2.bottomAnchor, constant: 0.5).isActive = true
        arestinPercentLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.27).isActive = true
        arestinPercentLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        arestinPercentLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        arestinPercentTextField3.leftAnchor.constraint(equalTo: categoryDivider16.leftAnchor, constant: 0).isActive = true
        arestinPercentTextField3.centerYAnchor.constraint(equalTo: arestinPercentLbl2.centerYAnchor).isActive = true
        arestinPercentTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        arestinPercentTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        arestinPercentTextField4.leftAnchor.constraint(equalTo: arestinPercentTextField3.rightAnchor, constant: 0.5).isActive = true
        arestinPercentTextField4.centerYAnchor.constraint(equalTo: arestinPercentLbl2.centerYAnchor).isActive = true
        arestinPercentTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        arestinPercentTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        appointmentsSeenLbl2.centerXAnchor.constraint(equalTo: arestinPercentLbl2.centerXAnchor).isActive = true
        appointmentsSeenLbl2.topAnchor.constraint(equalTo: arestinPercentLbl2.bottomAnchor, constant: 0.5).isActive = true
        appointmentsSeenLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.27).isActive = true
        appointmentsSeenLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        appointmentsSeenLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        appointmentsSeenTextField3.leftAnchor.constraint(equalTo: categoryDivider16.leftAnchor, constant: 0).isActive = true
        appointmentsSeenTextField3.centerYAnchor.constraint(equalTo: appointmentsSeenLbl2.centerYAnchor).isActive = true
        appointmentsSeenTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        appointmentsSeenTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        appointmentsSeenTextField4.leftAnchor.constraint(equalTo: appointmentsSeenTextField3.rightAnchor, constant: 0.5).isActive = true
        appointmentsSeenTextField4.centerYAnchor.constraint(equalTo: appointmentsSeenLbl2.centerYAnchor).isActive = true
        appointmentsSeenTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        appointmentsSeenTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        appointmentsSeenTextField5.leftAnchor.constraint(equalTo: categoryDivider17.rightAnchor, constant: 0).isActive = true
        appointmentsSeenTextField5.centerYAnchor.constraint(equalTo: appointmentsSeenLbl2.centerYAnchor).isActive = true
        appointmentsSeenTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.22).isActive = true
        appointmentsSeenTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        reappointmentsLbl2.centerXAnchor.constraint(equalTo: appointmentsSeenLbl2.centerXAnchor).isActive = true
        reappointmentsLbl2.topAnchor.constraint(equalTo: appointmentsSeenLbl2.bottomAnchor, constant: 0.5).isActive = true
        reappointmentsLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.27).isActive = true
        reappointmentsLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        reappointmentsLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        reappointmentsTextField3.leftAnchor.constraint(equalTo: categoryDivider16.leftAnchor, constant: 0).isActive = true
        reappointmentsTextField3.centerYAnchor.constraint(equalTo: reappointmentsLbl2.centerYAnchor).isActive = true
        reappointmentsTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        reappointmentsTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        reappointmentsTextField4.leftAnchor.constraint(equalTo: reappointmentsTextField3.rightAnchor, constant: 0.5).isActive = true
        reappointmentsTextField4.centerYAnchor.constraint(equalTo: reappointmentsLbl2.centerYAnchor).isActive = true
        reappointmentsTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        reappointmentsTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        reappointmentsTextField5.leftAnchor.constraint(equalTo: categoryDivider17.rightAnchor, constant: 0).isActive = true
        reappointmentsTextField5.centerYAnchor.constraint(equalTo: reappointmentsLbl2.centerYAnchor).isActive = true
        reappointmentsTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.22).isActive = true
        reappointmentsTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        reappointmentRateLbl2.centerXAnchor.constraint(equalTo: reappointmentsLbl2.centerXAnchor).isActive = true
        reappointmentRateLbl2.topAnchor.constraint(equalTo: reappointmentsLbl2.bottomAnchor, constant: 0.5).isActive = true
        reappointmentRateLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.27).isActive = true
        reappointmentRateLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        reappointmentRateLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        reappointmentRateTextField3.leftAnchor.constraint(equalTo: categoryDivider16.leftAnchor, constant: 0).isActive = true
        reappointmentRateTextField3.centerYAnchor.constraint(equalTo: reappointmentRateLbl2.centerYAnchor).isActive = true
        reappointmentRateTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        reappointmentRateTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        reappointmentRateTextField4.leftAnchor.constraint(equalTo: reappointmentRateTextField3.rightAnchor, constant: 0.5).isActive = true
        reappointmentRateTextField4.centerYAnchor.constraint(equalTo: reappointmentRateLbl2.centerYAnchor).isActive = true
        reappointmentRateTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        reappointmentRateTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        retentionRateLbl4.centerXAnchor.constraint(equalTo: reappointmentRateLbl2.centerXAnchor).isActive = true
        retentionRateLbl4.topAnchor.constraint(equalTo: reappointmentRateLbl2.bottomAnchor, constant: 0.5).isActive = true
        retentionRateLbl4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.27).isActive = true
        retentionRateLbl4.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        retentionRateLbl4.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        retentionRateTextField7.leftAnchor.constraint(equalTo: categoryDivider16.leftAnchor, constant: 0).isActive = true
        retentionRateTextField7.centerYAnchor.constraint(equalTo: retentionRateLbl4.centerYAnchor).isActive = true
        retentionRateTextField7.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        retentionRateTextField7.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        retentionRateTextField8.leftAnchor.constraint(equalTo: retentionRateTextField7.rightAnchor, constant: 0.5).isActive = true
        retentionRateTextField8.centerYAnchor.constraint(equalTo: retentionRateLbl4.centerYAnchor).isActive = true
        retentionRateTextField8.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.23).isActive = true
        retentionRateTextField8.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        categoryDivider17.centerXAnchor.constraint(equalTo: retentionRateTextField8.rightAnchor, constant: 0).isActive = true
        categoryDivider17.topAnchor.constraint(equalTo: categoryDivider15.bottomAnchor, constant: 0).isActive = true
        categoryDivider17.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.001).isActive = true
        categoryDivider17.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 1).isActive = true
        
        goalTextField9.leftAnchor.constraint(equalTo: categoryDivider17.leftAnchor, constant: 0).isActive = true
        goalTextField9.centerYAnchor.constraint(equalTo: goalLbl4.centerYAnchor).isActive = true
        goalTextField9.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.22).isActive = true
        goalTextField9.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        ashleyLbl.leftAnchor.constraint(equalTo: categoryDivider17.leftAnchor, constant: 5).isActive = true
        ashleyLbl.centerYAnchor.constraint(equalTo: categoryHighlight8.centerYAnchor).isActive = true
        ashleyLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.038)
        
        netProductionTextField11.leftAnchor.constraint(equalTo: categoryDivider17.leftAnchor, constant: 0).isActive = true
        netProductionTextField11.centerYAnchor.constraint(equalTo: netProductionLbl4.centerYAnchor).isActive = true
        netProductionTextField11.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.22).isActive = true
        netProductionTextField11.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        daysWorkedTextField9.leftAnchor.constraint(equalTo: categoryDivider17.rightAnchor, constant: 0).isActive = true
        daysWorkedTextField9.centerYAnchor.constraint(equalTo: daysWorkedLbl4.centerYAnchor).isActive = true
        daysWorkedTextField9.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.22).isActive = true
        daysWorkedTextField9.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        productionPerDayTextField9.leftAnchor.constraint(equalTo: categoryDivider17.rightAnchor, constant: 0).isActive = true
        productionPerDayTextField9.centerYAnchor.constraint(equalTo: productionPerDayLbl4.centerYAnchor).isActive = true
        productionPerDayTextField9.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.22).isActive = true
        productionPerDayTextField9.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        numberOfHoursWorkedTextField5.leftAnchor.constraint(equalTo: categoryDivider17.rightAnchor, constant: 0).isActive = true
        numberOfHoursWorkedTextField5.centerYAnchor.constraint(equalTo: numberOfHoursWorkedLbl2.centerYAnchor).isActive = true
        numberOfHoursWorkedTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.22).isActive = true
        numberOfHoursWorkedTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        productionPerHourTextField9.leftAnchor.constraint(equalTo: categoryDivider17.rightAnchor, constant: 0).isActive = true
        productionPerHourTextField9.centerYAnchor.constraint(equalTo: productionPerHourLbl4.centerYAnchor).isActive = true
        productionPerHourTextField9.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.22).isActive = true
        productionPerHourTextField9.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentAppointmentsKeptTextField9.leftAnchor.constraint(equalTo: categoryDivider17.rightAnchor, constant: 0).isActive = true
        percentAppointmentsKeptTextField9.centerYAnchor.constraint(equalTo: percentAppointmentsKeptLbl4.centerYAnchor).isActive = true
        percentAppointmentsKeptTextField9.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.22).isActive = true
        percentAppointmentsKeptTextField9.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        perioPercentTextField5.leftAnchor.constraint(equalTo: categoryDivider17.rightAnchor, constant: 0).isActive = true
        perioPercentTextField5.centerYAnchor.constraint(equalTo: perioPercentLbl2.centerYAnchor).isActive = true
        perioPercentTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.22).isActive = true
        perioPercentTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        fluoridePercentTextField5.leftAnchor.constraint(equalTo: categoryDivider17.rightAnchor, constant: 0).isActive = true
        fluoridePercentTextField5.centerYAnchor.constraint(equalTo: fluoridePercentLbl2.centerYAnchor).isActive = true
        fluoridePercentTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.22).isActive = true
        fluoridePercentTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        oralIdPercentTextField5.leftAnchor.constraint(equalTo: categoryDivider17.rightAnchor, constant: 0).isActive = true
        oralIdPercentTextField5.centerYAnchor.constraint(equalTo: oralIdPercentLbl2.centerYAnchor).isActive = true
        oralIdPercentTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.22).isActive = true
        oralIdPercentTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        arestinPercentTextField5.leftAnchor.constraint(equalTo: categoryDivider17.rightAnchor, constant: 0).isActive = true
        arestinPercentTextField5.centerYAnchor.constraint(equalTo: arestinPercentLbl2.centerYAnchor).isActive = true
        arestinPercentTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.22).isActive = true
        arestinPercentTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        reappointmentRateTextField5.leftAnchor.constraint(equalTo: categoryDivider17.rightAnchor, constant: 0).isActive = true
        reappointmentRateTextField5.centerYAnchor.constraint(equalTo: reappointmentRateLbl2.centerYAnchor).isActive = true
        reappointmentRateTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.22).isActive = true
        reappointmentRateTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        retentionRateTextField9.leftAnchor.constraint(equalTo: categoryDivider17.rightAnchor, constant: 0).isActive = true
        retentionRateTextField9.centerYAnchor.constraint(equalTo: retentionRateLbl4.centerYAnchor).isActive = true
        retentionRateTextField9.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.22).isActive = true
        retentionRateTextField9.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        amountPresentedTextField7.leftAnchor.constraint(equalTo: amountPresentedTextField6.rightAnchor, constant: 0.5).isActive = true
        amountPresentedTextField7.centerYAnchor.constraint(equalTo: amountPresentedLbl3.centerYAnchor).isActive = true
        amountPresentedTextField7.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        amountPresentedTextField7.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        debbieDLbl.centerXAnchor.constraint(equalTo: amountPresentedTextField5.centerXAnchor, constant: 0).isActive = true
        debbieDLbl.centerYAnchor.constraint(equalTo: categoryHighlight4.centerYAnchor).isActive = true
        debbieDLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.025)
        
        annaCLbl.centerXAnchor.constraint(equalTo: amountPresentedTextField6.centerXAnchor, constant: 0).isActive = true
        annaCLbl.centerYAnchor.constraint(equalTo: categoryHighlight4.centerYAnchor).isActive = true
        annaCLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.025)
        
        jessicaLbl.centerXAnchor.constraint(equalTo: amountPresentedTextField7.centerXAnchor, constant: 0).isActive = true
        jessicaLbl.centerYAnchor.constraint(equalTo: categoryHighlight4.centerYAnchor).isActive = true
        jessicaLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.025)
        
        amountAcceptedTextField7.leftAnchor.constraint(equalTo: amountAcceptedTextField6.rightAnchor, constant: 0.5).isActive = true
        amountAcceptedTextField7.centerYAnchor.constraint(equalTo: amountAcceptedLbl3.centerYAnchor).isActive = true
        amountAcceptedTextField7.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        amountAcceptedTextField7.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentOfDollarAmountScheduledTextField7.leftAnchor.constraint(equalTo: percentOfDollarAmountScheduledTextField6.rightAnchor, constant: 0.5).isActive = true
        percentOfDollarAmountScheduledTextField7.centerYAnchor.constraint(equalTo: percentOfDollarAmountScheduledLbl3.centerYAnchor).isActive = true
        percentOfDollarAmountScheduledTextField7.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        percentOfDollarAmountScheduledTextField7.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        numberPatientsPresentedTreatmentTextField7.leftAnchor.constraint(equalTo: numberPatientsPresentedTreatmentTextField6.rightAnchor, constant: 0.5).isActive = true
        numberPatientsPresentedTreatmentTextField7.centerYAnchor.constraint(equalTo: numberPatientsPresentedTreatmentLbl3.centerYAnchor).isActive = true
        numberPatientsPresentedTreatmentTextField7.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        numberPatientsPresentedTreatmentTextField7.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        numberPatientsAcceptedTreatmentTextField7.leftAnchor.constraint(equalTo: numberPatientsAcceptedTreatmentTextField6.rightAnchor, constant: 0.5).isActive = true
        numberPatientsAcceptedTreatmentTextField7.centerYAnchor.constraint(equalTo: numberPatientsAccpetedTreatmentLbl3.centerYAnchor).isActive = true
        numberPatientsAcceptedTreatmentTextField7.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        numberPatientsAcceptedTreatmentTextField7.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
     
        percentPatientsAcceptedTreatmentTextField7.leftAnchor.constraint(equalTo: percentPatientsAcceptedTreatmentTextField6.rightAnchor, constant: 0.5).isActive = true
        percentPatientsAcceptedTreatmentTextField7.centerYAnchor.constraint(equalTo: percentPatientsAcceptedTreatmentLbl3.centerYAnchor).isActive = true
        percentPatientsAcceptedTreatmentTextField7.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.21).isActive = true
        percentPatientsAcceptedTreatmentTextField7.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        heatherDyerAmountPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            self.heatherDyerAmountPresentedTextField.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionHeatherDyerAmountPresentedValue = (snap.value as! Double)
        }
        heatherDyerAmountAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            self.heatherDyerAmountAcceptedTextField.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionHeatherDyerAmountAcceptedValue = (snap.value as! Double)
        }
        heatherDyerPercentOfDollarAmountScheduledRef.observe((.value)) { (snap: DataSnapshot) in
            self.heatherDyerPercentOfDollarAmountScheduledTextField.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        heatherDyerNumberOfPatientsPresentedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.heatherDyerNumberPatientsPresentedTreatmentTextField.placeholder = (snap.value as AnyObject).description
            self.sessionHeatherDyerPatientsPresesntedValue = (snap.value as! Double)
        }
        heatherDyerNumberOfPatientsAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.heatherDyerNumberPatientsAcceptedTreatmentTextField.placeholder = (snap.value as AnyObject).description
            self.sessionHeatherDyerPatientsAcceptedValue = (snap.value as! Double)
        }
        heatherDyerPercentOfPatientAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.heatherDyerPercentPatientsAcceptedTreatmentTextField.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        
        amyScheduledAppointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            self.scheduledAppointmentsTextField5.placeholder = (snap.value as AnyObject).description
            self.sessionAmyScheduledAppointmentsValue = (snap.value as! Double)
        }
        amyAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.appointmentsKeptTextField5.placeholder = (snap.value as AnyObject).description
            self.sessionAmyAppointmentsKeptValue = (snap.value as! Double)
        }
        aubreyScheduledAppointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            self.scheduledAppointmentsTextField6.placeholder = (snap.value as AnyObject).description
            self.sessionAubreyScheduledAppointmentsValue = (snap.value as! Double)
        }
        aubreyAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.appointmentsKeptTextField6.placeholder = (snap.value as AnyObject).description
            self.sessionAubreyAppointmentsKeptValue = (snap.value as! Double)
        }
        dawnScheduledAppointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            self.scheduledAppointmentsTextField7.placeholder =  (snap.value as AnyObject).description
            self.sessionDawnScheduledAppointmentsValue = (snap.value as! Double)
        }
        dawnAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.appointmentsKeptTextField7.placeholder = (snap.value as AnyObject).description
            self.sessionDawnAppointmentsKeptValue = (snap.value as! Double)
        }
        sheilaScheduledAppointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            self.scheduledAppointmentsTextField8.placeholder = (snap.value as AnyObject).description
            self.sessionSheilaScheduledAppointmentsValue = (snap.value as! Double)
        }
        sheilaAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.appointmentsKeptTextField8.placeholder = (snap.value as AnyObject).description
            self.sessionSheilaAppointmentsKeptValue = (snap.value as! Double)
        }
        ashleyScheduledAppointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            self.scheduledAppointmentsTextField9.placeholder = (snap.value as AnyObject).description
            self.sessionAshleyScheduledAppointmentsValue = (snap.value as! Double)
        }
        ashleyAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.appointmentsKeptTextField9.placeholder = (snap.value as AnyObject).description
            self.sessionAshleyAppointmentsKeptValue = (snap.value as! Double)
        }
        
        woodstockNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            self.netProductionTextField1.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionWoodstockNetProductionsValue = (snap.value as! Double)
        }
        woodstockCollectionsRef.observe((.value)) { (snap: DataSnapshot) in
            self.collectionsTextField1.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionWoodstockCollectionsValue = (snap.value as! Double)
        }
        woodstockInsuranceCollectionsRef.observe((.value)) { (snap: DataSnapshot) in
            self.insuranceCollectionsTextField1.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionWoodstockInsuranceCollectionsValue = (snap.value as! Double)
        }
        woodstockOTCollectionsRef.observe((.value)) { (snap: DataSnapshot) in
            self.otcCollectionsTextField1.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionWoodstockOTCCollectionsValue = (snap.value as! Double)
        }
        woodstockDollarAmountRefundedToInsuranceRef.observe((.value)) { (snap: DataSnapshot) in
            self.amountRefundedToInsuranceTextField1.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        woodstockDollarAmountRefundedToPatientsRef.observe((.value)) { (snap: DataSnapshot) in
            self.amountRefundedToPatientsTextField1.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        woodstockPercentOTCToTotalCollectionsRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentOTCToTotalCollectionsTextField1.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        woodstockPercentInsuranceToTotalCollectionsRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentInsuranceToTotalCollectionsTextField1.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        woodstockPercentCollectionsToNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentCollectionsToNetProducionTextField1.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 97.0 {
                self.percentCollectionsToNetProducionTextField1.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 95.0 && Double(snap.value as! Double) <= 96.0 {
                self.percentCollectionsToNetProducionTextField1.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 94.0 {
                self.percentCollectionsToNetProducionTextField1.backgroundColor = UIColor.red
            }
        }
        woodstockProductionPerActiveChairRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerActiveChairTextField1.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        
        kennesawNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            self.netProductionTextField2.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionKennesawNetProductionValue = (snap.value as! Double)
        }
        kennesawCollectionsRef.observe((.value)) { (snap: DataSnapshot) in
            self.collectionsTextField2.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionKennesawCollectionsValue = (snap.value as! Double)
        }
        kennesawInsuranceCollectionsRef.observe((.value)) { (snap: DataSnapshot) in
            self.insuranceCollectionsTextField2.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionKennesawInsuranceCollectionsValue = (snap.value as! Double)
        }
        kennesawOTCollectionsRef.observe((.value)) { (snap: DataSnapshot) in
            self.otcCollectionsTextField2.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionKennesawOTCCollectionsValue = (snap.value as! Double)
        }
        kennesawDollarAmountRefundedToInsuranceRef.observe((.value)) { (snap: DataSnapshot) in
            self.amountRefundedToInsuranceTextField2.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        kennesawDollarAmountRefundedToPatientsRef.observe((.value)) { (snap: DataSnapshot) in
            self.amountRefundedToPatientsTextField2.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        kennesawPercentOTCToTotalCollectionsRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentOTCToTotalCollectionsTextField2.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        kennesawPercentInsuranceToTotalCollectionsRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentInsuranceToTotalCollectionsTextField2.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        kennesawPercentCollectionsToNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentCollectionsToNetProducionTextField2.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 97.0 {
                self.percentCollectionsToNetProducionTextField2.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 95.0 && Double(snap.value as! Double) <= 96.0 {
                self.percentCollectionsToNetProducionTextField2.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 94.0 {
                self.percentCollectionsToNetProducionTextField2.backgroundColor = UIColor.red
            }
        }
        kennesawProductionPerActiveChairRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerActiveChairTextField2.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        
        hollyAmountPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            self.amountPresentedTextField1.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionHollyAmountPresentedValue = (snap.value as! Double)
        }
        hollyAmountAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            self.amountAcceptedTextField1.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionHollyAmountAcceptedValue = (snap.value as! Double)
        }
        hollyPercentOfDollarAmountScheduledRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentOfDollarAmountScheduledTextField1.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        hollyNumberOfPatientsPresentedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberPatientsPresentedTreatmentTextField1.placeholder = (snap.value as AnyObject).description
            self.sessionHollyPatientsPresesntedValue = (snap.value as! Double)
        }
        hollyNumberOfPatientsAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberPatientsAcceptedTreatmentTextField1.placeholder = (snap.value as AnyObject).description
            self.sessionHollyPatientsAcceptedValue = (snap.value as! Double)
        }
        hollyPercentOfPatientAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentPatientsAcceptedTreatmentTextField1.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        
        sydneyAmountPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            self.amountPresentedTextField2.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionSydneyAmountPresentedValue = (snap.value as! Double)
        }
        sydneyAmountAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            self.amountAcceptedTextField2.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionSydneyAmountAcceptedValue = (snap.value as! Double)
        }
        sydneyPercentOfDollarAmountScheduledRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentOfDollarAmountScheduledTextField2.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        sydneyNumberOfPatientsPresentedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberPatientsPresentedTreatmentTextField2.placeholder = (snap.value as AnyObject).description
            self.sessionSydneyPatientsPresesntedValue = (snap.value as! Double)
        }
        sydneyNumberOfPatientsAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberPatientsAcceptedTreatmentTextField2.placeholder = (snap.value as AnyObject).description
            self.sessionSydneyPatientsAcceptedValue = (snap.value as! Double)
        }
        sydneyPercentOfPatientAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentPatientsAcceptedTreatmentTextField2.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        
        amandaAmountPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            self.amountPresentedTextField3.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionAmandaAmountPresentedValue = (snap.value as! Double)
        }
        amandaAmountAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            self.amountAcceptedTextField3.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionAmandaAmountAcceptedValue = (snap.value as! Double)
        }
        amandaPercentOfDollarAmountScheduledRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentOfDollarAmountScheduledTextField3.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        amandaNumberOfPatientsPresentedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberPatientsPresentedTreatmentTextField3.placeholder = (snap.value as AnyObject).description
            self.sessionAmandaPatientsPresesntedValue = (snap.value as! Double)
        }
        amandaNumberOfPatientsAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberPatientsAcceptedTreatmentTextField3.placeholder = (snap.value as AnyObject).description
            self.sessionAmandaPatientsAcceptedValue = (snap.value as! Double)
        }
        amandaPercentOfPatientAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentPatientsAcceptedTreatmentTextField3.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        
        ashleyAmountPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            self.amountPresentedTextField4.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionAshleyGAmountPresentedValue = (snap.value as! Double)
        }
        ashleyAmountAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            self.amountAcceptedTextField4.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionAshleyGAmountAcceptedValue = (snap.value as! Double)
        }
        ashleyPercentOfDollarAmountScheduledRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentOfDollarAmountScheduledTextField4.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        ashleyNumberOfPatientsPresentedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberPatientsPresentedTreatmentTextField4.placeholder = (snap.value as AnyObject).description
            self.sessionAshleyGPatientsPresesntedValue = (snap.value as! Double)
        }
        ashleyNumberOfPatientsAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberPatientsAcceptedTreatmentTextField4.placeholder = (snap.value as AnyObject).description
            self.sessionAshleyGPatientsAcceptedValue = (snap.value as! Double)
        }
        ashleyPercentOfPatientAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentPatientsAcceptedTreatmentTextField4.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        
        debbieAmountPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            self.amountPresentedTextField5.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionDebbieDAmountPresentedValue = (snap.value as! Double)
        }
        debbieAmountAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            self.amountAcceptedTextField5.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionDebbieDAmountAcceptedValue = (snap.value as! Double)
        }
        debbiePercentOfDollarAmountScheduledRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentOfDollarAmountScheduledTextField5.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        debbieNumberOfPatientsPresentedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberPatientsPresentedTreatmentTextField5.placeholder = (snap.value as AnyObject).description
            self.sessionDebbieDPatientsPresesntedValue = (snap.value as! Double)
        }
        debbieNumberOfPatientsAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberPatientsAcceptedTreatmentTextField5.placeholder = (snap.value as AnyObject).description
            self.sessionDebbieDPatientsAcceptedValue = (snap.value as! Double)
        }
        debbiePercentOfPatientAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentPatientsAcceptedTreatmentTextField5.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        
        annaAmountPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            self.amountPresentedTextField6.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionAnnaCAmountPresentedValue = (snap.value as! Double)
        }
        annaAmountAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            self.amountAcceptedTextField6.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionAnnaCAmountAcceptedValue = (snap.value as! Double)
        }
        annaPercentOfDollarAmountScheduledRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentOfDollarAmountScheduledTextField6.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        annaNumberOfPatientsPresentedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberPatientsPresentedTreatmentTextField6.placeholder = (snap.value as AnyObject).description
            self.sessionAnnaCPatientsPresesntedValue = (snap.value as! Double)
        }
        annaNumberOfPatientsAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberPatientsAcceptedTreatmentTextField6.placeholder = (snap.value as AnyObject).description
            self.sessionAnnaCPatientsAcceptedValue = (snap.value as! Double)
        }
        annaPercentOfPatientAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentPatientsAcceptedTreatmentTextField6.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        
        jessicaAmountPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            self.amountPresentedTextField7.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionJessicaAmountPresentedValue = (snap.value as! Double)
        }
        jessicaAmountAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            self.amountAcceptedTextField7.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionJessicaAmountAcceptedValue = (snap.value as! Double)
        }
        jessicaPercentOfDollarAmountScheduledRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentOfDollarAmountScheduledTextField7.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        jessicaNumberOfPatientsPresentedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberPatientsPresentedTreatmentTextField7.placeholder = (snap.value as AnyObject).description
            self.sessionJessicaPatientsPresesntedValue = (snap.value as! Double)
        }
        jessicaNumberOfPatientsAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberPatientsAcceptedTreatmentTextField7.placeholder = (snap.value as AnyObject).description
            self.sessionJessicaPatientsAcceptedValue = (snap.value as! Double)
        }
        jessicaPercentOfPatientAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentPatientsAcceptedTreatmentTextField7.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        
    
        
        drVGoalRef.observe((.value)) { (snap: DataSnapshot) in
            self.goalTextField1.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        drVNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            self.netProductionTextField3.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionDrVNetProductionValue = (snap.value as! Int)
        }
        drVDaysWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            self.daysWorkedTextField1.placeholder = (snap.value as AnyObject).description
            self.sessionDrVDaysWorkedValue = (snap.value as! Int)
        }
        drVProductionPerDayRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerDayTextField1.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        drVProductionPerHourRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerHourTextField1.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        drVDollarAmountSameDayTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.dollarAmountSameDayTreatmentTextField1.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        drVScheduledAppointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            self.scheduledAppointmentsTextField1.placeholder = (snap.value as AnyObject).description
            self.sessionDrVScheduledAppointmentsValue = (snap.value as! Double)
        }
        drVAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.appointmentsKeptTextField1.placeholder = (snap.value as AnyObject).description
            self.sessionDrVAppointmentsKeptValue = (snap.value as! Double)
        }
        drVPercentAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentAppointmentsKeptTextField1.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 90.0 {
                self.percentAppointmentsKeptTextField1.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 80.0 && Double(snap.value as! Double) <= 89.0 {
                self.percentAppointmentsKeptTextField1.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 80.0 {
                self.percentAppointmentsKeptTextField1.backgroundColor = UIColor.red
            }
        }
        drVRetentionRateRef.observe((.value)) { (snap: DataSnapshot) in
            self.retentionRateTextField1.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        
        drMcreeGoalRef.observe((.value)) { (snap: DataSnapshot) in
            self.goalTextField2.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        drMcreeNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            self.netProductionTextField4.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionDrMcreeNetProductionValue = (snap.value as! Int)
        }
        drMcreeDaysWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            self.daysWorkedTextField2.placeholder = (snap.value as AnyObject).description
            self.sessionDrMcreeDaysWorkedValue = (snap.value as! Int)
        }
        drMcreeProductionPerDayRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerDayTextField2.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        drMcreeProductionPerHourRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerHourTextField2.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        drMcreeDollarAmountSameDayTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.dollarAmountSameDayTreatmentTextField2.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        drMcreeScheduledAppointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            self.scheduledAppointmentsTextField2.placeholder = (snap.value as AnyObject).description
            self.sessionDrMcreeScheduledAppointmentsValue = (snap.value as! Double)
        }
        drMcreeAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.appointmentsKeptTextField2.placeholder = (snap.value as AnyObject).description
            self.sessionDrMcreeAppointmentsKeptValue = (snap.value as! Double)
        }
        drMcreePercentAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentAppointmentsKeptTextField2.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 90.0 {
                self.percentAppointmentsKeptTextField2.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 80.0 && Double(snap.value as! Double) <= 89.0 {
                self.percentAppointmentsKeptTextField2.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 80.0 {
                self.percentAppointmentsKeptTextField2.backgroundColor = UIColor.red
            }
        }
        drMcreeRetentionRateRef.observe((.value)) { (snap: DataSnapshot) in
            self.retentionRateTextField2.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        
        drOrzaGoalRef.observe((.value)) { (snap: DataSnapshot) in
            self.goalTextField3.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        drOrzaNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            self.netProductionTextField5.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionDrOrzaNetProductionValue = (snap.value as! Int)
        }
        drOrzaDaysWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            self.daysWorkedTextField3.placeholder = (snap.value as AnyObject).description
            self.sessionDrOrzaDaysWorkedValue = (snap.value as! Int)
        }
        drOrzaProductionPerDayRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerDayTextField3.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        drOrzaProductionPerHourRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerHourTextField3.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        drOrzaDollarAmountSameDayTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.dollarAmountSameDayTreatmentTextField3.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        drOrzaScheduledAppointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            self.scheduledAppointmentsTextField3.placeholder = (snap.value as AnyObject).description
            self.sessionDrOrzaScheduledAppointmentsValue = (snap.value as! Double)
        }
        drOrzaAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.appointmentsKeptTextField3.placeholder = (snap.value as AnyObject).description
            self.sessionDrOrzaAppointmentsKeptValue = (snap.value as! Double)
        }
        drOrzaPercentAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentAppointmentsKeptTextField3.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 90.0 {
                self.percentAppointmentsKeptTextField3.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 80.0 && Double(snap.value as! Double) <= 89.0 {
                self.percentAppointmentsKeptTextField3.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 80.0 {
                self.percentAppointmentsKeptTextField3.backgroundColor = UIColor.red
            }
        }
        drOrzaRetentionRateRef.observe((.value)) { (snap: DataSnapshot) in
            self.retentionRateTextField3.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        
        drFranGoalRef.observe((.value)) { (snap: DataSnapshot) in
            self.goalTextField4.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        drFranNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            self.netProductionTextField6.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionDrFranNetProductionValue = (snap.value as! Int)
        }
        drFranDaysWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            self.daysWorkedTextField4.placeholder = (snap.value as AnyObject).description
            self.sessionDrFranDaysWorkedValue = (snap.value as! Int)
        }
        drFranProductionPerDayRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerDayTextField4.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        drFranProductionPerHourRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerHourTextField4.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        drFranDollarAmountSameDayTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.dollarAmountSameDayTreatmentTextField4.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        drFranScheduledAppointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            self.scheduledAppointmentsTextField4.placeholder = (snap.value as AnyObject).description
            self.sessionDrFranScheduledAppointmentsValue = (snap.value as! Double)
        }
        drFranAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.appointmentsKeptTextField4.placeholder = (snap.value as AnyObject).description
            self.sessionDrFranAppointmentsKeptValue = (snap.value as! Double)
        }
        drFranPercentAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentAppointmentsKeptTextField4.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 90.0 {
                self.percentAppointmentsKeptTextField4.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 80.0 && Double(snap.value as! Double) <= 89.0 {
                self.percentAppointmentsKeptTextField4.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 80.0 {
                self.percentAppointmentsKeptTextField4.backgroundColor = UIColor.red
            }
        }
        drFranRetentionRateRef.observe((.value)) { (snap: DataSnapshot) in
            self.retentionRateTextField4.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        
        amyGoalRef.observe((.value)) { (snap: DataSnapshot) in
            self.goalTextField5.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        amyNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            self.netProductionTextField7.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionAmyNetProductionValue = (snap.value as! Int)
        }
        amyDaysWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            self.daysWorkedTextField5.placeholder = (snap.value as AnyObject).description
            self.sessionAmyDaysWorkedValue = (snap.value as! Int)
        }
        amyProductionPerDayRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerDayTextField5.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        amyHoursWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberOfHoursWorkedTextField1.placeholder = (snap.value as AnyObject).description
            self.sessionAmyHoursWorkedValue = (snap.value as! Int)
        }
        amyProductionPerHourRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerHourTextField5.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        amyScheduledAppointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            self.scheduledAppointmentsTextField5.placeholder = (snap.value as AnyObject).description
        }
        amyAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.appointmentsKeptTextField5.placeholder = (snap.value as AnyObject).description
        }
        amyPercentAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentAppointmentsKeptTextField5.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 90.0 {
                self.percentAppointmentsKeptTextField5.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 80.0 && Double(snap.value as! Double) <= 89.0 {
                self.percentAppointmentsKeptTextField5.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 80.0 {
                self.percentAppointmentsKeptTextField5.backgroundColor = UIColor.red
            }
        }
        amyPerioPercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.perioPercentTextField1.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 60.0 {
                self.perioPercentTextField1.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 40.0 && Double(snap.value as! Double) <= 59.0 {
                self.perioPercentTextField1.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 40.0 {
                self.perioPercentTextField1.backgroundColor = UIColor.red
            }
        }
        amyFluoridePercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.fluoridePercentTextField1.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 90.0 {
                self.fluoridePercentTextField1.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 75.0 && Double(snap.value as! Double) <= 89.0 {
                self.fluoridePercentTextField1.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 75.0 {
                self.fluoridePercentTextField1.backgroundColor = UIColor.red
            }
        }
        amyOralIDPercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.oralIdPercentTextField1.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 90.0 {
                self.oralIdPercentTextField1.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 75.0 && Double(snap.value as! Double) <= 89.0 {
                self.oralIdPercentTextField1.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 75.0 {
                self.oralIdPercentTextField1.backgroundColor = UIColor.red
            }
        }
        amyArestinPercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.arestinPercentTextField1.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 90.0 {
                self.arestinPercentTextField1.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 75.0 && Double(snap.value as! Double) <= 89.0 {
                self.arestinPercentTextField1.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 75.0 {
                self.arestinPercentTextField1.backgroundColor = UIColor.red
            }
        }
        amyReappointmentRateRef.observe((.value)) { (snap: DataSnapshot) in
            self.reappointmentRateTextField1.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 90.0 {
                self.reappointmentRateTextField1.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 85.0 && Double(snap.value as! Double) <= 89.0 {
                self.reappointmentRateTextField1.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 85.0 {
                self.reappointmentRateTextField1.backgroundColor = UIColor.red
            }
        }
        amyRetentionRateRef.observe((.value)) { (snap: DataSnapshot) in
            self.retentionRateTextField5.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        amyFluoridePresentedRef.observe((.value)) { (snap: DataSnapshot) in
            self.fluoridePresentedTextField1.placeholder = (snap.value as AnyObject).description
            self.sessionAmyFluoridePresentedValue = (snap.value as! Double)
        }
        amyFluorideAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            self.fluorideAcceptedTextField1.placeholder = (snap.value as AnyObject).description
            self.sessionAmyFluorideAcceptedValue = (snap.value as! Double)
        }
        amyOralIDPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            self.oralIDPresentedTextField1.placeholder = (snap.value as AnyObject).description
            self.sessionAmyOralIDPresentedValue = (snap.value as! Double)
        }
        amyOralIDAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            self.oralIDAcceptedTextField1.placeholder = (snap.value as AnyObject).description
            self.sessionAmyOralIDAcceptedValue = (snap.value as! Double)
        }
        amyArestinPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            self.arestinPresentedTextField1.placeholder = (snap.value as AnyObject).description
            self.sessionAmyArestinPresentedValue = (snap.value as! Double)
        }
        amyArestinAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            self.arestinAcceptedTextField1.placeholder = (snap.value as AnyObject).description
            self.sessionAmyArestinAcceptedValue = (snap.value as! Double)
        }
        amyAppointmentsSeenRef.observe((.value)) { (snap: DataSnapshot) in
            self.appointmentsSeenTextField1.placeholder = (snap.value as AnyObject).description
            self.sessionAmyAppointmentsSeenValue = (snap.value as! Double)
        }
        amyReappointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            self.reappointmentsTextField1.placeholder = (snap.value as AnyObject).description
            self.sessionAmyReappointmentsValue = (snap.value as! Double)
        }
        
        aubreyGoalRef.observe((.value)) { (snap: DataSnapshot) in
            self.goalTextField6.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        aubreyNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            self.netProductionTextField8.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionAubreyNetProductionValue = (snap.value as! Int)
        }
        aubreyDaysWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            self.daysWorkedTextField6.placeholder = (snap.value as AnyObject).description
            self.sessionAubreyDaysWorkedValue = (snap.value as! Int)
        }
        aubreyProductionPerDayRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerDayTextField6.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        aubreyHoursWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberOfHoursWorkedTextField2.placeholder = (snap.value as AnyObject).description
            self.sessionAubreyHoursWorkedValue = (snap.value as! Int)
        }
        aubreyProductionPerHourRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerHourTextField6.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        aubreyScheduledAppointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            self.scheduledAppointmentsTextField6.placeholder = (snap.value as AnyObject).description
        }
        aubreyAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.appointmentsKeptTextField6.placeholder = (snap.value as AnyObject).description
        }
        aubreyPercentAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentAppointmentsKeptTextField6.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 90.0 {
                self.percentAppointmentsKeptTextField6.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 80.0 && Double(snap.value as! Double) <= 89.0 {
                self.percentAppointmentsKeptTextField6.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 80.0 {
                self.percentAppointmentsKeptTextField6.backgroundColor = UIColor.red
            }
        }
        aubreyPerioPercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.perioPercentTextField2.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 60.0 {
                self.perioPercentTextField2.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 40.0 && Double(snap.value as! Double) <= 59.0 {
                self.perioPercentTextField2.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 40.0 {
                self.perioPercentTextField2.backgroundColor = UIColor.red
            }
        }
        aubreyFluoridePercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.fluoridePercentTextField2.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 90.0 {
                self.fluoridePercentTextField2.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 75.0 && Double(snap.value as! Double) <= 89.0 {
                self.fluoridePercentTextField2.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 75.0 {
                self.fluoridePercentTextField2.backgroundColor = UIColor.red
            }
        }
        aubreyOralIDPercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.oralIdPercentTextField2.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 90.0 {
                self.oralIdPercentTextField2.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 75.0 && Double(snap.value as! Double) <= 89.0 {
                self.oralIdPercentTextField2.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 75.0 {
                self.oralIdPercentTextField2.backgroundColor = UIColor.red
            }
        }
        aubreyArestinPercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.arestinPercentTextField2.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 90.0 {
                self.arestinPercentTextField2.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 75.0 && Double(snap.value as! Double) <= 89.0 {
                self.arestinPercentTextField2.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 75.0 {
                self.arestinPercentTextField2.backgroundColor = UIColor.red
            }
        }
        aubreyReappointmentRateRef.observe((.value)) { (snap: DataSnapshot) in
            self.reappointmentRateTextField2.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 90.0 {
                self.reappointmentRateTextField2.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 85.0 && Double(snap.value as! Double) <= 89.0 {
                self.reappointmentRateTextField2.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 85.0 {
                self.reappointmentRateTextField2.backgroundColor = UIColor.red
            }
        }
        aubreyRetentionRateRef.observe((.value)) { (snap: DataSnapshot) in
            self.retentionRateTextField6.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        aubreyFluoridePresentedRef.observe((.value)) { (snap: DataSnapshot) in
            self.fluoridePresentedTextField2.placeholder = (snap.value as AnyObject).description
            self.sessionAubreyFluoridePresentedValue = (snap.value as! Double)
        }
        aubreyFluorideAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            self.fluorideAcceptedTextField2.placeholder = (snap.value as AnyObject).description
            self.sessionAubreyFluorideAcceptedValue = (snap.value as! Double)
        }
        aubreyOralIDPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            self.oralIDPresentedTextField2.placeholder = (snap.value as AnyObject).description
            self.sessionAubreyOralIDPresentedValue = (snap.value as! Double)
        }
        aubreyOralIDAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            self.oralIDAcceptedTextField2.placeholder = (snap.value as AnyObject).description
            self.sessionAubreyOralIDAcceptedValue = (snap.value as! Double)
        }
        aubreyArestinPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            self.arestinPresentedTextField2.placeholder = (snap.value as AnyObject).description
            self.sessionAubreyArestinPresentedValue = (snap.value as! Double)
        }
        aubreyArestinAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            self.arestinAcceptedTextField2.placeholder = (snap.value as AnyObject).description
            self.sessionAubreyArestinAcceptedValue = (snap.value as! Double)
        }
        aubreyAppointmentsSeenRef.observe((.value)) { (snap: DataSnapshot) in
            self.appointmentsSeenTextField2.placeholder = (snap.value as AnyObject).description
            self.sessionAubreyAppointmentsSeenValue = (snap.value as! Double)
        }
        aubreyReappointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            self.reappointmentsTextField2.placeholder = (snap.value as AnyObject).description
            self.sessionAubreyReappointmentsValue = (snap.value as! Double)
        }
        
        dawnGoalRef.observe((.value)) { (snap: DataSnapshot) in
            self.goalTextField7.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        dawnNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            self.netProductionTextField9.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionDawnNetProductionValue = (snap.value as! Int)
        }
        dawnDaysWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            self.daysWorkedTextField7.placeholder = (snap.value as AnyObject).description
            self.sessionDawnDaysWorkedValue = (snap.value as! Int)
        }
        dawnProductionPerDayRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerDayTextField7.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        dawnHoursWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberOfHoursWorkedTextField3.placeholder = (snap.value as AnyObject).description
            self.sessionDawnHoursWorkedValue = (snap.value as! Int)
        }
        dawnProductionPerHourRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerHourTextField7.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        dawnScheduledAppointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            self.scheduledAppointmentsTextField7.placeholder = (snap.value as AnyObject).description
        }
        dawnAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.appointmentsKeptTextField7.placeholder = (snap.value as AnyObject).description
        }
        dawnPercentAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentAppointmentsKeptTextField7.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 90.0 {
                self.percentAppointmentsKeptTextField7.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 80.0 && Double(snap.value as! Double) <= 89.0 {
                self.percentAppointmentsKeptTextField7.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 80.0 {
                self.percentAppointmentsKeptTextField7.backgroundColor = UIColor.red
            }
        }
        dawnPerioPercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.perioPercentTextField3.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 60.0 {
                self.perioPercentTextField3.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 40.0 && Double(snap.value as! Double) <= 59.0 {
                self.perioPercentTextField3.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 40.0 {
                self.perioPercentTextField3.backgroundColor = UIColor.red
            }
        }
        dawnFluoridePercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.fluoridePercentTextField3.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 90.0 {
                self.fluoridePercentTextField3.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 75.0 && Double(snap.value as! Double) <= 89.0 {
                self.fluoridePercentTextField3.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 75.0 {
                self.fluoridePercentTextField3.backgroundColor = UIColor.red
            }
        }
        dawnOralIDPercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.oralIdPercentTextField3.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 90.0 {
                self.oralIdPercentTextField3.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 75.0 && Double(snap.value as! Double) <= 89.0 {
                self.oralIdPercentTextField3.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 75.0 {
                self.oralIdPercentTextField3.backgroundColor = UIColor.red
            }
        }
        dawnArestinPercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.arestinPercentTextField3.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 90.0 {
                self.arestinPercentTextField3.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 75.0 && Double(snap.value as! Double) <= 89.0 {
                self.arestinPercentTextField3.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 75.0 {
                self.arestinPercentTextField3.backgroundColor = UIColor.red
            }
        }
        dawnReappointmentRateRef.observe((.value)) { (snap: DataSnapshot) in
            self.reappointmentRateTextField3.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 90.0 {
                self.reappointmentRateTextField3.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 85.0 && Double(snap.value as! Double) <= 89.0 {
                self.reappointmentRateTextField3.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 85.0 {
                self.reappointmentRateTextField3.backgroundColor = UIColor.red
            }
        }
        dawnRetentionRateRef.observe((.value)) { (snap: DataSnapshot) in
            self.retentionRateTextField7.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        dawnFluoridePresentedRef.observe((.value)) { (snap: DataSnapshot) in
            self.fluoridePresentedTextField3.placeholder = (snap.value as AnyObject).description
            self.sessionDawnFluoridePresentedValue = (snap.value as! Double)
        }
        dawnFluorideAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            self.fluorideAcceptedTextField3.placeholder = (snap.value as AnyObject).description
            self.sessionDawnFluorideAcceptedValue = (snap.value as! Double)
        }
        dawnOralIDPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            self.oralIDPresentedTextField3.placeholder = (snap.value as AnyObject).description
            self.sessionDawnOralIDPresentedValue = (snap.value as! Double)
        }
        dawnOralIDAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            self.oralIDAcceptedTextField3.placeholder = (snap.value as AnyObject).description
            self.sessionDawnOralIDAcceptedValue = (snap.value as! Double)
        }
        dawnArestinPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            self.arestinPresentedTextField3.placeholder = (snap.value as AnyObject).description
            self.sessionDawnArestinPresentedValue = (snap.value as! Double)
        }
        dawnArestinAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            self.arestinAcceptedTextField3.placeholder = (snap.value as AnyObject).description
            self.sessionDawnArestinAcceptedValue = (snap.value as! Double)
        }
        dawnAppointmentsSeenRef.observe((.value)) { (snap: DataSnapshot) in
            self.appointmentsSeenTextField3.placeholder = (snap.value as AnyObject).description
            self.sessionDawnAppointmentsSeenValue = (snap.value as! Double)
        }
        dawnReappointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            self.reappointmentsTextField3.placeholder = (snap.value as AnyObject).description
            self.sessionDawnReappointmentsValue = (snap.value as! Double)
        }
        
        sheilaGoalRef.observe((.value)) { (snap: DataSnapshot) in
            self.goalTextField8.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        sheilaNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            self.netProductionTextField10.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionSheilaNetProductionValue = (snap.value as! Int)
        }
        sheilaDaysWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            self.daysWorkedTextField8.placeholder = (snap.value as AnyObject).description
            self.sessionSheilaDaysWorkedValue = (snap.value as! Int)
        }
        sheilaProductionPerDayRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerDayTextField8.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        sheilaHoursWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberOfHoursWorkedTextField4.placeholder = (snap.value as AnyObject).description
            self.sessionSheilaHoursWorkedValue = (snap.value as! Int)
        }
        sheilaProductionPerHourRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerHourTextField8.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        sheilaScheduledAppointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            self.scheduledAppointmentsTextField8.placeholder = (snap.value as AnyObject).description
        }
        sheilaAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.appointmentsKeptTextField8.placeholder = (snap.value as AnyObject).description
        }
        sheilaPercentAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentAppointmentsKeptTextField8.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 90.0 {
                self.percentAppointmentsKeptTextField8.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 80.0 && Double(snap.value as! Double) <= 89.0 {
                self.percentAppointmentsKeptTextField8.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 80.0 {
                self.percentAppointmentsKeptTextField8.backgroundColor = UIColor.red
            }
        }
        sheilaPerioPercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.perioPercentTextField4.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 60.0 {
                self.perioPercentTextField4.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 40.0 && Double(snap.value as! Double) <= 59.0 {
                self.perioPercentTextField4.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 40.0 {
                self.perioPercentTextField4.backgroundColor = UIColor.red
            }
        }
        sheilaFluoridePercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.fluoridePercentTextField4.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 90.0 {
                self.fluoridePercentTextField4.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 75.0 && Double(snap.value as! Double) <= 89.0 {
                self.fluoridePercentTextField4.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 75.0 {
                self.fluoridePercentTextField4.backgroundColor = UIColor.red
            }
        }
        sheilaOralIDPercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.oralIdPercentTextField4.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 90.0 {
                self.oralIdPercentTextField4.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 75.0 && Double(snap.value as! Double) <= 89.0 {
                self.oralIdPercentTextField4.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 75.0 {
                self.oralIdPercentTextField4.backgroundColor = UIColor.red
            }
        }
        sheilaArestinPercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.arestinPercentTextField4.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 90.0 {
                self.arestinPercentTextField4.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 75.0 && Double(snap.value as! Double) <= 89.0 {
                self.arestinPercentTextField4.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 75.0 {
                self.arestinPercentTextField4.backgroundColor = UIColor.red
            }
        }
        sheilaReappointmentRateRef.observe((.value)) { (snap: DataSnapshot) in
            self.reappointmentRateTextField4.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 90.0 {
                self.reappointmentRateTextField4.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 85.0 && Double(snap.value as! Double) <= 89.0 {
                self.reappointmentRateTextField4.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 85.0 {
                self.reappointmentRateTextField4.backgroundColor = UIColor.red
            }
        }
        sheilaRetentionRateRef.observe((.value)) { (snap: DataSnapshot) in
            self.retentionRateTextField8.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        sheilaFluoridePresentedRef.observe((.value)) { (snap: DataSnapshot) in
            self.fluoridePresentedTextField4.placeholder = (snap.value as AnyObject).description
            self.sessionSheilaFluoridePresentedValue = (snap.value as! Double)
        }
        sheilaFluorideAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            self.fluorideAcceptedTextField4.placeholder = (snap.value as AnyObject).description
            self.sessionSheilaFluorideAcceptedValue = (snap.value as! Double)
        }
        sheilaOralIDPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            self.oralIDPresentedTextField4.placeholder = (snap.value as AnyObject).description
            self.sessionSheilaOralIDPresentedValue = (snap.value as! Double)
        }
        sheilaOralIDAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            self.oralIDAcceptedTextField4.placeholder = (snap.value as AnyObject).description
            self.sessionSheilaOralIDAcceptedValue = (snap.value as! Double)
        }
        sheilaArestinPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            self.arestinPresentedTextField4.placeholder = (snap.value as AnyObject).description
            self.sessionSheilaArestinPresentedValue = (snap.value as! Double)
        }
        sheilaArestinAcceptedRef.observe((.value )) { (snap: DataSnapshot) in
            self.arestinAcceptedTextField4.placeholder = (snap.value as AnyObject).description
            self.sessionSheilaArestinAcceptedValue = (snap.value as! Double)
        }
        sheilaAppointmentsSeenRef.observe((.value)) { (snap: DataSnapshot) in
            self.appointmentsSeenTextField4.placeholder = (snap.value as AnyObject).description
            self.sessionSheilaAppointmentsSeenValue = (snap.value as! Double)
        }
        sheilaReappointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            self.reappointmentsTextField4.placeholder = (snap.value as AnyObject).description
            self.sessionSheilaReappointmentsValue = (snap.value as! Double)
        }
        
        ashleyGoalRef.observe((.value)) { (snap: DataSnapshot) in
            self.goalTextField9.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        ashleyNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            self.netProductionTextField11.placeholder = ("$" + (snap.value as AnyObject).description)
            self.sessionAshleyNetProductionValue = (snap.value as! Int)
        }
        ashleyDaysWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            self.daysWorkedTextField9.placeholder = (snap.value as AnyObject).description
            self.sessionAshleyDaysWorkedValue = (snap.value as! Int)
        }
        ashleyProductionPerDayRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerDayTextField9.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        ashleyHoursWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberOfHoursWorkedTextField5.placeholder = (snap.value as AnyObject).description
            self.sessionAshleyHoursWorkedValue = (snap.value as! Int)
        }
        ashleyProductionPerHourRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerHourTextField9.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        ashleyScheduledAppointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            self.scheduledAppointmentsTextField9.placeholder = (snap.value as AnyObject).description
        }
        ashleyAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.appointmentsKeptTextField9.placeholder = (snap.value as AnyObject).description
        }
        ashleyPercentAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentAppointmentsKeptTextField9.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 90.0 {
                self.percentAppointmentsKeptTextField9.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 80.0 && Double(snap.value as! Double) <= 89.0 {
                self.percentAppointmentsKeptTextField9.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 80.0 {
                self.percentAppointmentsKeptTextField9.backgroundColor = UIColor.red
            }
        }
        ashleyPerioPercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.perioPercentTextField5.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 60.0 {
                self.perioPercentTextField5.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 40.0 && Double(snap.value as! Double) <= 59.0 {
                self.perioPercentTextField5.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 40.0 {
                self.perioPercentTextField5.backgroundColor = UIColor.red
            }
        }
        ashleyFluoridePercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.fluoridePercentTextField5.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 90.0 {
                self.fluoridePercentTextField5.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 75.0 && Double(snap.value as! Double) <= 89.0 {
                self.fluoridePercentTextField5.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 75.0 {
                self.fluoridePercentTextField5.backgroundColor = UIColor.red
            }
        }
        ashleyOralIDPercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.oralIdPercentTextField5.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 90.0 {
                self.oralIdPercentTextField5.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 75.0 && Double(snap.value as! Double) <= 89.0 {
                self.oralIdPercentTextField5.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 75.0 {
                self.oralIdPercentTextField5.backgroundColor = UIColor.red
            }
        }
        ashleyArestinPercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.arestinPercentTextField5.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 90.0 {
                self.arestinPercentTextField5.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 75.0 && Double(snap.value as! Double) <= 89.0 {
                self.arestinPercentTextField5.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 75.0 {
                self.arestinPercentTextField5.backgroundColor = UIColor.red
            }
        }
        ashleyReappointmentRateRef.observe((.value)) { (snap: DataSnapshot) in
            self.reappointmentRateTextField5.placeholder = ("%" + (snap.value as AnyObject).description)
            if Double(snap.value as! Double) >= 90.0 {
                self.reappointmentRateTextField5.backgroundColor = UIColor.green
            } else if Double(snap.value as! Double) >= 85.0 && Double(snap.value as! Double) <= 89.0 {
                self.reappointmentRateTextField5.backgroundColor = UIColor.yellow
            } else if Double(snap.value as! Double) < 85.0 {
                self.reappointmentRateTextField5.backgroundColor = UIColor.red
            }
        }
        ashleyRetentionRateRef.observe((.value)) { (snap: DataSnapshot) in
            self.retentionRateTextField9.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        ashleyFluoridePresentedRef.observe((.value)) { (snap: DataSnapshot) in
            self.fluoridePresentedTextField5.placeholder = (snap.value as AnyObject).description
            self.sessionAshleyFluoridePresentedValue = (snap.value as! Double)
        }
        ashleyFluorideAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            self.fluorideAcceptedTextField5.placeholder = (snap.value as AnyObject).description
            self.sessionAshleyFluorideAcceptedValue = (snap.value as! Double)
        }
        ashleyOralIDPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            self.oralIDPresentedTextField5.placeholder = (snap.value as AnyObject).description
            self.sessionAshleyOralIDPresentedValue = (snap.value as! Double)
        }
        ashleyOralIDAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            self.oralIDAcceptedTextField5.placeholder = (snap.value as AnyObject).description
            self.sessionAshleyOralIDAcceptedValue = (snap.value as! Double)
        }
        ashleyArestinPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            self.arestinPresentedTextField5.placeholder = (snap.value as AnyObject).description
            self.sessionAshleyArestinPresentedValue = (snap.value as! Double)
        }
        ashleyArestinAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            self.arestinAcceptedTextField5.placeholder = (snap.value as AnyObject).description
            self.sessionAshleyArestinAcceptedValue = (snap.value as! Double)
        }
        ashleyAppointmentsSeenRef.observe((.value)) { (snap: DataSnapshot) in
            self.appointmentsSeenTextField5.placeholder = (snap.value as AnyObject).description
            self.sessionAshleyAppointmentsSeenValue = (snap.value as! Double)
        }
        ashleyReappointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            self.reappointmentsTextField5.placeholder = (snap.value as AnyObject).description
            self.sessionAshleyReappointmentsValue = (snap.value as! Double)
        }
        
        
    } // end of view appear
    
    @objc func handleSubmition() {
        
        heatherDyerAmountPresentedRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.heatherDyerAmountPresentedTextField.text != "" {
        self.heatherDyerAmountPresentedRef.setValue(Int(self.heatherDyerAmountPresentedTextField.text!)!)
                self.heatherDyerAmountPresentedTextField.text = ""
            }
        }
        heatherDyerAmountAcceptedRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.heatherDyerAmountAcceptedTextField.text != "" {
                self.heatherDyerAmountAcceptedRef.setValue(Int(self.heatherDyerAmountAcceptedTextField.text!)!)
                self.heatherDyerAmountAcceptedTextField.text = ""
            }
        }
        heatherDyerPercentOfDollarAmountScheduledRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.sessionHeatherDyerAmountAcceptedValue >= 1 && self.sessionHeatherDyerAmountPresentedValue >= 1 {
                let percentage = Double(Double(self.sessionHeatherDyerAmountAcceptedValue / self.sessionHeatherDyerAmountPresentedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.heatherDyerPercentOfDollarAmountScheduledRef.setValue(roundedPercent)
            }
        }
        heatherDyerNumberOfPatientsPresentedTreatmentRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.heatherDyerNumberPatientsPresentedTreatmentTextField.text != "" {
                self.heatherDyerNumberOfPatientsPresentedTreatmentRef.setValue(Int(self.heatherDyerNumberPatientsPresentedTreatmentTextField.text!)!)
                self.heatherDyerNumberPatientsPresentedTreatmentTextField.text = ""
            }
        }
        heatherDyerNumberOfPatientsAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.heatherDyerNumberPatientsAcceptedTreatmentTextField.text != "" {
                self.heatherDyerNumberOfPatientsAcceptedTreatmentRef.setValue(Int(self.heatherDyerNumberPatientsAcceptedTreatmentTextField.text!)!)
                self.heatherDyerNumberPatientsAcceptedTreatmentTextField.text = ""
            }
        }
        heatherDyerPercentOfPatientAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionHeatherDyerPatientsAcceptedValue >= 1 && self.sessionHeatherDyerPatientsPresesntedValue >= 1 {
                let percentage = Double(Double(self.sessionHeatherDyerPatientsAcceptedValue / self.sessionHeatherDyerPatientsPresesntedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.heatherDyerPercentOfPatientAcceptedTreatmentRef.setValue(roundedPercent)
            }
        }
        
        //editing ends here
        //
        //
        //
        
        woodstockNetProductionRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.netProductionTextField1.text != "" {
                self.woodstockNetProductionRef.setValue(Int(self.netProductionTextField1.text!)!)
                self.netProductionTextField1.text = ""
            }
        }
        woodstockCollectionsRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.collectionsTextField1.text != "" {
                self.woodstockCollectionsRef.setValue(Int(self.collectionsTextField1.text!)!)
                self.collectionsTextField1.text = ""
            }
        }
        woodstockInsuranceCollectionsRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.insuranceCollectionsTextField1.text != "" {
                self.woodstockInsuranceCollectionsRef.setValue(Int(self.insuranceCollectionsTextField1.text!)!)
                self.insuranceCollectionsTextField1.text = ""
            }
        }
        woodstockOTCollectionsRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.otcCollectionsTextField1.text != "" {
                self.woodstockOTCollectionsRef.setValue(Int(self.otcCollectionsTextField1.text!)!)
                self.otcCollectionsTextField1.text = ""
            }
        }
        woodstockDollarAmountRefundedToInsuranceRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.amountRefundedToInsuranceTextField1.text != "" {
                self.woodstockDollarAmountRefundedToInsuranceRef.setValue(Int(self.amountRefundedToInsuranceTextField1.text!)!)
                self.amountRefundedToInsuranceTextField1.text = ""
            }
        }
        woodstockDollarAmountRefundedToPatientsRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.amountRefundedToPatientsTextField1.text != "" {
                self.woodstockDollarAmountRefundedToPatientsRef.setValue(Int(self.amountRefundedToPatientsTextField1.text!)!)
                self.amountRefundedToPatientsTextField1.text = ""
            }
        }
        woodstockPercentOTCToTotalCollectionsRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionWoodstockCollectionsValue >= 1 && self.sessionWoodstockOTCCollectionsValue >= 1 {
                let percentage = Double(Double(self.sessionWoodstockOTCCollectionsValue / self.sessionWoodstockCollectionsValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.woodstockPercentOTCToTotalCollectionsRef.setValue(roundedPercent)
            }
        }
        woodstockPercentInsuranceToTotalCollectionsRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionWoodstockInsuranceCollectionsValue >= 1 && self.sessionWoodstockCollectionsValue >= 1 {
                let percentage = Double(Double(self.sessionWoodstockInsuranceCollectionsValue / self.sessionWoodstockCollectionsValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.woodstockPercentInsuranceToTotalCollectionsRef.setValue(roundedPercent)
            }
        }
        woodstockPercentCollectionsToNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionWoodstockCollectionsValue >= 1 && self.sessionWoodstockNetProductionsValue >= 1 {
                let percentage = Double(Double(self.sessionWoodstockCollectionsValue / self.sessionWoodstockNetProductionsValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.woodstockPercentCollectionsToNetProductionRef.setValue(roundedPercent)
            }
        }
        woodstockProductionPerActiveChairRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.sessionWoodstockNetProductionsValue >= 1 {
                let value = Int(self.sessionWoodstockNetProductionsValue / 6)
                self.woodstockProductionPerActiveChairRef.setValue(value)
            }
        }
        
        kennesawNetProductionRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.netProductionTextField2.text != "" {
                self.kennesawNetProductionRef.setValue(Int(self.netProductionTextField2.text!)!)
                self.netProductionTextField2.text = ""
            }
        }
        kennesawCollectionsRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.collectionsTextField2.text != "" {
                self.kennesawCollectionsRef.setValue(Int(self.collectionsTextField2.text!)!)
                self.collectionsTextField2.text = ""
            }
        }
        kennesawInsuranceCollectionsRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.insuranceCollectionsTextField2.text != "" {
                self.kennesawInsuranceCollectionsRef.setValue(Int(self.insuranceCollectionsTextField2.text!)!)
                self.insuranceCollectionsTextField2.text = ""
            }
        }
        kennesawOTCollectionsRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.otcCollectionsTextField2.text != "" {
                self.kennesawOTCollectionsRef.setValue(Int(self.otcCollectionsTextField2.text!)!)
                self.otcCollectionsTextField2.text = ""
            }
        }
        kennesawDollarAmountRefundedToInsuranceRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.amountRefundedToInsuranceTextField2.text != "" {
                self.kennesawDollarAmountRefundedToInsuranceRef.setValue(Int(self.amountRefundedToInsuranceTextField2.text!)!)
                self.amountRefundedToInsuranceTextField2.text = ""
            }
        }
        kennesawDollarAmountRefundedToPatientsRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.amountRefundedToPatientsTextField2.text != "" {
                self.kennesawDollarAmountRefundedToPatientsRef.setValue(Int(self.amountRefundedToPatientsTextField2.text!)!)
                self.amountRefundedToPatientsTextField2.text = ""
            }
        }
        kennesawPercentOTCToTotalCollectionsRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionKennesawOTCCollectionsValue >= 1 && self.sessionKennesawCollectionsValue >= 1 {
                let percentage = Double(Double(self.sessionKennesawOTCCollectionsValue / self.sessionKennesawCollectionsValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.kennesawPercentOTCToTotalCollectionsRef.setValue(roundedPercent)
            }
        }
        kennesawPercentInsuranceToTotalCollectionsRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionKennesawInsuranceCollectionsValue >= 1 && self.sessionKennesawCollectionsValue >= 1 {
                let percentage = Double(Double(self.sessionKennesawInsuranceCollectionsValue / self.sessionKennesawCollectionsValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.kennesawPercentInsuranceToTotalCollectionsRef.setValue(roundedPercent)
            }
        }
        kennesawPercentCollectionsToNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionKennesawCollectionsValue >= 1 && self.sessionKennesawNetProductionValue >= 1 {
                let percentage = Double(Double(self.sessionKennesawCollectionsValue / self.sessionKennesawNetProductionValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.kennesawPercentCollectionsToNetProductionRef.setValue(roundedPercent)
            }
        }
        kennesawProductionPerActiveChairRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.sessionKennesawNetProductionValue >= 1 {
                let value = Int(self.sessionKennesawNetProductionValue / 10)
                self.kennesawProductionPerActiveChairRef.setValue(value)
            }
        }
        
        hollyAmountPresentedRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.amountPresentedTextField1.text != "" {
                self.hollyAmountPresentedRef.setValue(Int(self.amountPresentedTextField1.text!)!)
                self.amountPresentedTextField1.text = ""
            }
        }
        hollyAmountAcceptedRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.amountAcceptedTextField1.text != "" {
                self.hollyAmountAcceptedRef.setValue(Int(self.amountAcceptedTextField1.text!)!)
                self.amountAcceptedTextField1.text = ""
            }
        }
        hollyPercentOfDollarAmountScheduledRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.sessionHollyAmountAcceptedValue >= 1 && self.sessionHollyAmountPresentedValue >= 1 {
                let percentage = Double(Double(self.sessionHollyAmountAcceptedValue / self.sessionHollyAmountPresentedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.hollyPercentOfDollarAmountScheduledRef.setValue(roundedPercent)
            }
        }
        hollyNumberOfPatientsPresentedTreatmentRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.numberPatientsPresentedTreatmentTextField1.text != "" {
                self.hollyNumberOfPatientsPresentedTreatmentRef.setValue(Int(self.numberPatientsPresentedTreatmentTextField1.text!)!)
                self.numberPatientsPresentedTreatmentTextField1.text = ""
            }
        }
        hollyNumberOfPatientsAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.numberPatientsAcceptedTreatmentTextField1.text != "" {
                self.hollyNumberOfPatientsAcceptedTreatmentRef.setValue(Int(self.numberPatientsAcceptedTreatmentTextField1.text!)!)
                self.numberPatientsAcceptedTreatmentTextField1.text = ""
            }
        }
        hollyPercentOfPatientAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionHollyPatientsAcceptedValue >= 1 && self.sessionHollyPatientsPresesntedValue >= 1 {
                let percentage = Double(Double(self.sessionHollyPatientsAcceptedValue / self.sessionHollyPatientsPresesntedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.hollyPercentOfPatientAcceptedTreatmentRef.setValue(roundedPercent)
            }
        }
        
        sydneyAmountPresentedRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.amountPresentedTextField2.text != "" {
                self.sydneyAmountPresentedRef.setValue(Int(self.amountPresentedTextField2.text!)!)
                self.amountPresentedTextField2.text = ""
            }
        }
        sydneyAmountAcceptedRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.amountAcceptedTextField2.text != "" {
                self.sydneyAmountAcceptedRef.setValue(Int(self.amountAcceptedTextField2.text!)!)
                self.amountAcceptedTextField2.text = ""
            }
        }
        sydneyPercentOfDollarAmountScheduledRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.sessionSydneyAmountAcceptedValue >= 1 && self.sessionSydneyAmountPresentedValue >= 1 {
                let percentage = Double(Double(self.sessionSydneyAmountAcceptedValue / self.sessionSydneyAmountPresentedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.sydneyPercentOfDollarAmountScheduledRef.setValue(roundedPercent)
            }
        }
        sydneyNumberOfPatientsPresentedTreatmentRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.numberPatientsPresentedTreatmentTextField2.text != "" {
                self.sydneyNumberOfPatientsPresentedTreatmentRef.setValue(Int(self.numberPatientsPresentedTreatmentTextField2.text!)!)
                self.numberPatientsPresentedTreatmentTextField2.text = ""
            }
        }
        sydneyNumberOfPatientsAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.numberPatientsAcceptedTreatmentTextField2.text != "" {
                self.sydneyNumberOfPatientsAcceptedTreatmentRef.setValue(Int(self.numberPatientsAcceptedTreatmentTextField2.text!)!)
                self.numberPatientsAcceptedTreatmentTextField2.text = ""
            }
        }
        sydneyPercentOfPatientAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionSydneyPatientsAcceptedValue >= 1 && self.sessionSydneyPatientsPresesntedValue >= 1 {
                let percentage = Double(Double(self.sessionSydneyPatientsAcceptedValue / self.sessionSydneyPatientsPresesntedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.sydneyPercentOfPatientAcceptedTreatmentRef.setValue(roundedPercent)
            }
        }
        
        amandaAmountPresentedRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.amountPresentedTextField3.text != "" {
                self.amandaAmountPresentedRef.setValue(Int(self.amountPresentedTextField3.text!)!)
                self.amountPresentedTextField3.text = ""
            }
        }
        amandaAmountAcceptedRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.amountAcceptedTextField3.text != "" {
                self.amandaAmountAcceptedRef.setValue(Int(self.amountAcceptedTextField3.text!)!)
                self.amountAcceptedTextField3.text = ""
            }
        }
        amandaPercentOfDollarAmountScheduledRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.sessionAmandaAmountAcceptedValue >= 1 && self.sessionAmandaAmountPresentedValue >= 1 {
                let percentage = Double(Double(self.sessionAmandaAmountAcceptedValue / self.sessionAmandaAmountPresentedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.amandaPercentOfDollarAmountScheduledRef.setValue(roundedPercent)
            }
        }
        amandaNumberOfPatientsPresentedTreatmentRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.numberPatientsPresentedTreatmentTextField3.text != "" {
                self.amandaNumberOfPatientsPresentedTreatmentRef.setValue(Int(self.numberPatientsPresentedTreatmentTextField3.text!)!)
                self.numberPatientsPresentedTreatmentTextField3.text = ""
            }
        }
        amandaNumberOfPatientsAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.numberPatientsAcceptedTreatmentTextField3.text != "" {
                self.amandaNumberOfPatientsAcceptedTreatmentRef.setValue(Int(self.numberPatientsAcceptedTreatmentTextField3.text!)!)
                self.numberPatientsAcceptedTreatmentTextField3.text = ""
            }
        }
        amandaPercentOfPatientAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionAmandaPatientsAcceptedValue >= 1 && self.sessionAmandaPatientsPresesntedValue >= 1 {
                let percentage = Double(Double(self.sessionAmandaPatientsAcceptedValue / self.sessionAmandaPatientsPresesntedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.amandaPercentOfPatientAcceptedTreatmentRef.setValue(roundedPercent)
            }
        }
        
        ashleyAmountPresentedRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.amountPresentedTextField4.text != "" {
                self.ashleyAmountPresentedRef.setValue(Int(self.amountPresentedTextField4.text!)!)
                self.amountPresentedTextField4.text = ""
            }
        }
        ashleyAmountAcceptedRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.amountAcceptedTextField4.text != "" {
                self.ashleyAmountAcceptedRef.setValue(Int(self.amountAcceptedTextField4.text!)!)
                self.amountAcceptedTextField4.text = ""
            }
        }
        ashleyPercentOfDollarAmountScheduledRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.sessionAshleyGAmountAcceptedValue >= 1 && self.sessionAshleyGAmountPresentedValue >= 1 {
                let percentage = Double(Double(self.sessionAshleyGAmountAcceptedValue / self.sessionAshleyGAmountPresentedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.ashleyPercentOfDollarAmountScheduledRef.setValue(roundedPercent)
            }
        }
        ashleyNumberOfPatientsPresentedTreatmentRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.numberPatientsPresentedTreatmentTextField4.text != "" {
                self.ashleyNumberOfPatientsPresentedTreatmentRef.setValue(Int(self.numberPatientsPresentedTreatmentTextField4.text!)!)
                self.numberPatientsPresentedTreatmentTextField4.text = ""
            }
        }
        ashleyNumberOfPatientsAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.numberPatientsAcceptedTreatmentTextField4.text != "" {
                self.ashleyNumberOfPatientsAcceptedTreatmentRef.setValue(Int(self.numberPatientsAcceptedTreatmentTextField4.text!)!)
                self.numberPatientsAcceptedTreatmentTextField4.text = ""
            }
        }
        ashleyPercentOfPatientAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionAshleyGPatientsAcceptedValue >= 1 && self.sessionAshleyGPatientsPresesntedValue >= 1 {
                let percentage = Double(Double(self.sessionAshleyGPatientsAcceptedValue / self.sessionAshleyGPatientsPresesntedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.ashleyPercentOfPatientAcceptedTreatmentRef.setValue(roundedPercent)
            }
        }
        
        debbieAmountPresentedRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.amountPresentedTextField5.text != "" {
                self.debbieAmountPresentedRef.setValue(Int(self.amountPresentedTextField5.text!)!)
                self.amountPresentedTextField5.text = ""
            }
        }
        debbieAmountAcceptedRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.amountAcceptedTextField5.text != "" {
                self.debbieAmountAcceptedRef.setValue(Int(self.amountAcceptedTextField5.text!)!)
                self.amountAcceptedTextField5.text = ""
            }
        }
        debbiePercentOfDollarAmountScheduledRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.sessionDebbieDAmountAcceptedValue >= 1 && self.sessionDebbieDAmountPresentedValue >= 1 {
                let percentage = Double(Double(self.sessionDebbieDAmountAcceptedValue / self.sessionDebbieDAmountPresentedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.debbiePercentOfDollarAmountScheduledRef.setValue(roundedPercent)
            }
        }
        debbieNumberOfPatientsPresentedTreatmentRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.numberPatientsPresentedTreatmentTextField5.text != "" {
                self.debbieNumberOfPatientsPresentedTreatmentRef.setValue(Int(self.numberPatientsPresentedTreatmentTextField5.text!)!)
                self.numberPatientsPresentedTreatmentTextField5.text = ""
            }
        }
        debbieNumberOfPatientsAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.numberPatientsAcceptedTreatmentTextField5.text != "" {
                self.debbieNumberOfPatientsAcceptedTreatmentRef.setValue(Int(self.numberPatientsAcceptedTreatmentTextField5.text!)!)
                self.numberPatientsAcceptedTreatmentTextField5.text = ""
            }
        }
        debbiePercentOfPatientAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionDebbieDPatientsAcceptedValue >= 1 && self.sessionDebbieDPatientsPresesntedValue >= 1 {
                let percentage = Double(Double(self.sessionDebbieDPatientsAcceptedValue / self.sessionDebbieDPatientsPresesntedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.debbiePercentOfPatientAcceptedTreatmentRef.setValue(roundedPercent)
            }
        }
        
        annaAmountPresentedRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.amountPresentedTextField6.text != "" {
                self.annaAmountPresentedRef.setValue(Int(self.amountPresentedTextField6.text!)!)
                self.amountPresentedTextField6.text = ""
            }
        }
        annaAmountAcceptedRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.amountAcceptedTextField6.text != "" {
                self.annaAmountAcceptedRef.setValue(Int(self.amountAcceptedTextField6.text!)!)
                self.amountAcceptedTextField6.text = ""
            }
        }
        annaPercentOfDollarAmountScheduledRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.sessionAnnaCAmountAcceptedValue >= 1 && self.sessionAnnaCAmountPresentedValue >= 1 {
                let percentage = Double(Double(self.sessionAnnaCAmountAcceptedValue / self.sessionAnnaCAmountPresentedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.annaPercentOfDollarAmountScheduledRef.setValue(roundedPercent)
            }
        }
        annaNumberOfPatientsPresentedTreatmentRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.numberPatientsPresentedTreatmentTextField6.text != "" {
                self.annaNumberOfPatientsPresentedTreatmentRef.setValue(Int(self.numberPatientsPresentedTreatmentTextField6.text!)!)
                self.numberPatientsPresentedTreatmentTextField6.text = ""
            }
        }
        annaNumberOfPatientsAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.numberPatientsAcceptedTreatmentTextField6.text != "" {
                self.annaNumberOfPatientsAcceptedTreatmentRef.setValue(Int(self.numberPatientsAcceptedTreatmentTextField6.text!)!)
                self.numberPatientsAcceptedTreatmentTextField6.text = ""
            }
        }
        annaPercentOfPatientAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionAnnaCPatientsAcceptedValue >= 1 && self.sessionAnnaCPatientsPresesntedValue >= 1 {
                let percentage = Double(Double(self.sessionAnnaCPatientsAcceptedValue / self.sessionAnnaCPatientsPresesntedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.annaPercentOfPatientAcceptedTreatmentRef.setValue(roundedPercent)
            }
        }
        
        jessicaAmountPresentedRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.amountPresentedTextField7.text != "" {
                self.jessicaAmountPresentedRef.setValue(Int(self.amountPresentedTextField7.text!)!)
                self.amountPresentedTextField7.text = ""
            }
        }
        jessicaAmountAcceptedRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.amountAcceptedTextField7.text != "" {
                self.jessicaAmountAcceptedRef.setValue(Int(self.amountAcceptedTextField7.text!)!)
                self.amountAcceptedTextField7.text = ""
            }
        }
        jessicaPercentOfDollarAmountScheduledRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.sessionJessicaAmountAcceptedValue >= 1 && self.sessionJessicaAmountPresentedValue >= 1 {
                let percentage = Double(Double(self.sessionJessicaAmountAcceptedValue / self.sessionJessicaAmountPresentedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.jessicaPercentOfDollarAmountScheduledRef.setValue(roundedPercent)
            }
        }
        jessicaNumberOfPatientsPresentedTreatmentRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.numberPatientsPresentedTreatmentTextField7.text != "" {
                self.jessicaNumberOfPatientsPresentedTreatmentRef.setValue(Int(self.numberPatientsPresentedTreatmentTextField7.text!)!)
                self.numberPatientsPresentedTreatmentTextField7.text = ""
            }
        }
        jessicaNumberOfPatientsAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.numberPatientsAcceptedTreatmentTextField7.text != "" {
                self.jessicaNumberOfPatientsAcceptedTreatmentRef.setValue(Int(self.numberPatientsAcceptedTreatmentTextField7.text!)!)
                self.numberPatientsAcceptedTreatmentTextField7.text = ""
            }
        }
        jessicaPercentOfPatientAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionJessicaPatientsAcceptedValue >= 1 && self.sessionJessicaPatientsPresesntedValue >= 1 {
                let percentage = Double(Double(self.sessionJessicaPatientsAcceptedValue / self.sessionJessicaPatientsPresesntedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.jessicaPercentOfPatientAcceptedTreatmentRef.setValue(roundedPercent)
            }
        }
        
        drVGoalRef.observe((.value)) { (snap: DataSnapshot) in
            if self.goalTextField1.text != "" {
                self.drVGoalRef.setValue(Int(self.goalTextField1.text!)!)
                self.goalTextField1.text = ""
            }
        }
        drVNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            if self.netProductionTextField3.text != "" {
                self.drVNetProductionRef.setValue(Int(self.netProductionTextField3.text!)!)
                self.netProductionTextField3.text = ""
            }
        }
        drVDaysWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.daysWorkedTextField1.text != "" {
                self.drVDaysWorkedRef.setValue(Int(self.daysWorkedTextField1.text!)!)
                self.daysWorkedTextField1.text = ""
            }
        }
        drVProductionPerDayRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionDrVNetProductionValue >= 1 && self.sessionDrVDaysWorkedValue >= 1 {
                let result = Int(Int(self.sessionDrVNetProductionValue) / Int(self.sessionDrVDaysWorkedValue))
                self.drVProductionPerDayRef.setValue(result)
            }
        }
        drVProductionPerHourRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionDrVDaysWorkedValue >= 1 && self.sessionDrVNetProductionValue >= 1 {
                let hours = Int(Int(self.sessionDrVDaysWorkedValue) * 8)
                let result = Int(Int(self.sessionDrVNetProductionValue) / hours)
                self.drVProductionPerHourRef.setValue(result)
            }
        }
        drVDollarAmountSameDayTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.dollarAmountSameDayTreatmentTextField1.text != "" {
                self.drVDollarAmountSameDayTreatmentRef.setValue(Int(self.dollarAmountSameDayTreatmentTextField1.text!)!)
                self.dollarAmountSameDayTreatmentTextField1.text = ""
            }
        }
        drVScheduledAppointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            if self.scheduledAppointmentsTextField1.text != "" {
                self.drVScheduledAppointmentsRef.setValue(Int(self.scheduledAppointmentsTextField1.text!)!)
                self.scheduledAppointmentsTextField1.text = ""
            }
        }
        drVAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            if self.appointmentsKeptTextField1.text != "" {
                self.drVAppointmentsKeptRef.setValue(Int(self.appointmentsKeptTextField1.text!)!)
                self.appointmentsKeptTextField1.text = ""
            }
        }
        drVPercentAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionDrVAppointmentsKeptValue >= 1 && self.sessionDrVScheduledAppointmentsValue >= 1 {
                let percentage = Double(Double(self.sessionDrVAppointmentsKeptValue / self.sessionDrVScheduledAppointmentsValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.drVPercentAppointmentsKeptRef.setValue(roundedPercent)
            }
        }
        drVRetentionRateRef.observe((.value)) { (snap: DataSnapshot) in
            if self.retentionRateTextField1.text != "" {
                self.drVRetentionRateRef.setValue(Int(self.retentionRateTextField1.text!)!)
                self.retentionRateTextField1.text = ""
            }
        }
        
        drMcreeGoalRef.observe((.value)) { (snap: DataSnapshot) in
            if self.goalTextField2.text != "" {
                self.drMcreeGoalRef.setValue(Int(self.goalTextField2.text!)!)
                self.goalTextField2.text = ""
            }
        }
        drMcreeNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            if self.netProductionTextField4.text != "" {
                self.drMcreeNetProductionRef.setValue(Int(self.netProductionTextField4.text!)!)
                self.netProductionTextField4.text = ""
            }
        }
        drMcreeDaysWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.daysWorkedTextField2.text != "" {
                self.drMcreeDaysWorkedRef.setValue(Int(self.daysWorkedTextField2.text!)!)
                self.daysWorkedTextField2.text = ""
            }
        }
        drMcreeProductionPerDayRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionDrMcreeNetProductionValue >= 1 && self.sessionDrMcreeDaysWorkedValue >= 1 {
                let result = Int(Int(self.sessionDrMcreeNetProductionValue) / Int(self.sessionDrMcreeDaysWorkedValue))
                self.drMcreeProductionPerDayRef.setValue(result)
            }
        }
        drMcreeProductionPerHourRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionDrMcreeDaysWorkedValue >= 1 && self.sessionDrMcreeNetProductionValue >= 1 {
                let hours = Int(Int(self.sessionDrMcreeDaysWorkedValue) * 8)
                let result = Int(Int(self.sessionDrMcreeNetProductionValue) / hours)
                self.drMcreeProductionPerHourRef.setValue(result)
            }
        }
        drMcreeDollarAmountSameDayTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.dollarAmountSameDayTreatmentTextField2.text != "" {
                self.drMcreeDollarAmountSameDayTreatmentRef.setValue(Int(self.dollarAmountSameDayTreatmentTextField2.text!)!)
                self.dollarAmountSameDayTreatmentTextField2.text = ""
            }
        }
        drMcreeScheduledAppointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            if self.scheduledAppointmentsTextField2.text != "" {
                self.drMcreeScheduledAppointmentsRef.setValue(Int(self.scheduledAppointmentsTextField2.text!)!)
                self.scheduledAppointmentsTextField2.text = ""
            }
        }
        drMcreeAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            if self.appointmentsKeptTextField2.text != "" {
                self.drMcreeAppointmentsKeptRef.setValue(Int(self.appointmentsKeptTextField2.text!)!)
                self.appointmentsKeptTextField2.text = ""
            }
        }
        drMcreePercentAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionDrMcreeAppointmentsKeptValue >= 1 && self.sessionDrMcreeScheduledAppointmentsValue >= 1 {
                let percentage = Double(Double(self.sessionDrMcreeAppointmentsKeptValue / self.sessionDrMcreeScheduledAppointmentsValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.drMcreePercentAppointmentsKeptRef.setValue(roundedPercent)
            }
        }
        drMcreeRetentionRateRef.observe((.value)) { (snap: DataSnapshot) in
            if self.retentionRateTextField2.text != "" {
                self.drMcreeRetentionRateRef.setValue(Int(self.retentionRateTextField2.text!)!)
                self.retentionRateTextField2.text = ""
            }
        }
        
        drOrzaGoalRef.observe((.value)) { (snap: DataSnapshot) in
            if self.goalTextField3.text != "" {
                self.drOrzaGoalRef.setValue(Int(self.goalTextField3.text!)!)
                self.goalTextField3.text = ""
            }
        }
        drOrzaNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            if self.netProductionTextField5.text != "" {
                self.drOrzaNetProductionRef.setValue(Int(self.netProductionTextField5.text!)!)
                self.netProductionTextField5.text = ""
            }
        }
        drOrzaDaysWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.daysWorkedTextField3.text != "" {
                self.drOrzaDaysWorkedRef.setValue(Int(self.daysWorkedTextField3.text!)!)
                self.daysWorkedTextField3.text = ""
            }
        }
        drOrzaProductionPerDayRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionDrOrzaNetProductionValue >= 1 && self.sessionDrOrzaDaysWorkedValue >= 1 {
                let result = Int(Int(self.sessionDrOrzaNetProductionValue) / Int(self.sessionDrOrzaDaysWorkedValue))
                self.drOrzaProductionPerDayRef.setValue(result)
            }
        }
        drOrzaProductionPerHourRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionDrOrzaDaysWorkedValue >= 1 && self.sessionDrOrzaNetProductionValue >= 1 {
                let hours = Int(Int(self.sessionDrOrzaDaysWorkedValue) * 8)
                let result = Int(Int(self.sessionDrOrzaNetProductionValue) / hours)
                self.drOrzaProductionPerHourRef.setValue(result)
            }
        }
        drOrzaDollarAmountSameDayTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.dollarAmountSameDayTreatmentTextField3.text != "" {
                self.drOrzaDollarAmountSameDayTreatmentRef.setValue(Int(self.dollarAmountSameDayTreatmentTextField3.text!)!)
                self.dollarAmountSameDayTreatmentTextField3.text = ""
            }
        }
        drOrzaScheduledAppointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            if self.scheduledAppointmentsTextField3.text != "" {
                self.drOrzaScheduledAppointmentsRef.setValue(Int(self.scheduledAppointmentsTextField3.text!)!)
                self.scheduledAppointmentsTextField3.text = ""
            }
        }
        drOrzaAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in // this is where we left off :)
            if self.appointmentsKeptTextField3.text != "" {
                self.drOrzaAppointmentsKeptRef.setValue(Int(self.appointmentsKeptTextField3.text!)!)
                self.appointmentsKeptTextField3.text = ""
            }
        }
        drOrzaPercentAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionDrOrzaAppointmentsKeptValue >= 1 && self.sessionDrOrzaScheduledAppointmentsValue >= 1 {
                let percentage = Double(Double(self.sessionDrOrzaAppointmentsKeptValue / self.sessionDrOrzaScheduledAppointmentsValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.drOrzaPercentAppointmentsKeptRef.setValue(roundedPercent)
            }
        }
        drOrzaRetentionRateRef.observe((.value)) { (snap: DataSnapshot) in
            if self.retentionRateTextField3.text != "" {
                self.drOrzaRetentionRateRef.setValue(Int(self.retentionRateTextField3.text!)!)
                self.retentionRateTextField3.text = ""
            }
        }
        
        drFranGoalRef.observe((.value)) { (snap: DataSnapshot) in
            if self.goalTextField4.text != "" {
                self.drFranGoalRef.setValue(Int(self.goalTextField4.text!)!)
                self.goalTextField4.text = ""
            }
        }
        drFranNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            if self.netProductionTextField6.text != "" {
                self.drFranNetProductionRef.setValue(Int(self.netProductionTextField6.text!)!)
                self.netProductionTextField6.text = ""
            }
        }
        drFranDaysWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.daysWorkedTextField4.text != "" {
                self.drFranDaysWorkedRef.setValue(Int(self.daysWorkedTextField4.text!)!)
                self.daysWorkedTextField4.text = ""
            }
        }
        drFranProductionPerDayRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionDrFranNetProductionValue >= 1 && self.sessionDrFranDaysWorkedValue >= 1 {
                let result = Int(Int(self.sessionDrFranNetProductionValue) / Int(self.sessionDrFranDaysWorkedValue))
                self.drFranProductionPerDayRef.setValue(result)
            }
        }
        drFranProductionPerHourRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionDrFranDaysWorkedValue >= 1 && self.sessionDrFranNetProductionValue >= 1 {
                let hours = Int(Int(self.sessionDrFranDaysWorkedValue) * 8)
                let result = Int(Int(self.sessionDrFranNetProductionValue) / hours)
                self.drFranProductionPerHourRef.setValue(result)
            }
        }
        drFranDollarAmountSameDayTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.dollarAmountSameDayTreatmentTextField4.text != "" {
                self.drFranDollarAmountSameDayTreatmentRef.setValue(Int(self.dollarAmountSameDayTreatmentTextField4.text!)!)
                self.dollarAmountSameDayTreatmentTextField4.text = ""
            }
        }
        drFranScheduledAppointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            if self.scheduledAppointmentsTextField4.text != "" {
                self.drFranScheduledAppointmentsRef.setValue(Int(self.scheduledAppointmentsTextField4.text!)!)
                self.scheduledAppointmentsTextField4.text = ""
            }
        }
        drFranAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in // this is where we left off :)
            if self.appointmentsKeptTextField4.text != "" {
                self.drFranAppointmentsKeptRef.setValue(Int(self.appointmentsKeptTextField4.text!)!)
                self.appointmentsKeptTextField4.text = ""
            }
        }
        drFranPercentAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionDrFranAppointmentsKeptValue >= 1 && self.sessionDrFranScheduledAppointmentsValue >= 1 {
                let percentage = Double(Double(self.sessionDrFranAppointmentsKeptValue / self.sessionDrFranScheduledAppointmentsValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.drFranPercentAppointmentsKeptRef.setValue(roundedPercent)
            }
        }
        drFranRetentionRateRef.observe((.value)) { (snap: DataSnapshot) in
            if self.retentionRateTextField4.text != "" {
                self.drFranRetentionRateRef.setValue(Int(self.retentionRateTextField4.text!)!)
                self.retentionRateTextField4.text = ""
            }
        }
        
        amyGoalRef.observe((.value)) { (snap: DataSnapshot) in
            if self.goalTextField5.text != "" {
                self.amyGoalRef.setValue(Int(self.goalTextField5.text!)!)
                self.goalTextField5.text = ""
            }
        }
        amyNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            if self.netProductionTextField7.text != "" {
                self.amyNetProductionRef.setValue(Int(self.netProductionTextField7.text!)!)
                self.netProductionTextField7.text = ""
            }
        }
        amyDaysWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.daysWorkedTextField5.text != "" {
                self.amyDaysWorkedRef.setValue(Int(self.daysWorkedTextField5.text!)!)
                self.daysWorkedTextField5.text = ""
            }
        }
        amyProductionPerDayRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionAmyNetProductionValue >= 1 && self.sessionAmyDaysWorkedValue >= 1 {
                let result = Int(Int(self.sessionAmyNetProductionValue) / Int(self.sessionAmyDaysWorkedValue))
                self.amyProductionPerDayRef.setValue(result)
            }
        }
        amyHoursWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.numberOfHoursWorkedTextField1.text != "" {
                self.amyHoursWorkedRef.setValue(Int(self.numberOfHoursWorkedTextField1.text!)!)
                self.numberOfHoursWorkedTextField1.text = ""
            }
        }
        amyProductionPerHourRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionAmyNetProductionValue >= 1 && self.sessionAmyHoursWorkedValue >= 1 {
                let result = Int(Int(self.sessionAmyNetProductionValue) / Int(self.sessionAmyHoursWorkedValue))
                self.amyProductionPerHourRef.setValue(result)
            }
        }
        amyScheduledAppointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            if self.scheduledAppointmentsTextField5.text != "" {
                self.amyScheduledAppointmentsRef.setValue(Int(self.scheduledAppointmentsTextField5.text!)!)
                self.scheduledAppointmentsTextField5.text = ""
            }
        }
        amyAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            if self.appointmentsKeptTextField5.text != "" {
                self.amyAppointmentsKeptRef.setValue(Int(self.appointmentsKeptTextField5.text!)!)
                self.appointmentsKeptTextField5.text = ""
            }
        }
        amyPercentAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionAmyAppointmentsKeptValue >= 1 && self.sessionAmyScheduledAppointmentsValue >= 1 {
                let percentage = Double(Double(self.sessionAmyAppointmentsKeptValue / self.sessionAmyScheduledAppointmentsValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.amyPercentAppointmentsKeptRef.setValue(roundedPercent)
            }
        }
        amyPerioPercentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.perioPercentTextField1.text != "" {
                self.amyPerioPercentRef.setValue(Int(self.perioPercentTextField1.text!)!)
                self.perioPercentTextField1.text = ""
            }
        }
        amyFluoridePresentedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.fluoridePresentedTextField1.text != "" {
                self.amyFluoridePresentedRef.setValue(Int(self.fluoridePresentedTextField1.text!)!)
                self.fluoridePresentedTextField1.text = ""
            }
        }
        amyFluorideAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.fluorideAcceptedTextField1.text != "" {
                self.amyFluorideAcceptedRef.setValue(Int(self.fluorideAcceptedTextField1.text!)!)
                self.fluorideAcceptedTextField1.text = ""
            }
        }
        amyFluoridePercentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionAmyFluorideAcceptedValue >= 1 && self.sessionAmyFluoridePresentedValue >= 1 {
                let percentage = Double(Double(self.sessionAmyFluorideAcceptedValue / self.sessionAmyFluoridePresentedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.amyFluoridePercentRef.setValue(roundedPercent)
            }
        }
        amyOralIDPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.oralIDPresentedTextField1.text != "" {
                self.amyOralIDPresentedRef.setValue(Int(self.oralIDPresentedTextField1.text!)!)
                self.oralIDPresentedTextField1.text = ""
            }
        }
        amyOralIDAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.oralIDAcceptedTextField1.text != "" {
                self.amyOralIDAcceptedRef.setValue(Int(self.oralIDAcceptedTextField1.text!)!)
                self.oralIDAcceptedTextField1.text = ""
            }
        }
        amyOralIDPercentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionAmyOralIDAcceptedValue >= 1 && self.sessionAmyOralIDPresentedValue >= 1 {
                let percentage = Double(Double(self.sessionAmyOralIDAcceptedValue / self.sessionAmyOralIDPresentedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.amyOralIDPercentRef.setValue(roundedPercent)
            }
        }
        amyArestinPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.arestinPresentedTextField1.text != "" {
                self.amyArestinPresentedRef.setValue(Int(self.arestinPresentedTextField1.text!)!)
                self.arestinPresentedTextField1.text = ""
            }
        }
        amyArestinAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.arestinAcceptedTextField1.text != "" {
                self.amyArestinAcceptedRef.setValue(Int(self.arestinAcceptedTextField1.text!)!)
                self.arestinAcceptedTextField1.text = ""
            }
        }
        amyArestinPercentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionAmyArestinAcceptedValue >= 1 && self.sessionAmyArestinPresentedValue >= 1 {
                let percentage = Double(Double(self.sessionAmyArestinAcceptedValue / self.sessionAmyArestinPresentedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.amyArestinPercentRef.setValue(roundedPercent)
            }
        }
        amyAppointmentsSeenRef.observe((.value)) { (snap: DataSnapshot) in
            if self.appointmentsSeenTextField1.text != "" {
                self.amyAppointmentsSeenRef.setValue(Int(self.appointmentsSeenTextField1.text!)!)
                self.appointmentsSeenTextField1.text = ""
            }
        }
        amyReappointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            if self.reappointmentsTextField1.text != "" {
                self.amyReappointmentsRef.setValue(Int(self.reappointmentsTextField1.text!)!)
                self.reappointmentsTextField1.text = ""
            }
        }
        amyReappointmentRateRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionAmyReappointmentsValue >= 1 && self.sessionAmyAppointmentsSeenValue >= 1 {
                let percentage = Double(Double(self.sessionAmyReappointmentsValue / self.sessionAmyAppointmentsSeenValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.amyReappointmentRateRef.setValue(roundedPercent)
            }
        }
        amyRetentionRateRef.observe((.value)) { (snap: DataSnapshot) in
            if self.retentionRateTextField5.text != "" {
                self.amyRetentionRateRef.setValue(Int(self.retentionRateTextField5.text!)!)
                self.retentionRateTextField5.text = ""
            }
        }
        
        aubreyGoalRef.observe((.value)) { (snap: DataSnapshot) in
            if self.goalTextField6.text != "" {
                self.aubreyGoalRef.setValue(Int(self.goalTextField6.text!)!)
                self.goalTextField6.text = ""
            }
        }
        aubreyNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            if self.netProductionTextField8.text != "" {
                self.aubreyNetProductionRef.setValue(Int(self.netProductionTextField8.text!)!)
                self.netProductionTextField8.text = ""
            }
        }
        aubreyDaysWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.daysWorkedTextField6.text != "" {
                self.aubreyDaysWorkedRef.setValue(Int(self.daysWorkedTextField6.text!)!)
                self.daysWorkedTextField6.text = ""
            }
        }
        aubreyProductionPerDayRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionAubreyNetProductionValue >= 1 && self.sessionAubreyDaysWorkedValue >= 1 {
                let result = Int(Int(self.sessionAubreyNetProductionValue) / Int(self.sessionAubreyDaysWorkedValue))
                self.aubreyProductionPerDayRef.setValue(result)
            }
        }
        aubreyHoursWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.numberOfHoursWorkedTextField2.text != "" {
                self.aubreyHoursWorkedRef.setValue(Int(self.numberOfHoursWorkedTextField2.text!)!)
                self.numberOfHoursWorkedTextField2.text = ""
            }
        }
        aubreyProductionPerHourRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionAubreyNetProductionValue >= 1 && self.sessionAubreyHoursWorkedValue >= 1 {
                let result = Int(Int(self.sessionAubreyNetProductionValue) / Int(self.sessionAubreyHoursWorkedValue))
                self.aubreyProductionPerHourRef.setValue(result)
            }
        }
        aubreyScheduledAppointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            if self.scheduledAppointmentsTextField6.text != "" {
                self.aubreyScheduledAppointmentsRef.setValue(Int(self.scheduledAppointmentsTextField6.text!)!)
                self.scheduledAppointmentsTextField6.text = ""
            }
        }
        aubreyAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            if self.appointmentsKeptTextField6.text != "" {
                self.aubreyAppointmentsKeptRef.setValue(Int(self.appointmentsKeptTextField6.text!)!)
                self.appointmentsKeptTextField6.text = ""
            }
        }
        aubreyPercentAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionAubreyAppointmentsKeptValue >= 1 && self.sessionAubreyScheduledAppointmentsValue >= 1 {
                let percentage = Double(Double(self.sessionAubreyAppointmentsKeptValue / self.sessionAubreyScheduledAppointmentsValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.aubreyPercentAppointmentsKeptRef.setValue(roundedPercent)
            }
        }
        aubreyPerioPercentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.perioPercentTextField2.text != "" {
                self.aubreyPerioPercentRef.setValue(Int(self.perioPercentTextField2.text!)!)
                self.perioPercentTextField2.text = ""
            }
        }
        aubreyFluoridePresentedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.fluoridePresentedTextField2.text != "" {
                self.aubreyFluoridePresentedRef.setValue(Int(self.fluoridePresentedTextField2.text!)!)
                self.fluoridePresentedTextField2.text = ""
            }
        }
        aubreyFluorideAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.fluorideAcceptedTextField2.text != "" {
                self.aubreyFluorideAcceptedRef.setValue(Int(self.fluorideAcceptedTextField2.text!)!)
                self.fluorideAcceptedTextField2.text = ""
            }
        }
        aubreyFluoridePercentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionAubreyFluorideAcceptedValue >= 1 && self.sessionAubreyFluoridePresentedValue >= 1 {
                let percentage = Double(Double(self.sessionAubreyFluorideAcceptedValue / self.sessionAubreyFluoridePresentedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.aubreyFluoridePercentRef.setValue(roundedPercent)
            }
        }
        aubreyOralIDPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.oralIDPresentedTextField2.text != "" {
                self.aubreyOralIDPresentedRef.setValue(Int(self.oralIDPresentedTextField2.text!)!)
                self.oralIDPresentedTextField2.text = ""
            }
        }
        aubreyOralIDAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.oralIDAcceptedTextField2.text != "" {
                self.aubreyOralIDAcceptedRef.setValue(Int(self.oralIDAcceptedTextField2.text!)!)
                self.oralIDAcceptedTextField2.text = ""
            }
        }
        aubreyOralIDPercentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionAubreyOralIDAcceptedValue >= 1 && self.sessionAubreyOralIDPresentedValue >= 1 {
                let percentage = Double(Double(self.sessionAubreyOralIDAcceptedValue / self.sessionAubreyOralIDPresentedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.aubreyOralIDPercentRef.setValue(roundedPercent)
            }
        }
        aubreyArestinPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.arestinPresentedTextField2.text != "" {
                self.aubreyArestinPresentedRef.setValue(Int(self.arestinPresentedTextField2.text!)!)
                self.arestinPresentedTextField2.text = ""
            }
        }
        aubreyArestinAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.arestinAcceptedTextField2.text != "" {
                self.aubreyArestinAcceptedRef.setValue(Int(self.arestinAcceptedTextField2.text!)!)
                self.arestinAcceptedTextField2.text = ""
            }
        }
        aubreyArestinPercentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionAubreyArestinAcceptedValue >= 1 && self.sessionAubreyArestinPresentedValue >= 1{
                let percentage = Double(Double(self.sessionAubreyArestinAcceptedValue / self.sessionAubreyArestinPresentedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.aubreyArestinPercentRef.setValue(roundedPercent)
            }
        }
        aubreyAppointmentsSeenRef.observe((.value)) { (snap: DataSnapshot) in
            if self.appointmentsSeenTextField2.text != "" {
                self.aubreyAppointmentsSeenRef.setValue(Int(self.appointmentsSeenTextField2.text!)!)
                self.appointmentsSeenTextField2.text = ""
            }
        }
        aubreyReappointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            if self.reappointmentsTextField2.text != "" {
                self.aubreyReappointmentsRef.setValue(Int(self.reappointmentsTextField2.text!)!)
                self.reappointmentsTextField2.text = ""
            }
        }
        aubreyReappointmentRateRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionAubreyReappointmentsValue >= 1 && self.sessionAubreyAppointmentsSeenValue >= 1 {
                let percentage = Double(Double(self.sessionAubreyReappointmentsValue / self.sessionAubreyAppointmentsSeenValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.aubreyReappointmentRateRef.setValue(roundedPercent)
            }
        }
        aubreyRetentionRateRef.observe((.value)) { (snap: DataSnapshot) in
            if self.retentionRateTextField6.text != "" {
                self.aubreyRetentionRateRef.setValue(Int(self.retentionRateTextField6.text!)!)
                self.retentionRateTextField6.text = ""
            }
        }
        
        dawnGoalRef.observe((.value)) { (snap: DataSnapshot) in
            if self.goalTextField7.text != "" {
                self.dawnGoalRef.setValue(Int(self.goalTextField7.text!)!)
                self.goalTextField7.text = ""
            }
        }
        dawnNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            if self.netProductionTextField9.text != "" {
                self.dawnNetProductionRef.setValue(Int(self.netProductionTextField9.text!)!)
                self.netProductionTextField9.text = ""
            }
        }
        dawnDaysWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.daysWorkedTextField7.text != "" {
                self.dawnDaysWorkedRef.setValue(Int(self.daysWorkedTextField7.text!)!)
                self.daysWorkedTextField7.text = ""
            }
        }
        dawnProductionPerDayRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionDawnNetProductionValue >= 1 && self.sessionDawnDaysWorkedValue >= 1 {
                let result = Int(Int(self.sessionDawnNetProductionValue) / Int(self.sessionDawnDaysWorkedValue))
                self.dawnProductionPerDayRef.setValue(result)
            }
        }
        dawnHoursWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.numberOfHoursWorkedTextField3.text != "" {
                self.dawnHoursWorkedRef.setValue(Int(self.numberOfHoursWorkedTextField3.text!)!)
                self.numberOfHoursWorkedTextField3.text = ""
            }
        }
        dawnProductionPerHourRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionDawnNetProductionValue >= 1 && self.sessionDawnHoursWorkedValue >= 1 {
                let result = Int(Int(self.sessionDawnNetProductionValue) / Int(self.sessionDawnHoursWorkedValue))
                self.dawnProductionPerHourRef.setValue(result)
            }
        }
        dawnScheduledAppointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            if self.scheduledAppointmentsTextField7.text != "" {
                self.dawnScheduledAppointmentsRef.setValue(Int(self.scheduledAppointmentsTextField7.text!)!)
                self.scheduledAppointmentsTextField7.text = ""
            }
        }
        dawnAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            if self.appointmentsKeptTextField7.text != "" {
                self.dawnAppointmentsKeptRef.setValue(Int(self.appointmentsKeptTextField7.text!)!)
                self.appointmentsKeptTextField7.text = ""
            }
        }
        dawnPercentAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionDawnAppointmentsKeptValue >= 1 && self.sessionDawnScheduledAppointmentsValue >= 1 {
                let percentage = Double(Double(self.sessionDawnAppointmentsKeptValue / self.sessionDawnScheduledAppointmentsValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.dawnPercentAppointmentsKeptRef.setValue(roundedPercent)
            }
        }
        dawnPerioPercentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.perioPercentTextField3.text != "" {
                self.dawnPerioPercentRef.setValue(Int(self.perioPercentTextField3.text!)!)
                self.perioPercentTextField3.text = ""
            }
        }
        dawnFluoridePresentedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.fluoridePresentedTextField3.text != "" {
                self.dawnFluoridePresentedRef.setValue(Int(self.fluoridePresentedTextField3.text!)!)
                self.fluoridePresentedTextField3.text = ""
            }
        }
        dawnFluorideAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.fluorideAcceptedTextField3.text != "" {
                self.dawnFluorideAcceptedRef.setValue(Int(self.fluorideAcceptedTextField3.text!)!)
                self.fluorideAcceptedTextField3.text = ""
            }
        }
        dawnFluoridePercentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionDawnFluorideAcceptedValue >= 1 && self.sessionDawnFluoridePresentedValue >= 1 {
                let percentage = Double(Double(self.sessionDawnFluorideAcceptedValue / self.sessionDawnFluoridePresentedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.dawnFluoridePercentRef.setValue(roundedPercent)
            }
        }
        dawnOralIDPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.oralIDPresentedTextField3.text != "" {
                self.dawnOralIDPresentedRef.setValue(Int(self.oralIDPresentedTextField3.text!)!)
                self.oralIDPresentedTextField3.text = ""
            }
        }
        dawnOralIDAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.oralIDAcceptedTextField3.text != "" {
                self.dawnOralIDAcceptedRef.setValue(Int(self.oralIDAcceptedTextField3.text!)!)
                self.oralIDAcceptedTextField3.text = ""
            }
        }
        dawnOralIDPercentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionDawnOralIDAcceptedValue >= 1 && self.sessionDawnOralIDPresentedValue >= 1 {
                let percentage = Double(Double(self.sessionDawnOralIDAcceptedValue / self.sessionDawnOralIDPresentedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.dawnOralIDPercentRef.setValue(roundedPercent)
            }
        }
        dawnArestinPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.arestinPresentedTextField3.text != "" {
                self.dawnArestinPresentedRef.setValue(Int(self.arestinPresentedTextField3.text!)!)
                self.arestinPresentedTextField3.text = ""
            }
        }
        dawnArestinAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.arestinAcceptedTextField3.text != "" {
                self.dawnArestinAcceptedRef.setValue(Int(self.arestinAcceptedTextField3.text!)!)
                self.arestinAcceptedTextField3.text = ""
            }
        }
        dawnArestinPercentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionDawnArestinAcceptedValue >= 1 && self.sessionDawnArestinPresentedValue >= 1 {
                let percentage = Double(Double(self.sessionDawnArestinAcceptedValue / self.sessionDawnArestinPresentedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.dawnArestinPercentRef.setValue(roundedPercent)
            }
        }
        dawnAppointmentsSeenRef.observe((.value)) { (snap: DataSnapshot) in
            if self.appointmentsSeenTextField3.text != "" {
                self.dawnAppointmentsSeenRef.setValue(Int(self.appointmentsSeenTextField3.text!)!)
                self.appointmentsSeenTextField3.text = ""
            }
        }
        dawnReappointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            if self.reappointmentsTextField3.text != "" {
                self.dawnReappointmentsRef.setValue(Int(self.reappointmentsTextField3.text!)!)
                self.reappointmentsTextField3.text = ""
            }
        }
        dawnReappointmentRateRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionDawnReappointmentsValue >= 1 && self.sessionDawnAppointmentsSeenValue >= 1 {
                let percentage = Double(Double(self.sessionDawnReappointmentsValue / self.sessionDawnAppointmentsSeenValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.dawnReappointmentRateRef.setValue(roundedPercent)
            }
        }
        dawnRetentionRateRef.observe((.value)) { (snap: DataSnapshot) in
            if self.retentionRateTextField7.text != "" {
                self.dawnRetentionRateRef.setValue(Int(self.retentionRateTextField7.text!)!)
                self.retentionRateTextField7.text = ""
            }
        }
        
        sheilaGoalRef.observe((.value)) { (snap: DataSnapshot) in
            if self.goalTextField8.text != "" {
                self.sheilaGoalRef.setValue(Int(self.goalTextField8.text!)!)
                self.goalTextField8.text = ""
            }
        }
        sheilaNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            if self.netProductionTextField10.text != "" {
                self.sheilaNetProductionRef.setValue(Int(self.netProductionTextField10.text!)!)
                self.netProductionTextField10.text = ""
            }
        }
        sheilaDaysWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.daysWorkedTextField8.text != "" {
                self.sheilaDaysWorkedRef.setValue(Int(self.daysWorkedTextField8.text!)!)
                self.daysWorkedTextField8.text = ""
            }
        }
        sheilaProductionPerDayRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionSheilaNetProductionValue >= 1 && self.sessionSheilaDaysWorkedValue >= 1 {
                let result = Int(Int(self.sessionSheilaNetProductionValue) / Int(self.sessionSheilaDaysWorkedValue))
                self.sheilaProductionPerDayRef.setValue(result)
            }
        }
        sheilaHoursWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.numberOfHoursWorkedTextField4.text != "" {
                self.sheilaHoursWorkedRef.setValue(Int(self.numberOfHoursWorkedTextField4.text!)!)
                self.numberOfHoursWorkedTextField4.text = ""
            }
        }
        sheilaProductionPerHourRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionSheilaNetProductionValue >= 1 && self.sessionSheilaHoursWorkedValue >= 1 {
                let result = Int(Int(self.sessionSheilaNetProductionValue) / Int(self.sessionSheilaHoursWorkedValue))
                self.sheilaProductionPerHourRef.setValue(result)
            }
        }
        sheilaScheduledAppointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            if self.scheduledAppointmentsTextField8.text != "" {
                self.sheilaScheduledAppointmentsRef.setValue(Int(self.scheduledAppointmentsTextField8.text!)!)
                self.scheduledAppointmentsTextField8.text = ""
            }
        }
        sheilaAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            if self.appointmentsKeptTextField8.text != "" {
                self.sheilaAppointmentsKeptRef.setValue(Int(self.appointmentsKeptTextField8.text!)!)
                self.appointmentsKeptTextField8.text = ""
            }
        }
        sheilaPercentAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionSheilaAppointmentsKeptValue >= 1 && self.sessionSheilaScheduledAppointmentsValue >= 1 {
                let percentage = Double(Double(self.sessionSheilaAppointmentsKeptValue / self.sessionSheilaScheduledAppointmentsValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.sheilaPercentAppointmentsKeptRef.setValue(roundedPercent)
            }
        }
        sheilaPerioPercentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.perioPercentTextField4.text != "" {
                self.sheilaPerioPercentRef.setValue(Int(self.perioPercentTextField4.text!)!)
                self.perioPercentTextField4.text = ""
            }
        }
        sheilaFluoridePresentedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.fluoridePresentedTextField4.text != "" {
                self.sheilaFluoridePresentedRef.setValue(Int(self.fluoridePresentedTextField4.text!)!)
                self.fluoridePresentedTextField4.text = ""
            }
        }
        sheilaFluorideAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.fluorideAcceptedTextField4.text != "" {
                self.sheilaFluorideAcceptedRef.setValue(Int(self.fluorideAcceptedTextField4.text!)!)
                self.fluorideAcceptedTextField4.text = ""
            }
        }
        sheilaFluoridePercentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionSheilaFluorideAcceptedValue >= 1 && self.sessionSheilaFluoridePresentedValue >= 1 {
                let percentage = Double(Double(self.sessionSheilaFluorideAcceptedValue / self.sessionSheilaFluoridePresentedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.sheilaFluoridePercentRef.setValue(roundedPercent)
            }
        }
        sheilaOralIDPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.oralIDPresentedTextField4.text != "" {
                self.sheilaOralIDPresentedRef.setValue(Int(self.oralIDPresentedTextField4.text!)!)
                self.oralIDPresentedTextField4.text = ""
            }
        }
        sheilaOralIDAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.oralIDAcceptedTextField4.text != "" {
                self.sheilaOralIDAcceptedRef.setValue(Int(self.oralIDAcceptedTextField4.text!)!)
                self.oralIDAcceptedTextField4.text = ""
            }
        }
        sheilaOralIDPercentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionSheilaOralIDAcceptedValue >= 1 && self.sessionSheilaOralIDPresentedValue >= 1 {
                let percentage = Double(Double(self.sessionSheilaOralIDAcceptedValue / self.sessionSheilaOralIDPresentedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.sheilaOralIDPercentRef.setValue(roundedPercent)
            }
        }
        sheilaArestinPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.arestinPresentedTextField4.text != "" {
                self.sheilaArestinPresentedRef.setValue(Int(self.arestinPresentedTextField4.text!)!)
                self.arestinPresentedTextField4.text = ""
            }
        }
        sheilaArestinAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.arestinAcceptedTextField4.text != "" {
                self.sheilaArestinAcceptedRef.setValue(Int(self.arestinAcceptedTextField4.text!)!)
                self.arestinAcceptedTextField4.text = ""
            }
        }
        sheilaArestinPercentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionSheilaArestinAcceptedValue >= 1 && self.sessionSheilaArestinPresentedValue >= 1 {
                let percentage = Double(Double(self.sessionSheilaArestinAcceptedValue / self.sessionSheilaArestinPresentedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.sheilaArestinPercentRef.setValue(roundedPercent)
            }
        }
        sheilaAppointmentsSeenRef.observe((.value)) { (snap: DataSnapshot) in
            if self.appointmentsSeenTextField4.text != "" {
                self.sheilaAppointmentsSeenRef.setValue(Int(self.appointmentsSeenTextField4.text!)!)
                self.appointmentsSeenTextField4.text = ""
            }
        }
        sheilaReappointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            if self.reappointmentsTextField4.text != "" {
                self.sheilaReappointmentsRef.setValue(Int(self.reappointmentsTextField4.text!)!)
                self.reappointmentsTextField4.text = ""
            }
        }
        sheilaReappointmentRateRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionSheilaReappointmentsValue >= 1 && self.sessionSheilaAppointmentsSeenValue >= 1 {
                let percentage = Double(Double(self.sessionSheilaReappointmentsValue / self.sessionSheilaAppointmentsSeenValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.sheilaReappointmentRateRef.setValue(roundedPercent)
            }
        }
        sheilaRetentionRateRef.observe((.value)) { (snap: DataSnapshot) in
            if self.retentionRateTextField8.text != "" {
                self.sheilaRetentionRateRef.setValue(Int(self.retentionRateTextField8.text!)!)
                self.retentionRateTextField8.text = ""
            }
        }
        
        ashleyGoalRef.observe((.value)) { (snap: DataSnapshot) in
            if self.goalTextField9.text != "" {
                self.ashleyGoalRef.setValue(Int(self.goalTextField9.text!)!)
                self.goalTextField9.text = ""
            }
        }
        ashleyNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            if self.netProductionTextField11.text != "" {
                self.ashleyNetProductionRef.setValue(Int(self.netProductionTextField11.text!)!)
                self.netProductionTextField11.text = ""
            }
        }
        ashleyDaysWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.daysWorkedTextField9.text != "" {
                self.ashleyDaysWorkedRef.setValue(Int(self.daysWorkedTextField9.text!)!)
                self.daysWorkedTextField9.text = ""
            }
        }
        ashleyProductionPerDayRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionAshleyNetProductionValue >= 1 && self.sessionAshleyDaysWorkedValue >= 1 {
                let result = Int(Int(self.sessionAshleyNetProductionValue) / Int(self.sessionAshleyDaysWorkedValue))
                self.ashleyProductionPerDayRef.setValue(result)
            }
        }
        ashleyHoursWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.numberOfHoursWorkedTextField5.text != "" {
                self.ashleyHoursWorkedRef.setValue(Int(self.numberOfHoursWorkedTextField5.text!)!)
                self.numberOfHoursWorkedTextField5.text = ""
            }
        }
        ashleyProductionPerHourRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionAshleyNetProductionValue >= 1 && self.sessionAshleyHoursWorkedValue >= 1 {
                let result = Int(Int(self.sessionAshleyNetProductionValue) / Int(self.sessionAshleyHoursWorkedValue))
                self.ashleyProductionPerHourRef.setValue(result)
            }
        }
        ashleyScheduledAppointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            if self.scheduledAppointmentsTextField9.text != "" {
                self.ashleyScheduledAppointmentsRef.setValue(Int(self.scheduledAppointmentsTextField9.text!)!)
                self.scheduledAppointmentsTextField9.text = ""
            }
        }
        ashleyAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            if self.appointmentsKeptTextField9.text != "" {
                self.ashleyAppointmentsKeptRef.setValue(Int(self.appointmentsKeptTextField9.text!)!)
                self.appointmentsKeptTextField9.text = ""
            }
        }
        ashleyPercentAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionAshleyAppointmentsKeptValue >= 1 && self.sessionAshleyScheduledAppointmentsValue >= 1 {
                let percentage = Double(Double(self.sessionAshleyAppointmentsKeptValue / self.sessionAshleyScheduledAppointmentsValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.ashleyPercentAppointmentsKeptRef.setValue(roundedPercent)
            }
        }
        ashleyPerioPercentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.perioPercentTextField5.text != "" {
                self.ashleyPerioPercentRef.setValue(Int(self.perioPercentTextField5.text!)!)
                self.perioPercentTextField5.text = ""
            }
        }
        ashleyFluoridePresentedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.fluoridePresentedTextField5.text != "" {
                self.ashleyFluoridePresentedRef.setValue(Int(self.fluoridePresentedTextField5.text!)!)
                self.fluoridePresentedTextField5.text = ""
            }
        }
        ashleyFluorideAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.fluorideAcceptedTextField5.text != "" {
                self.ashleyFluorideAcceptedRef.setValue(Int(self.fluorideAcceptedTextField5.text!)!)
                self.fluorideAcceptedTextField5.text = ""
            }
        }
        ashleyFluoridePercentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionAshleyFluorideAcceptedValue >= 1 && self.sessionAshleyFluoridePresentedValue >= 1 {
                let percentage = Double(Double(self.sessionAshleyFluorideAcceptedValue / self.sessionAshleyFluoridePresentedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.ashleyFluoridePercentRef.setValue(roundedPercent)
            }
        }
        ashleyOralIDPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.oralIDPresentedTextField5.text != "" {
                self.ashleyOralIDPresentedRef.setValue(Int(self.oralIDPresentedTextField5.text!)!)
                self.oralIDPresentedTextField5.text = ""
            }
        }
        ashleyOralIDAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.oralIDAcceptedTextField5.text != "" {
                self.ashleyOralIDAcceptedRef.setValue(Int(self.oralIDAcceptedTextField5.text!)!)
                self.oralIDAcceptedTextField5.text = ""
            }
        }
        ashleyOralIDPercentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionAshleyOralIDAcceptedValue >= 1 && self.sessionAshleyOralIDPresentedValue >= 1 {
                let percentage = Double(Double(self.sessionAshleyOralIDAcceptedValue / self.sessionAshleyOralIDPresentedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.ashleyOralIDPercentRef.setValue(roundedPercent)
            }
        }
        ashleyArestinPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.arestinPresentedTextField5.text != "" {
                self.ashleyArestinPresentedRef.setValue(Int(self.arestinPresentedTextField5.text!)!)
                self.arestinPresentedTextField5.text = ""
            }
        }
        ashleyArestinAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            if self.arestinAcceptedTextField5.text != "" {
                self.ashleyArestinAcceptedRef.setValue(Int(self.arestinAcceptedTextField5.text!)!)
                self.arestinAcceptedTextField5.text = ""
            }
        }
        ashleyArestinPercentRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionAshleyArestinAcceptedValue >= 1 && self.sessionAshleyArestinPresentedValue >= 1 {
                let percentage = Double(Double(self.sessionAshleyArestinAcceptedValue / self.sessionAshleyArestinPresentedValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.ashleyArestinPercentRef.setValue(roundedPercent)
            }
        }
        ashleyAppointmentsSeenRef.observe((.value)) { (snap: DataSnapshot) in
            if self.appointmentsSeenTextField5.text != "" {
                self.ashleyAppointmentsSeenRef.setValue(Int(self.appointmentsSeenTextField5.text!)!)
                self.appointmentsSeenTextField5.text = ""
            }
        }
        ashleyReappointmentsRef.observe((.value)) { (snap: DataSnapshot) in
            if self.reappointmentsTextField5.text != "" {
                self.ashleyReappointmentsRef.setValue(Int(self.reappointmentsTextField5.text!)!)
                self.reappointmentsTextField5.text = ""
            }
        }
        ashleyReappointmentRateRef.observe((.value)) { (snap: DataSnapshot) in
            if self.sessionAshleyReappointmentsValue >= 1 && self.sessionAshleyAppointmentsSeenValue >= 1 {
                let percentage = Double(Double(self.sessionAshleyReappointmentsValue / self.sessionAshleyAppointmentsSeenValue) * 100)
                let roundedPercent = self.roundToTens(percentage)
                self.ashleyReappointmentRateRef.setValue(roundedPercent)
            }
        }
        ashleyRetentionRateRef.observe((.value)) { (snap: DataSnapshot) in
            if self.retentionRateTextField9.text != "" {
                self.ashleyRetentionRateRef.setValue(Int(self.retentionRateTextField9.text!)!)
                self.retentionRateTextField9.text = ""
            }
        }
        
    } // end of handle submition
    
    @objc func handleLogOut() {
        self.signedIn = false
        UserDefaults.standard.set(false, forKey: "signedIn")
        UserDefaults.standard.synchronize()
        self.present(ViewController(), animated: true) {}
    }
    
    func roundToTens(_ x : Double) -> CDouble {
        return Double(CDouble(exactly: Int(x * 100))! / 100)
        Double((x / 10.0).rounded())
    }
    
    @objc func handleReset() {
        if currentUser == "juliancearley@gmail.com" {
            heatherDyerAmountPresentedRef.setValue(0)
            heatherDyerAmountAcceptedRef.setValue(0)
            heatherDyerPercentOfDollarAmountScheduledRef.setValue(0)
            heatherDyerNumberOfPatientsPresentedTreatmentRef.setValue(0)
            heatherDyerNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            heatherDyerPercentOfPatientAcceptedTreatmentRef.setValue(0)
            
            woodstockNetProductionRef.setValue(0)
            woodstockCollectionsRef.setValue(0)
            woodstockInsuranceCollectionsRef.setValue(0)
            woodstockOTCollectionsRef.setValue(0)
            woodstockDollarAmountRefundedToInsuranceRef.setValue(0)
            woodstockDollarAmountRefundedToPatientsRef.setValue(0)
            woodstockPercentOTCToTotalCollectionsRef.setValue(0)
            woodstockPercentInsuranceToTotalCollectionsRef.setValue(0)
            woodstockPercentCollectionsToNetProductionRef.setValue(0)
            woodstockProductionPerActiveChairRef.setValue(0)
            
            kennesawNetProductionRef.setValue(0)
            kennesawCollectionsRef.setValue(0)
            kennesawInsuranceCollectionsRef.setValue(0)
            kennesawOTCollectionsRef.setValue(0)
            kennesawDollarAmountRefundedToInsuranceRef.setValue(0)
            kennesawDollarAmountRefundedToPatientsRef.setValue(0)
            kennesawPercentOTCToTotalCollectionsRef.setValue(0)
            kennesawPercentInsuranceToTotalCollectionsRef.setValue(0)
            kennesawPercentCollectionsToNetProductionRef.setValue(0)
            kennesawProductionPerActiveChairRef.setValue(0)
            
            hollyAmountPresentedRef.setValue(0)
            hollyAmountAcceptedRef.setValue(0)
            hollyPercentOfDollarAmountScheduledRef.setValue(0)
            hollyNumberOfPatientsPresentedTreatmentRef.setValue(0)
            hollyNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            hollyPercentOfPatientAcceptedTreatmentRef.setValue(0)
            
            sydneyAmountPresentedRef.setValue(0)
            sydneyAmountAcceptedRef.setValue(0)
            sydneyPercentOfDollarAmountScheduledRef.setValue(0)
            sydneyNumberOfPatientsPresentedTreatmentRef.setValue(0)
            sydneyNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            sydneyPercentOfPatientAcceptedTreatmentRef.setValue(0)
           
            amandaAmountPresentedRef.setValue(0)
            amandaAmountAcceptedRef.setValue(0)
            amandaPercentOfDollarAmountScheduledRef.setValue(0)
            amandaNumberOfPatientsPresentedTreatmentRef.setValue(0)
            amandaNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            amandaPercentOfPatientAcceptedTreatmentRef.setValue(0)
            
            ashleyAmountPresentedRef.setValue(0)
            ashleyAmountAcceptedRef.setValue(0)
            ashleyPercentOfDollarAmountScheduledRef.setValue(0)
            ashleyNumberOfPatientsPresentedTreatmentRef.setValue(0)
            ashleyNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            ashleyPercentOfPatientAcceptedTreatmentRef.setValue(0)
            
            debbieAmountPresentedRef.setValue(0)
            debbieAmountAcceptedRef.setValue(0)
            debbiePercentOfDollarAmountScheduledRef.setValue(0)
            debbieNumberOfPatientsPresentedTreatmentRef.setValue(0)
            debbieNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            debbiePercentOfPatientAcceptedTreatmentRef.setValue(0)
            
            annaAmountPresentedRef.setValue(0)
            annaAmountAcceptedRef.setValue(0)
            annaPercentOfDollarAmountScheduledRef.setValue(0)
            annaNumberOfPatientsPresentedTreatmentRef.setValue(0)
            annaNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            annaPercentOfPatientAcceptedTreatmentRef.setValue(0)
            
            jessicaAmountPresentedRef.setValue(0)
            jessicaAmountAcceptedRef.setValue(0)
            jessicaPercentOfDollarAmountScheduledRef.setValue(0)
            jessicaNumberOfPatientsPresentedTreatmentRef.setValue(0)
            jessicaNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            jessicaPercentOfPatientAcceptedTreatmentRef.setValue(0)
            
            drVGoalRef.setValue(0)
            drVNetProductionRef.setValue(0)
            drVDaysWorkedRef.setValue(0)
            drVProductionPerDayRef.setValue(0)
            drVProductionPerHourRef.setValue(0)
            drVDollarAmountSameDayTreatmentRef.setValue(0)
            drVScheduledAppointmentsRef.setValue(0)
            drVAppointmentsKeptRef.setValue(0)
            drVPercentAppointmentsKeptRef.setValue(0)
            drVRetentionRateRef.setValue(0)
            
            drMcreeGoalRef.setValue(0)
            drMcreeNetProductionRef.setValue(0)
            drMcreeDaysWorkedRef.setValue(0)
            drMcreeProductionPerDayRef.setValue(0)
            drMcreeProductionPerHourRef.setValue(0)
            drMcreeDollarAmountSameDayTreatmentRef.setValue(0)
            drMcreeScheduledAppointmentsRef.setValue(0)
            drMcreeAppointmentsKeptRef.setValue(0)
            drMcreePercentAppointmentsKeptRef.setValue(0)
            drMcreeRetentionRateRef.setValue(0)
            
            drOrzaGoalRef.setValue(0)
            drOrzaNetProductionRef.setValue(0)
            drOrzaDaysWorkedRef.setValue(0)
            drOrzaProductionPerDayRef.setValue(0)
            drOrzaProductionPerHourRef.setValue(0)
            drOrzaDollarAmountSameDayTreatmentRef.setValue(0)
            drOrzaScheduledAppointmentsRef.setValue(0)
            drOrzaAppointmentsKeptRef.setValue(0)
            drOrzaPercentAppointmentsKeptRef.setValue(0)
            drOrzaRetentionRateRef.setValue(0)
            
            drFranGoalRef.setValue(0)
            drFranNetProductionRef.setValue(0)
            drFranDaysWorkedRef.setValue(0)
            drFranProductionPerDayRef.setValue(0)
            drFranProductionPerHourRef.setValue(0)
            drFranDollarAmountSameDayTreatmentRef.setValue(0)
            drFranScheduledAppointmentsRef.setValue(0)
            drFranAppointmentsKeptRef.setValue(0)
            drFranPercentAppointmentsKeptRef.setValue(0)
            drFranRetentionRateRef.setValue(0)
            
            amyGoalRef.setValue(0)
            amyNetProductionRef.setValue(0)
            amyDaysWorkedRef.setValue(0)
            amyProductionPerDayRef.setValue(0)
            amyHoursWorkedRef.setValue(0)
            amyProductionPerHourRef.setValue(0)
            amyScheduledAppointmentsRef.setValue(0)
            amyAppointmentsKeptRef.setValue(0)
            amyPercentAppointmentsKeptRef.setValue(0)
            amyPerioPercentRef.setValue(0)
            amyFluoridePresentedRef.setValue(0)
            amyFluorideAcceptedRef.setValue(0)
            amyFluoridePercentRef.setValue(0)
            amyOralIDPresentedRef.setValue(0)
            amyOralIDAcceptedRef.setValue(0)
            amyOralIDPercentRef.setValue(0)
            amyArestinPresentedRef.setValue(0)
            amyArestinAcceptedRef.setValue(0)
            amyArestinPercentRef.setValue(0)
            amyAppointmentsSeenRef.setValue(0)
            amyReappointmentsRef.setValue(0)
            amyReappointmentRateRef.setValue(0)
            amyRetentionRateRef.setValue(0)
            
            aubreyGoalRef.setValue(0)
            aubreyNetProductionRef.setValue(0)
            aubreyDaysWorkedRef.setValue(0)
            aubreyProductionPerDayRef.setValue(0)
            aubreyHoursWorkedRef.setValue(0)
            aubreyProductionPerHourRef.setValue(0)
            aubreyScheduledAppointmentsRef.setValue(0)
            aubreyAppointmentsKeptRef.setValue(0)
            aubreyPercentAppointmentsKeptRef.setValue(0)
            aubreyPerioPercentRef.setValue(0)
            aubreyFluoridePresentedRef.setValue(0)
            aubreyFluorideAcceptedRef.setValue(0)
            aubreyFluoridePercentRef.setValue(0)
            aubreyOralIDPresentedRef.setValue(0)
            aubreyOralIDAcceptedRef.setValue(0)
            aubreyOralIDPercentRef.setValue(0)
            aubreyArestinPresentedRef.setValue(0)
            aubreyArestinAcceptedRef.setValue(0)
            aubreyArestinPercentRef.setValue(0)
            aubreyAppointmentsSeenRef.setValue(0)
            aubreyReappointmentsRef.setValue(0)
            aubreyReappointmentRateRef.setValue(0)
            aubreyRetentionRateRef.setValue(0)
            
            dawnGoalRef.setValue(0)
            dawnNetProductionRef.setValue(0)
            dawnDaysWorkedRef.setValue(0)
            dawnProductionPerDayRef.setValue(0)
            dawnHoursWorkedRef.setValue(0)
            dawnProductionPerHourRef.setValue(0)
            dawnScheduledAppointmentsRef.setValue(0)
            dawnAppointmentsKeptRef.setValue(0)
            dawnPercentAppointmentsKeptRef.setValue(0)
            dawnPerioPercentRef.setValue(0)
            dawnFluoridePresentedRef.setValue(0)
            dawnFluorideAcceptedRef.setValue(0)
            dawnFluoridePercentRef.setValue(0)
            dawnOralIDPresentedRef.setValue(0)
            dawnOralIDAcceptedRef.setValue(0)
            dawnOralIDPercentRef.setValue(0)
            dawnArestinPresentedRef.setValue(0)
            dawnArestinAcceptedRef.setValue(0)
            dawnArestinPercentRef.setValue(0)
            dawnAppointmentsSeenRef.setValue(0)
            dawnReappointmentsRef.setValue(0)
            dawnReappointmentRateRef.setValue(0)
            dawnRetentionRateRef.setValue(0)
            
            sheilaGoalRef.setValue(0)
            sheilaNetProductionRef.setValue(0)
            sheilaDaysWorkedRef.setValue(0)
            sheilaProductionPerDayRef.setValue(0)
            sheilaHoursWorkedRef.setValue(0)
            sheilaProductionPerHourRef.setValue(0)
            sheilaScheduledAppointmentsRef.setValue(0)
            sheilaAppointmentsKeptRef.setValue(0)
            sheilaPercentAppointmentsKeptRef.setValue(0)
            sheilaPerioPercentRef.setValue(0)
            sheilaFluoridePresentedRef.setValue(0)
            sheilaFluorideAcceptedRef.setValue(0)
            sheilaFluoridePercentRef.setValue(0)
            sheilaOralIDPresentedRef.setValue(0)
            sheilaOralIDAcceptedRef.setValue(0)
            sheilaOralIDPercentRef.setValue(0)
            sheilaArestinPresentedRef.setValue(0)
            sheilaArestinAcceptedRef.setValue(0)
            sheilaArestinPercentRef.setValue(0)
            sheilaAppointmentsSeenRef.setValue(0)
            sheilaReappointmentsRef.setValue(0)
            sheilaReappointmentRateRef.setValue(0)
            sheilaRetentionRateRef.setValue(0)
            
            ashleyGoalRef.setValue(0)
            ashleyNetProductionRef.setValue(0)
            ashleyDaysWorkedRef.setValue(0)
            ashleyProductionPerDayRef.setValue(0)
            ashleyHoursWorkedRef.setValue(0)
            ashleyProductionPerHourRef.setValue(0)
            ashleyScheduledAppointmentsRef.setValue(0)
            ashleyAppointmentsKeptRef.setValue(0)
            ashleyPercentAppointmentsKeptRef.setValue(0)
            ashleyPerioPercentRef.setValue(0)
            ashleyFluoridePresentedRef.setValue(0)
            ashleyFluorideAcceptedRef.setValue(0)
            ashleyFluoridePercentRef.setValue(0)
            ashleyOralIDPresentedRef.setValue(0)
            ashleyOralIDAcceptedRef.setValue(0)
            ashleyOralIDPercentRef.setValue(0)
            ashleyArestinPresentedRef.setValue(0)
            ashleyArestinAcceptedRef.setValue(0)
            ashleyArestinPercentRef.setValue(0)
            ashleyAppointmentsSeenRef.setValue(0)
            ashleyReappointmentsRef.setValue(0)
            ashleyReappointmentRateRef.setValue(0)
            ashleyRetentionRateRef.setValue(0)
            
        } else if currentUser == "drkvaughn1stchoice@gmail.com" {
            // Kelly
            heatherDyerAmountPresentedRef.setValue(0)
            heatherDyerAmountAcceptedRef.setValue(0)
            heatherDyerPercentOfDollarAmountScheduledRef.setValue(0)
            heatherDyerNumberOfPatientsPresentedTreatmentRef.setValue(0)
            heatherDyerNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            heatherDyerPercentOfPatientAcceptedTreatmentRef.setValue(0)
            
            woodstockNetProductionRef.setValue(0)
            woodstockCollectionsRef.setValue(0)
            woodstockInsuranceCollectionsRef.setValue(0)
            woodstockOTCollectionsRef.setValue(0)
            woodstockDollarAmountRefundedToInsuranceRef.setValue(0)
            woodstockDollarAmountRefundedToPatientsRef.setValue(0)
            woodstockPercentOTCToTotalCollectionsRef.setValue(0)
            woodstockPercentInsuranceToTotalCollectionsRef.setValue(0)
            woodstockPercentCollectionsToNetProductionRef.setValue(0)
            woodstockProductionPerActiveChairRef.setValue(0)
            
            kennesawNetProductionRef.setValue(0)
            kennesawCollectionsRef.setValue(0)
            kennesawInsuranceCollectionsRef.setValue(0)
            kennesawOTCollectionsRef.setValue(0)
            kennesawDollarAmountRefundedToInsuranceRef.setValue(0)
            kennesawDollarAmountRefundedToPatientsRef.setValue(0)
            kennesawPercentOTCToTotalCollectionsRef.setValue(0)
            kennesawPercentInsuranceToTotalCollectionsRef.setValue(0)
            kennesawPercentCollectionsToNetProductionRef.setValue(0)
            kennesawProductionPerActiveChairRef.setValue(0)
            
            hollyAmountPresentedRef.setValue(0)
            hollyAmountAcceptedRef.setValue(0)
            hollyPercentOfDollarAmountScheduledRef.setValue(0)
            hollyNumberOfPatientsPresentedTreatmentRef.setValue(0)
            hollyNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            hollyPercentOfPatientAcceptedTreatmentRef.setValue(0)
            
            sydneyAmountPresentedRef.setValue(0)
            sydneyAmountAcceptedRef.setValue(0)
            sydneyPercentOfDollarAmountScheduledRef.setValue(0)
            sydneyNumberOfPatientsPresentedTreatmentRef.setValue(0)
            sydneyNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            sydneyPercentOfPatientAcceptedTreatmentRef.setValue(0)
            
            amandaAmountPresentedRef.setValue(0)
            amandaAmountAcceptedRef.setValue(0)
            amandaPercentOfDollarAmountScheduledRef.setValue(0)
            amandaNumberOfPatientsPresentedTreatmentRef.setValue(0)
            amandaNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            amandaPercentOfPatientAcceptedTreatmentRef.setValue(0)
            
            ashleyAmountPresentedRef.setValue(0)
            ashleyAmountAcceptedRef.setValue(0)
            ashleyPercentOfDollarAmountScheduledRef.setValue(0)
            ashleyNumberOfPatientsPresentedTreatmentRef.setValue(0)
            ashleyNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            ashleyPercentOfPatientAcceptedTreatmentRef.setValue(0)
            
            debbieAmountPresentedRef.setValue(0)
            debbieAmountAcceptedRef.setValue(0)
            debbiePercentOfDollarAmountScheduledRef.setValue(0)
            debbieNumberOfPatientsPresentedTreatmentRef.setValue(0)
            debbieNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            debbiePercentOfPatientAcceptedTreatmentRef.setValue(0)
            
            annaAmountPresentedRef.setValue(0)
            annaAmountAcceptedRef.setValue(0)
            annaPercentOfDollarAmountScheduledRef.setValue(0)
            annaNumberOfPatientsPresentedTreatmentRef.setValue(0)
            annaNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            annaPercentOfPatientAcceptedTreatmentRef.setValue(0)
            
            jessicaAmountPresentedRef.setValue(0)
            jessicaAmountAcceptedRef.setValue(0)
            jessicaPercentOfDollarAmountScheduledRef.setValue(0)
            jessicaNumberOfPatientsPresentedTreatmentRef.setValue(0)
            jessicaNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            jessicaPercentOfPatientAcceptedTreatmentRef.setValue(0)
            
            drVGoalRef.setValue(0)
            drVNetProductionRef.setValue(0)
            drVDaysWorkedRef.setValue(0)
            drVProductionPerDayRef.setValue(0)
            drVProductionPerHourRef.setValue(0)
            drVDollarAmountSameDayTreatmentRef.setValue(0)
            drVScheduledAppointmentsRef.setValue(0)
            drVAppointmentsKeptRef.setValue(0)
            drVPercentAppointmentsKeptRef.setValue(0)
            drVRetentionRateRef.setValue(0)
            
            drMcreeGoalRef.setValue(0)
            drMcreeNetProductionRef.setValue(0)
            drMcreeDaysWorkedRef.setValue(0)
            drMcreeProductionPerDayRef.setValue(0)
            drMcreeProductionPerHourRef.setValue(0)
            drMcreeDollarAmountSameDayTreatmentRef.setValue(0)
            drMcreeScheduledAppointmentsRef.setValue(0)
            drMcreeAppointmentsKeptRef.setValue(0)
            drMcreePercentAppointmentsKeptRef.setValue(0)
            drMcreeRetentionRateRef.setValue(0)
            
            drOrzaGoalRef.setValue(0)
            drOrzaNetProductionRef.setValue(0)
            drOrzaDaysWorkedRef.setValue(0)
            drOrzaProductionPerDayRef.setValue(0)
            drOrzaProductionPerHourRef.setValue(0)
            drOrzaDollarAmountSameDayTreatmentRef.setValue(0)
            drOrzaScheduledAppointmentsRef.setValue(0)
            drOrzaAppointmentsKeptRef.setValue(0)
            drOrzaPercentAppointmentsKeptRef.setValue(0)
            drOrzaRetentionRateRef.setValue(0)
            
            drFranGoalRef.setValue(0)
            drFranNetProductionRef.setValue(0)
            drFranDaysWorkedRef.setValue(0)
            drFranProductionPerDayRef.setValue(0)
            drFranProductionPerHourRef.setValue(0)
            drFranDollarAmountSameDayTreatmentRef.setValue(0)
            drFranScheduledAppointmentsRef.setValue(0)
            drFranAppointmentsKeptRef.setValue(0)
            drFranPercentAppointmentsKeptRef.setValue(0)
            drFranRetentionRateRef.setValue(0)
            
            amyGoalRef.setValue(0)
            amyNetProductionRef.setValue(0)
            amyDaysWorkedRef.setValue(0)
            amyProductionPerDayRef.setValue(0)
            amyHoursWorkedRef.setValue(0)
            amyProductionPerHourRef.setValue(0)
            amyScheduledAppointmentsRef.setValue(0)
            amyAppointmentsKeptRef.setValue(0)
            amyPercentAppointmentsKeptRef.setValue(0)
            amyPerioPercentRef.setValue(0)
            amyFluoridePresentedRef.setValue(0)
            amyFluorideAcceptedRef.setValue(0)
            amyFluoridePercentRef.setValue(0)
            amyOralIDPresentedRef.setValue(0)
            amyOralIDAcceptedRef.setValue(0)
            amyOralIDPercentRef.setValue(0)
            amyArestinPresentedRef.setValue(0)
            amyArestinAcceptedRef.setValue(0)
            amyArestinPercentRef.setValue(0)
            amyAppointmentsSeenRef.setValue(0)
            amyReappointmentsRef.setValue(0)
            amyReappointmentRateRef.setValue(0)
            amyRetentionRateRef.setValue(0)
            
            aubreyGoalRef.setValue(0)
            aubreyNetProductionRef.setValue(0)
            aubreyDaysWorkedRef.setValue(0)
            aubreyProductionPerDayRef.setValue(0)
            aubreyHoursWorkedRef.setValue(0)
            aubreyProductionPerHourRef.setValue(0)
            aubreyScheduledAppointmentsRef.setValue(0)
            aubreyAppointmentsKeptRef.setValue(0)
            aubreyPercentAppointmentsKeptRef.setValue(0)
            aubreyPerioPercentRef.setValue(0)
            aubreyFluoridePresentedRef.setValue(0)
            aubreyFluorideAcceptedRef.setValue(0)
            aubreyFluoridePercentRef.setValue(0)
            aubreyOralIDPresentedRef.setValue(0)
            aubreyOralIDAcceptedRef.setValue(0)
            aubreyOralIDPercentRef.setValue(0)
            aubreyArestinPresentedRef.setValue(0)
            aubreyArestinAcceptedRef.setValue(0)
            aubreyArestinPercentRef.setValue(0)
            aubreyAppointmentsSeenRef.setValue(0)
            aubreyReappointmentsRef.setValue(0)
            aubreyReappointmentRateRef.setValue(0)
            aubreyRetentionRateRef.setValue(0)
            
            dawnGoalRef.setValue(0)
            dawnNetProductionRef.setValue(0)
            dawnDaysWorkedRef.setValue(0)
            dawnProductionPerDayRef.setValue(0)
            dawnHoursWorkedRef.setValue(0)
            dawnProductionPerHourRef.setValue(0)
            dawnScheduledAppointmentsRef.setValue(0)
            dawnAppointmentsKeptRef.setValue(0)
            dawnPercentAppointmentsKeptRef.setValue(0)
            dawnPerioPercentRef.setValue(0)
            dawnFluoridePresentedRef.setValue(0)
            dawnFluorideAcceptedRef.setValue(0)
            dawnFluoridePercentRef.setValue(0)
            dawnOralIDPresentedRef.setValue(0)
            dawnOralIDAcceptedRef.setValue(0)
            dawnOralIDPercentRef.setValue(0)
            dawnArestinPresentedRef.setValue(0)
            dawnArestinAcceptedRef.setValue(0)
            dawnArestinPercentRef.setValue(0)
            dawnAppointmentsSeenRef.setValue(0)
            dawnReappointmentsRef.setValue(0)
            dawnReappointmentRateRef.setValue(0)
            dawnRetentionRateRef.setValue(0)
            
            sheilaGoalRef.setValue(0)
            sheilaNetProductionRef.setValue(0)
            sheilaDaysWorkedRef.setValue(0)
            sheilaProductionPerDayRef.setValue(0)
            sheilaHoursWorkedRef.setValue(0)
            sheilaProductionPerHourRef.setValue(0)
            sheilaScheduledAppointmentsRef.setValue(0)
            sheilaAppointmentsKeptRef.setValue(0)
            sheilaPercentAppointmentsKeptRef.setValue(0)
            sheilaPerioPercentRef.setValue(0)
            sheilaFluoridePresentedRef.setValue(0)
            sheilaFluorideAcceptedRef.setValue(0)
            sheilaFluoridePercentRef.setValue(0)
            sheilaOralIDPresentedRef.setValue(0)
            sheilaOralIDAcceptedRef.setValue(0)
            sheilaOralIDPercentRef.setValue(0)
            sheilaArestinPresentedRef.setValue(0)
            sheilaArestinAcceptedRef.setValue(0)
            sheilaArestinPercentRef.setValue(0)
            sheilaAppointmentsSeenRef.setValue(0)
            sheilaReappointmentsRef.setValue(0)
            sheilaReappointmentRateRef.setValue(0)
            sheilaRetentionRateRef.setValue(0)
            
            ashleyGoalRef.setValue(0)
            ashleyNetProductionRef.setValue(0)
            ashleyDaysWorkedRef.setValue(0)
            ashleyProductionPerDayRef.setValue(0)
            ashleyHoursWorkedRef.setValue(0)
            ashleyProductionPerHourRef.setValue(0)
            ashleyScheduledAppointmentsRef.setValue(0)
            ashleyAppointmentsKeptRef.setValue(0)
            ashleyPercentAppointmentsKeptRef.setValue(0)
            ashleyPerioPercentRef.setValue(0)
            ashleyFluoridePresentedRef.setValue(0)
            ashleyFluorideAcceptedRef.setValue(0)
            ashleyFluoridePercentRef.setValue(0)
            ashleyOralIDPresentedRef.setValue(0)
            ashleyOralIDAcceptedRef.setValue(0)
            ashleyOralIDPercentRef.setValue(0)
            ashleyArestinPresentedRef.setValue(0)
            ashleyArestinAcceptedRef.setValue(0)
            ashleyArestinPercentRef.setValue(0)
            ashleyAppointmentsSeenRef.setValue(0)
            ashleyReappointmentsRef.setValue(0)
            ashleyReappointmentRateRef.setValue(0)
            ashleyRetentionRateRef.setValue(0)
            
        } else if currentUser == "dmhunsinger@gmail.com" {
            // Dawn
            goalTextField7.isEnabled = true
            netProductionTextField9.isEnabled = true
            daysWorkedTextField7.isEnabled = true
            numberOfHoursWorkedTextField3.isEnabled = true
            scheduledAppointmentsTextField7.isEnabled = true
            appointmentsKeptTextField7.isEnabled = true
            perioPercentTextField3.isEnabled = true
            fluoridePresentedTextField3.isEnabled = true
            fluorideAcceptedTextField3.isEnabled = true
            oralIDPresentedTextField3.isEnabled = true
            oralIDAcceptedTextField3.isEnabled = true
            arestinPresentedTextField3.isEnabled = true
            arestinAcceptedTextField3.isEnabled = true
            appointmentsSeenTextField3.isEnabled = true
            reappointmentsTextField3.isEnabled = true
            retentionRateTextField7.isEnabled = true
            
            dawnGoalRef.setValue(0)
            dawnNetProductionRef.setValue(0)
            dawnDaysWorkedRef.setValue(0)
            dawnProductionPerDayRef.setValue(0)
            dawnHoursWorkedRef.setValue(0)
            dawnProductionPerHourRef.setValue(0)
            dawnScheduledAppointmentsRef.setValue(0)
            dawnAppointmentsKeptRef.setValue(0)
            dawnPercentAppointmentsKeptRef.setValue(0)
            dawnPerioPercentRef.setValue(0)
            dawnFluoridePresentedRef.setValue(0)
            dawnFluorideAcceptedRef.setValue(0)
            dawnFluoridePercentRef.setValue(0)
            dawnOralIDPresentedRef.setValue(0)
            dawnOralIDAcceptedRef.setValue(0)
            dawnOralIDPercentRef.setValue(0)
            dawnArestinPresentedRef.setValue(0)
            dawnArestinAcceptedRef.setValue(0)
            dawnArestinPercentRef.setValue(0)
            dawnAppointmentsSeenRef.setValue(0)
            dawnReappointmentsRef.setValue(0)
            dawnReappointmentRateRef.setValue(0)
            dawnRetentionRateRef.setValue(0)
            
        } else if currentUser == "debbie1stchoice@gmail.com" {
            // Debbie D.
            amountPresentedTextField5.isEnabled = true
            amountAcceptedTextField5.isEnabled = true
            numberPatientsPresentedTreatmentTextField5.isEnabled = true
            numberPatientsAcceptedTreatmentTextField5.isEnabled = true
            
            debbieAmountPresentedRef.setValue(0)
            debbieAmountAcceptedRef.setValue(0)
            debbiePercentOfDollarAmountScheduledRef.setValue(0)
            debbieNumberOfPatientsPresentedTreatmentRef.setValue(0)
            debbieNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            debbiePercentOfPatientAcceptedTreatmentRef.setValue(0)
            
        } else if currentUser == "holy1stchoice@gmail.com" {
            // Holy
            amountPresentedTextField1.isEnabled = true
            amountAcceptedTextField1.isEnabled = true
            numberPatientsPresentedTreatmentTextField1.isEnabled = true
            numberPatientsAcceptedTreatmentTextField1.isEnabled = true
            
            hollyAmountPresentedRef.setValue(0)
            hollyAmountAcceptedRef.setValue(0)
            hollyPercentOfDollarAmountScheduledRef.setValue(0)
            hollyNumberOfPatientsPresentedTreatmentRef.setValue(0)
            hollyNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            hollyPercentOfPatientAcceptedTreatmentRef.setValue(0)
            
        } else if currentUser == "jessica.gail.stephens@gmail.com" {
            // Jessica
            amountPresentedTextField7.isEnabled = true
            amountAcceptedTextField7.isEnabled = true
            numberPatientsPresentedTreatmentTextField7.isEnabled = true
            numberPatientsAcceptedTreatmentTextField7.isEnabled = true
            
            jessicaAmountPresentedRef.setValue(0)
            jessicaAmountAcceptedRef.setValue(0)
            jessicaPercentOfDollarAmountScheduledRef.setValue(0)
            jessicaNumberOfPatientsPresentedTreatmentRef.setValue(0)
            jessicaNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            jessicaPercentOfPatientAcceptedTreatmentRef.setValue(0)
            
        } else if currentUser == "s_dye@bellsouth.net" {
            // Sheila
            goalTextField8.isEnabled = true
            netProductionTextField10.isEnabled = true
            daysWorkedTextField8.isEnabled = true
            numberOfHoursWorkedTextField4.isEnabled = true
            scheduledAppointmentsTextField8.isEnabled = true
            appointmentsKeptTextField8.isEnabled = true
            perioPercentTextField4.isEnabled = true
            fluoridePresentedTextField4.isEnabled = true
            fluorideAcceptedTextField4.isEnabled = true
            oralIDPresentedTextField4.isEnabled = true
            oralIDAcceptedTextField4.isEnabled = true
            arestinPresentedTextField4.isEnabled = true
            arestinAcceptedTextField4.isEnabled = true
            appointmentsSeenTextField4.isEnabled = true
            reappointmentsTextField4.isEnabled = true
            retentionRateTextField8.isEnabled = true
            
            sheilaGoalRef.setValue(0)
            sheilaNetProductionRef.setValue(0)
            sheilaDaysWorkedRef.setValue(0)
            sheilaProductionPerDayRef.setValue(0)
            sheilaHoursWorkedRef.setValue(0)
            sheilaProductionPerHourRef.setValue(0)
            sheilaScheduledAppointmentsRef.setValue(0)
            sheilaAppointmentsKeptRef.setValue(0)
            sheilaPercentAppointmentsKeptRef.setValue(0)
            sheilaPerioPercentRef.setValue(0)
            sheilaFluoridePresentedRef.setValue(0)
            sheilaFluorideAcceptedRef.setValue(0)
            sheilaFluoridePercentRef.setValue(0)
            sheilaOralIDPresentedRef.setValue(0)
            sheilaOralIDAcceptedRef.setValue(0)
            sheilaOralIDPercentRef.setValue(0)
            sheilaArestinPresentedRef.setValue(0)
            sheilaArestinAcceptedRef.setValue(0)
            sheilaArestinPercentRef.setValue(0)
            sheilaAppointmentsSeenRef.setValue(0)
            sheilaReappointmentsRef.setValue(0)
            sheilaReappointmentRateRef.setValue(0)
            sheilaRetentionRateRef.setValue(0)
            
        } else if currentUser == "sydneym1stchoice@gmail.com" {
            // Sydney
            amountPresentedTextField2.isEnabled = true
            amountAcceptedTextField2.isEnabled = true
            numberPatientsPresentedTreatmentTextField2.isEnabled = true
            numberPatientsAcceptedTreatmentTextField2.isEnabled = true
            
            sydneyAmountPresentedRef.setValue(0)
            sydneyAmountAcceptedRef.setValue(0)
            sydneyPercentOfDollarAmountScheduledRef.setValue(0)
            sydneyNumberOfPatientsPresentedTreatmentRef.setValue(0)
            sydneyNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            sydneyPercentOfPatientAcceptedTreatmentRef.setValue(0)
            
        } else if currentUser == "honeycombs03@hotmail.com" {
            // Aubrey
            goalTextField6.isEnabled = true
            netProductionTextField8.isEnabled = true
            daysWorkedTextField6.isEnabled = true
            numberOfHoursWorkedTextField2.isEnabled = true
            scheduledAppointmentsTextField6.isEnabled = true
            appointmentsKeptTextField6.isEnabled = true
            perioPercentTextField2.isEnabled = true
            fluoridePresentedTextField2.isEnabled = true
            fluorideAcceptedTextField2.isEnabled = true
            oralIDPresentedTextField2.isEnabled = true
            oralIDAcceptedTextField2.isEnabled = true
            arestinPresentedTextField2.isEnabled = true
            arestinAcceptedTextField2.isEnabled = true
            appointmentsSeenTextField2.isEnabled = true
            reappointmentsTextField2.isEnabled = true
            retentionRateTextField6.isEnabled = true
            
            aubreyGoalRef.setValue(0)
            aubreyNetProductionRef.setValue(0)
            aubreyDaysWorkedRef.setValue(0)
            aubreyProductionPerDayRef.setValue(0)
            aubreyHoursWorkedRef.setValue(0)
            aubreyProductionPerHourRef.setValue(0)
            aubreyScheduledAppointmentsRef.setValue(0)
            aubreyAppointmentsKeptRef.setValue(0)
            aubreyPercentAppointmentsKeptRef.setValue(0)
            aubreyPerioPercentRef.setValue(0)
            aubreyFluoridePresentedRef.setValue(0)
            aubreyFluorideAcceptedRef.setValue(0)
            aubreyFluoridePercentRef.setValue(0)
            aubreyOralIDPresentedRef.setValue(0)
            aubreyOralIDAcceptedRef.setValue(0)
            aubreyOralIDPercentRef.setValue(0)
            aubreyArestinPresentedRef.setValue(0)
            aubreyArestinAcceptedRef.setValue(0)
            aubreyArestinPercentRef.setValue(0)
            aubreyAppointmentsSeenRef.setValue(0)
            aubreyReappointmentsRef.setValue(0)
            aubreyReappointmentRateRef.setValue(0)
            aubreyRetentionRateRef.setValue(0)
            
        } else if currentUser == "ashleyg1stchoice@gmail.com" {
            // Ashley G
            amountPresentedTextField4.isEnabled = true
            amountAcceptedTextField4.isEnabled = true
            numberPatientsPresentedTreatmentTextField4.isEnabled = true
            numberPatientsAcceptedTreatmentTextField4.isEnabled = true
            
            ashleyAmountPresentedRef.setValue(0)
            ashleyAmountAcceptedRef.setValue(0)
            ashleyPercentOfDollarAmountScheduledRef.setValue(0)
            ashleyNumberOfPatientsPresentedTreatmentRef.setValue(0)
            ashleyNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            ashleyPercentOfPatientAcceptedTreatmentRef.setValue(0)
            
        } else if currentUser == "ltinker21@yahoo.com" {
            // Ashley T
            goalTextField9.isEnabled = true
            netProductionTextField11.isEnabled = true
            daysWorkedTextField9.isEnabled = true
            numberOfHoursWorkedTextField5.isEnabled = true
            scheduledAppointmentsTextField9.isEnabled = true
            appointmentsKeptTextField9.isEnabled = true
            perioPercentTextField5.isEnabled = true
            fluoridePresentedTextField5.isEnabled = true
            fluorideAcceptedTextField5.isEnabled = true
            oralIDPresentedTextField5.isEnabled = true
            oralIDAcceptedTextField5.isEnabled = true
            arestinPresentedTextField5.isEnabled = true
            arestinAcceptedTextField5.isEnabled = true
            appointmentsSeenTextField5.isEnabled = true
            reappointmentsTextField5.isEnabled = true
            retentionRateTextField9.isEnabled = true
            
            ashleyGoalRef.setValue(0)
            ashleyNetProductionRef.setValue(0)
            ashleyDaysWorkedRef.setValue(0)
            ashleyProductionPerDayRef.setValue(0)
            ashleyHoursWorkedRef.setValue(0)
            ashleyProductionPerHourRef.setValue(0)
            ashleyScheduledAppointmentsRef.setValue(0)
            ashleyAppointmentsKeptRef.setValue(0)
            ashleyPercentAppointmentsKeptRef.setValue(0)
            ashleyPerioPercentRef.setValue(0)
            ashleyFluoridePresentedRef.setValue(0)
            ashleyFluorideAcceptedRef.setValue(0)
            ashleyFluoridePercentRef.setValue(0)
            ashleyOralIDPresentedRef.setValue(0)
            ashleyOralIDAcceptedRef.setValue(0)
            ashleyOralIDPercentRef.setValue(0)
            ashleyArestinPresentedRef.setValue(0)
            ashleyArestinAcceptedRef.setValue(0)
            ashleyArestinPercentRef.setValue(0)
            ashleyAppointmentsSeenRef.setValue(0)
            ashleyReappointmentsRef.setValue(0)
            ashleyReappointmentRateRef.setValue(0)
            ashleyRetentionRateRef.setValue(0)
            
        } else if currentUser == "annacav18@gmail.com" {
            // Anna C.
            amountPresentedTextField6.isEnabled = true
            amountAcceptedTextField6.isEnabled = true
            numberPatientsPresentedTreatmentTextField6.isEnabled = true
            numberPatientsAcceptedTreatmentTextField6.isEnabled = true
            
            annaAmountPresentedRef.setValue(0)
            annaAmountAcceptedRef.setValue(0)
            annaPercentOfDollarAmountScheduledRef.setValue(0)
            annaNumberOfPatientsPresentedTreatmentRef.setValue(0)
            annaNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            annaPercentOfPatientAcceptedTreatmentRef.setValue(0)
            
        } else if currentUser == "amychanthaboury@aol.com" {
            // Amy
            goalTextField5.isEnabled = true
            netProductionTextField7.isEnabled = true
            daysWorkedTextField5.isEnabled = true
            numberOfHoursWorkedTextField1.isEnabled = true
            scheduledAppointmentsTextField5.isEnabled = true
            appointmentsKeptTextField5.isEnabled = true
            perioPercentTextField1.isEnabled = true
            fluoridePresentedTextField1.isEnabled = true
            fluorideAcceptedTextField1.isEnabled = true
            oralIDPresentedTextField1.isEnabled = true
            oralIDAcceptedTextField1.isEnabled = true
            arestinPresentedTextField1.isEnabled = true
            arestinAcceptedTextField1.isEnabled = true
            appointmentsSeenTextField1.isEnabled = true
            reappointmentsTextField1.isEnabled = true
            retentionRateTextField5.isEnabled = true
            
            amyGoalRef.setValue(0)
            amyNetProductionRef.setValue(0)
            amyDaysWorkedRef.setValue(0)
            amyProductionPerDayRef.setValue(0)
            amyHoursWorkedRef.setValue(0)
            amyProductionPerHourRef.setValue(0)
            amyScheduledAppointmentsRef.setValue(0)
            amyAppointmentsKeptRef.setValue(0)
            amyPercentAppointmentsKeptRef.setValue(0)
            amyPerioPercentRef.setValue(0)
            amyFluoridePresentedRef.setValue(0)
            amyFluorideAcceptedRef.setValue(0)
            amyFluoridePercentRef.setValue(0)
            amyOralIDPresentedRef.setValue(0)
            amyOralIDAcceptedRef.setValue(0)
            amyOralIDPercentRef.setValue(0)
            amyArestinPresentedRef.setValue(0)
            amyArestinAcceptedRef.setValue(0)
            amyArestinPercentRef.setValue(0)
            amyAppointmentsSeenRef.setValue(0)
            amyReappointmentsRef.setValue(0)
            amyReappointmentRateRef.setValue(0)
            amyRetentionRateRef.setValue(0)
            
        } else if currentUser == "amanda.vickers83@gmail.com" {
            // Amanda
            amountPresentedTextField3.isEnabled = true
            amountAcceptedTextField3.isEnabled = true
            numberPatientsPresentedTreatmentTextField3.isEnabled = true
            numberPatientsAcceptedTreatmentTextField3.isEnabled = true
            
            amandaAmountPresentedRef.setValue(0)
            amandaAmountAcceptedRef.setValue(0)
            amandaPercentOfDollarAmountScheduledRef.setValue(0)
            amandaNumberOfPatientsPresentedTreatmentRef.setValue(0)
            amandaNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            amandaPercentOfPatientAcceptedTreatmentRef.setValue(0)
            
        } else if currentUser == "kvargas0225@gmail.com" || currentUser == "dusti1stchoice@gmail.com" {
            // Mcree & V.
            
            drVGoalRef.setValue(0)
            drVNetProductionRef.setValue(0)
            drVDaysWorkedRef.setValue(0)
            drVProductionPerDayRef.setValue(0)
            drVProductionPerHourRef.setValue(0)
            drVDollarAmountSameDayTreatmentRef.setValue(0)
            drVScheduledAppointmentsRef.setValue(0)
            drVAppointmentsKeptRef.setValue(0)
            drVPercentAppointmentsKeptRef.setValue(0)
            drVRetentionRateRef.setValue(0)
            
            drMcreeGoalRef.setValue(0)
            drMcreeNetProductionRef.setValue(0)
            drMcreeDaysWorkedRef.setValue(0)
            drMcreeProductionPerDayRef.setValue(0)
            drMcreeProductionPerHourRef.setValue(0)
            drMcreeDollarAmountSameDayTreatmentRef.setValue(0)
            drMcreeScheduledAppointmentsRef.setValue(0)
            drMcreeAppointmentsKeptRef.setValue(0)
            drMcreePercentAppointmentsKeptRef.setValue(0)
            drMcreeRetentionRateRef.setValue(0)
            
            
        } else if currentUser == "heatherlyn01@gmail.com" {
            // Orza
            
            drOrzaGoalRef.setValue(0)
            drOrzaNetProductionRef.setValue(0)
            drOrzaDaysWorkedRef.setValue(0)
            drOrzaProductionPerDayRef.setValue(0)
            drOrzaProductionPerHourRef.setValue(0)
            drOrzaDollarAmountSameDayTreatmentRef.setValue(0)
            drOrzaScheduledAppointmentsRef.setValue(0)
            drOrzaAppointmentsKeptRef.setValue(0)
            drOrzaPercentAppointmentsKeptRef.setValue(0)
            drOrzaRetentionRateRef.setValue(0)
            
        } else if currentUser == "kincaid-skk.090@gmail.com" {
            //Fran
            
            drFranGoalRef.setValue(0)
            drFranNetProductionRef.setValue(0)
            drFranDaysWorkedRef.setValue(0)
            drFranProductionPerDayRef.setValue(0)
            drFranProductionPerHourRef.setValue(0)
            drFranDollarAmountSameDayTreatmentRef.setValue(0)
            drFranScheduledAppointmentsRef.setValue(0)
            drFranAppointmentsKeptRef.setValue(0)
            drFranPercentAppointmentsKeptRef.setValue(0)
            drFranRetentionRateRef.setValue(0)
            
        } else if currentUser == "heatherR1stChoice@gmail.com" {
            
            heatherDyerAmountPresentedRef.setValue(0)
            heatherDyerAmountAcceptedRef.setValue(0)
            heatherDyerPercentOfDollarAmountScheduledRef.setValue(0)
            heatherDyerNumberOfPatientsPresentedTreatmentRef.setValue(0)
            heatherDyerNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            heatherDyerPercentOfPatientAcceptedTreatmentRef.setValue(0)
            
            woodstockNetProductionRef.setValue(0)
            woodstockCollectionsRef.setValue(0)
            woodstockInsuranceCollectionsRef.setValue(0)
            woodstockOTCollectionsRef.setValue(0)
            woodstockDollarAmountRefundedToInsuranceRef.setValue(0)
            woodstockDollarAmountRefundedToPatientsRef.setValue(0)
            woodstockPercentOTCToTotalCollectionsRef.setValue(0)
            woodstockPercentInsuranceToTotalCollectionsRef.setValue(0)
            woodstockPercentCollectionsToNetProductionRef.setValue(0)
            woodstockProductionPerActiveChairRef.setValue(0)
            
            kennesawNetProductionRef.setValue(0)
            kennesawCollectionsRef.setValue(0)
            kennesawInsuranceCollectionsRef.setValue(0)
            kennesawOTCollectionsRef.setValue(0)
            kennesawDollarAmountRefundedToInsuranceRef.setValue(0)
            kennesawDollarAmountRefundedToPatientsRef.setValue(0)
            kennesawPercentOTCToTotalCollectionsRef.setValue(0)
            kennesawPercentInsuranceToTotalCollectionsRef.setValue(0)
            kennesawPercentCollectionsToNetProductionRef.setValue(0)
            kennesawProductionPerActiveChairRef.setValue(0)
            
            hollyAmountPresentedRef.setValue(0)
            hollyAmountAcceptedRef.setValue(0)
            hollyPercentOfDollarAmountScheduledRef.setValue(0)
            hollyNumberOfPatientsPresentedTreatmentRef.setValue(0)
            hollyNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            hollyPercentOfPatientAcceptedTreatmentRef.setValue(0)
            
            sydneyAmountPresentedRef.setValue(0)
            sydneyAmountAcceptedRef.setValue(0)
            sydneyPercentOfDollarAmountScheduledRef.setValue(0)
            sydneyNumberOfPatientsPresentedTreatmentRef.setValue(0)
            sydneyNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            sydneyPercentOfPatientAcceptedTreatmentRef.setValue(0)
            
            amandaAmountPresentedRef.setValue(0)
            amandaAmountAcceptedRef.setValue(0)
            amandaPercentOfDollarAmountScheduledRef.setValue(0)
            amandaNumberOfPatientsPresentedTreatmentRef.setValue(0)
            amandaNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            amandaPercentOfPatientAcceptedTreatmentRef.setValue(0)
            
            ashleyAmountPresentedRef.setValue(0)
            ashleyAmountAcceptedRef.setValue(0)
            ashleyPercentOfDollarAmountScheduledRef.setValue(0)
            ashleyNumberOfPatientsPresentedTreatmentRef.setValue(0)
            ashleyNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            ashleyPercentOfPatientAcceptedTreatmentRef.setValue(0)
            
            debbieAmountPresentedRef.setValue(0)
            debbieAmountAcceptedRef.setValue(0)
            debbiePercentOfDollarAmountScheduledRef.setValue(0)
            debbieNumberOfPatientsPresentedTreatmentRef.setValue(0)
            debbieNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            debbiePercentOfPatientAcceptedTreatmentRef.setValue(0)
            
            annaAmountPresentedRef.setValue(0)
            annaAmountAcceptedRef.setValue(0)
            annaPercentOfDollarAmountScheduledRef.setValue(0)
            annaNumberOfPatientsPresentedTreatmentRef.setValue(0)
            annaNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            annaPercentOfPatientAcceptedTreatmentRef.setValue(0)
            
            jessicaAmountPresentedRef.setValue(0)
            jessicaAmountAcceptedRef.setValue(0)
            jessicaPercentOfDollarAmountScheduledRef.setValue(0)
            jessicaNumberOfPatientsPresentedTreatmentRef.setValue(0)
            jessicaNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            jessicaPercentOfPatientAcceptedTreatmentRef.setValue(0)
            
            drVGoalRef.setValue(0)
            drVNetProductionRef.setValue(0)
            drVDaysWorkedRef.setValue(0)
            drVProductionPerDayRef.setValue(0)
            drVProductionPerHourRef.setValue(0)
            drVDollarAmountSameDayTreatmentRef.setValue(0)
            drVScheduledAppointmentsRef.setValue(0)
            drVAppointmentsKeptRef.setValue(0)
            drVPercentAppointmentsKeptRef.setValue(0)
            drVRetentionRateRef.setValue(0)
            
            drMcreeGoalRef.setValue(0)
            drMcreeNetProductionRef.setValue(0)
            drMcreeDaysWorkedRef.setValue(0)
            drMcreeProductionPerDayRef.setValue(0)
            drMcreeProductionPerHourRef.setValue(0)
            drMcreeDollarAmountSameDayTreatmentRef.setValue(0)
            drMcreeScheduledAppointmentsRef.setValue(0)
            drMcreeAppointmentsKeptRef.setValue(0)
            drMcreePercentAppointmentsKeptRef.setValue(0)
            drMcreeRetentionRateRef.setValue(0)
            
            drOrzaGoalRef.setValue(0)
            drOrzaNetProductionRef.setValue(0)
            drOrzaDaysWorkedRef.setValue(0)
            drOrzaProductionPerDayRef.setValue(0)
            drOrzaProductionPerHourRef.setValue(0)
            drOrzaDollarAmountSameDayTreatmentRef.setValue(0)
            drOrzaScheduledAppointmentsRef.setValue(0)
            drOrzaAppointmentsKeptRef.setValue(0)
            drOrzaPercentAppointmentsKeptRef.setValue(0)
            drOrzaRetentionRateRef.setValue(0)
            
            drFranGoalRef.setValue(0)
            drFranNetProductionRef.setValue(0)
            drFranDaysWorkedRef.setValue(0)
            drFranProductionPerDayRef.setValue(0)
            drFranProductionPerHourRef.setValue(0)
            drFranDollarAmountSameDayTreatmentRef.setValue(0)
            drFranScheduledAppointmentsRef.setValue(0)
            drFranAppointmentsKeptRef.setValue(0)
            drFranPercentAppointmentsKeptRef.setValue(0)
            drFranRetentionRateRef.setValue(0)
            
            amyGoalRef.setValue(0)
            amyNetProductionRef.setValue(0)
            amyDaysWorkedRef.setValue(0)
            amyProductionPerDayRef.setValue(0)
            amyHoursWorkedRef.setValue(0)
            amyProductionPerHourRef.setValue(0)
            amyScheduledAppointmentsRef.setValue(0)
            amyAppointmentsKeptRef.setValue(0)
            amyPercentAppointmentsKeptRef.setValue(0)
            amyPerioPercentRef.setValue(0)
            amyFluoridePresentedRef.setValue(0)
            amyFluorideAcceptedRef.setValue(0)
            amyFluoridePercentRef.setValue(0)
            amyOralIDPresentedRef.setValue(0)
            amyOralIDAcceptedRef.setValue(0)
            amyOralIDPercentRef.setValue(0)
            amyArestinPresentedRef.setValue(0)
            amyArestinAcceptedRef.setValue(0)
            amyArestinPercentRef.setValue(0)
            amyAppointmentsSeenRef.setValue(0)
            amyReappointmentsRef.setValue(0)
            amyReappointmentRateRef.setValue(0)
            amyRetentionRateRef.setValue(0)
            
            aubreyGoalRef.setValue(0)
            aubreyNetProductionRef.setValue(0)
            aubreyDaysWorkedRef.setValue(0)
            aubreyProductionPerDayRef.setValue(0)
            aubreyHoursWorkedRef.setValue(0)
            aubreyProductionPerHourRef.setValue(0)
            aubreyScheduledAppointmentsRef.setValue(0)
            aubreyAppointmentsKeptRef.setValue(0)
            aubreyPercentAppointmentsKeptRef.setValue(0)
            aubreyPerioPercentRef.setValue(0)
            aubreyFluoridePresentedRef.setValue(0)
            aubreyFluorideAcceptedRef.setValue(0)
            aubreyFluoridePercentRef.setValue(0)
            aubreyOralIDPresentedRef.setValue(0)
            aubreyOralIDAcceptedRef.setValue(0)
            aubreyOralIDPercentRef.setValue(0)
            aubreyArestinPresentedRef.setValue(0)
            aubreyArestinAcceptedRef.setValue(0)
            aubreyArestinPercentRef.setValue(0)
            aubreyAppointmentsSeenRef.setValue(0)
            aubreyReappointmentsRef.setValue(0)
            aubreyReappointmentRateRef.setValue(0)
            aubreyRetentionRateRef.setValue(0)
            
            dawnGoalRef.setValue(0)
            dawnNetProductionRef.setValue(0)
            dawnDaysWorkedRef.setValue(0)
            dawnProductionPerDayRef.setValue(0)
            dawnHoursWorkedRef.setValue(0)
            dawnProductionPerHourRef.setValue(0)
            dawnScheduledAppointmentsRef.setValue(0)
            dawnAppointmentsKeptRef.setValue(0)
            dawnPercentAppointmentsKeptRef.setValue(0)
            dawnPerioPercentRef.setValue(0)
            dawnFluoridePresentedRef.setValue(0)
            dawnFluorideAcceptedRef.setValue(0)
            dawnFluoridePercentRef.setValue(0)
            dawnOralIDPresentedRef.setValue(0)
            dawnOralIDAcceptedRef.setValue(0)
            dawnOralIDPercentRef.setValue(0)
            dawnArestinPresentedRef.setValue(0)
            dawnArestinAcceptedRef.setValue(0)
            dawnArestinPercentRef.setValue(0)
            dawnAppointmentsSeenRef.setValue(0)
            dawnReappointmentsRef.setValue(0)
            dawnReappointmentRateRef.setValue(0)
            dawnRetentionRateRef.setValue(0)
            
            sheilaGoalRef.setValue(0)
            sheilaNetProductionRef.setValue(0)
            sheilaDaysWorkedRef.setValue(0)
            sheilaProductionPerDayRef.setValue(0)
            sheilaHoursWorkedRef.setValue(0)
            sheilaProductionPerHourRef.setValue(0)
            sheilaScheduledAppointmentsRef.setValue(0)
            sheilaAppointmentsKeptRef.setValue(0)
            sheilaPercentAppointmentsKeptRef.setValue(0)
            sheilaPerioPercentRef.setValue(0)
            sheilaFluoridePresentedRef.setValue(0)
            sheilaFluorideAcceptedRef.setValue(0)
            sheilaFluoridePercentRef.setValue(0)
            sheilaOralIDPresentedRef.setValue(0)
            sheilaOralIDAcceptedRef.setValue(0)
            sheilaOralIDPercentRef.setValue(0)
            sheilaArestinPresentedRef.setValue(0)
            sheilaArestinAcceptedRef.setValue(0)
            sheilaArestinPercentRef.setValue(0)
            sheilaAppointmentsSeenRef.setValue(0)
            sheilaReappointmentsRef.setValue(0)
            sheilaReappointmentRateRef.setValue(0)
            sheilaRetentionRateRef.setValue(0)
            
            ashleyGoalRef.setValue(0)
            ashleyNetProductionRef.setValue(0)
            ashleyDaysWorkedRef.setValue(0)
            ashleyProductionPerDayRef.setValue(0)
            ashleyHoursWorkedRef.setValue(0)
            ashleyProductionPerHourRef.setValue(0)
            ashleyScheduledAppointmentsRef.setValue(0)
            ashleyAppointmentsKeptRef.setValue(0)
            ashleyPercentAppointmentsKeptRef.setValue(0)
            ashleyPerioPercentRef.setValue(0)
            ashleyFluoridePresentedRef.setValue(0)
            ashleyFluorideAcceptedRef.setValue(0)
            ashleyFluoridePercentRef.setValue(0)
            ashleyOralIDPresentedRef.setValue(0)
            ashleyOralIDAcceptedRef.setValue(0)
            ashleyOralIDPercentRef.setValue(0)
            ashleyArestinPresentedRef.setValue(0)
            ashleyArestinAcceptedRef.setValue(0)
            ashleyArestinPercentRef.setValue(0)
            ashleyAppointmentsSeenRef.setValue(0)
            ashleyReappointmentsRef.setValue(0)
            ashleyReappointmentRateRef.setValue(0)
            ashleyRetentionRateRef.setValue(0)
            
        } else if currentUser == "heatherd1stchoice@gmail.com" {
            
            heatherDyerAmountPresentedRef.setValue(0)
            heatherDyerAmountAcceptedRef.setValue(0)
            heatherDyerPercentOfDollarAmountScheduledRef.setValue(0)
            heatherDyerNumberOfPatientsPresentedTreatmentRef.setValue(0)
            heatherDyerNumberOfPatientsAcceptedTreatmentRef.setValue(0)
            heatherDyerPercentOfPatientAcceptedTreatmentRef.setValue(0)
            
        }
    }
    
    func validateUser() {
        if let email = currentUser, let password = currentUserPassword {
            AuthService.instance.login(email: email, password: password) { (error, data) in
                guard error == nil else {
                    self.present(ViewController(), animated: true) {}
                    self.signedIn = false
                    UserDefaults.standard.set(false, forKey: "signedIn")
                    UserDefaults.standard.synchronize()
                    
                    let alert = UIAlertController(title: "Error Authentication", message: error, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    return;
                }
                if error == nil {
                    print("Login Successful")
                } else {
                    
                }
            }
        }
    }
    
}

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
}
