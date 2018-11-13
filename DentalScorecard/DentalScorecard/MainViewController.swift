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
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let netProductionTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let collectionsTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let insuranceCollectionsTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let otcCollectionsTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let amountRefundedToInsuranceTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let amountRefundedToPatientsTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentOTCToTotalCollectionsTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
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
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentInsuranceToTotalCollectionsTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
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
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let percentCollectionsToNetProducionTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
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
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        textField.isEnabled = false
        
        return textField
    }()
    
    let productionPerActiveChairTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
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
        
        return label
    }()
    
    let amountPresentedTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let amountPresentedTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        return label
    }()
    
    let amountAcceptedTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let amountAcceptedTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        return label
    }()
    
    let percentOfDollarAmountScheduledTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        // might need to disable editing like i did for the first round of percents
        // I did it all the way for the Woodstock and Kennesaw textfields where it was needed
        // Every box that is calculated needs to have editing diabled
        
        return textField
    }()
    
    let percentOfDollarAmountScheduledTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        return label
    }()
    
    let numberPatientsPresentedTreatmentTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "#"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let numberPatientsPresentedTreatmentTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "#"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        return label
    }()
    
    let numberPatientsAcceptedTreatmentTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "#"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let numberPatientsAcceptedTreatmentTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "#"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        return label
    }()
    
    let percentPatientsAcceptedTreatmentTextField1: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let percentPatientsAcceptedTreatmentTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        return label
    }()
    
    let amountPresentedTextField3: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let amountPresentedTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        return label
    }()
    
    let amountAcceptedTextField3: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let amountAcceptedTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        return label
    }()
    
    let percentOfDollarAmountScheduledTextField3: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let percentOfDollarAmountScheduledTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        return label
    }()
    
    let numberPatientsPresentedTreatmentTextField3: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "#"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let numberPatientsPresentedTreatmentTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "#"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        return label
    }()
    
    let numberPatientsAcceptedTreatmentTextField3: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "#"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let numberPatientsAcceptedTreatmentTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "#"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        return label
    }()
    
    let percentPatientsAcceptedTreatmentTextField3: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let percentPatientsAcceptedTreatmentTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let amountPresentedTextField6: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let amountAcceptedTextField6: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let percentOfDollarAmountScheduledTextField6: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        return label
    }()
    
    let numberPatientsPresentedTreatmentTextField5: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "#"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let numberPatientsPresentedTreatmentTextField6: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "#"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        return label
    }()
    
    let numberPatientsAcceptedTreatmentTextField5: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "#"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let numberPatientsAcceptedTreatmentTextField6: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "#"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        return label
    }()
    
    let percentPatientsAcceptedTreatmentTextField5: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let percentPatientsAcceptedTreatmentTextField6: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let goalTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let netProductionTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "#"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let daysWorkedTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "#"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let productionPerDayTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let productionPerHourTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let dollarAmountSameDayTreatmentTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let percentAppointmentsKeptTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let retentionRateTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let goalTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let netProductionTextField6: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "#"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let daysWorkedTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "#"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let productionPerDayTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let productionPerHourTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let dollarAmountSameDayTreatmentTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let percentAppointmentsKeptTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let retentionRateTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        label.text = "Hygeine"
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
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let goalTextField6: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let netProductionTextField8: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "#"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let daysWorkedTextField6: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "#"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let productionPerDayTextField6: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "#"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let numberOfHoursWorkedTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "#"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let productionPerHourTextField6: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let percentAppointmentsKeptTextField6: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let perioPercentTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let fluoridePercentTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let oralIdPercentTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let arestinPercentTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let reappointmentRateTextField2: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let retentionRateTextField6: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        label.text = "Hygeine"
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
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let goalTextField8: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let netProductionTextField10: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "#"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let daysWorkedTextField8: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "#"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let productionPerDayTextField8: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "#"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let numberOfHoursWorkedTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "#"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let productionPerHourTextField8: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let percentAppointmentsKeptTextField8: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let perioPercentTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let fluoridePercentTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let oralIdPercentTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let arestinPercentTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let reappointmentRateTextField4: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let retentionRateTextField8: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let ashleyLbl: UILabel = {
        let label = UILabel()
        
        label.text = "Ashley"
        label.font = UIFont(name: "AmericanTypewriter-Bold ", size: 28)
        label.textColor = UIColor(r: 57, g: 125, b: 161)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        
        return label
    }()
    
    let netProductionTextField11: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let daysWorkedTextField9: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "#"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let productionPerDayTextField9: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let numberOfHoursWorkedTextField5: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "#"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let productionPerHourTextField9: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "$"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let percentAppointmentsKeptTextField9: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let perioPercentTextField5: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let fluoridePercentTextField5: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let oralIdPercentTextField5: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let arestinPercentTextField5: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let reappointmentRateTextField5: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let retentionRateTextField9: UITextField = {
        let textField  = UITextField()
        
        textField.placeholder = "%"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.keyboardType = .numberPad
        
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
    
    let drVGoalRef = Database.database().reference().child("DrVGoal")
    let drVNetProductionRef = Database.database().reference().child("DrVNetProduction")
    let drVDaysWorkedRef = Database.database().reference().child("DrVDaysWorked")
    let drVProductionPerDayRef = Database.database().reference().child("DrVProductionPerDay")
    let drVProductionPerHourRef = Database.database().reference().child("DrVProductionPerHour")
    let drVDollarAmountSameDayTreatmentRef = Database.database().reference().child("DrVDollarAmountSameDayTreatment")
    let drVPercentAppointmentsKeptRef = Database.database().reference().child("DrVPercentAppointmentsKept")
    let drVRetentionRateRef = Database.database().reference().child("DrVRetentionRate")
    
    let drMcreeGoalRef = Database.database().reference().child("DrMcreeGoal")
    let drMcreeNetProductionRef = Database.database().reference().child("DrMcreeNetProduction")
    let drMcreeDaysWorkedRef = Database.database().reference().child("DrMcreeDaysWorked")
    let drMcreeProductionPerDayRef = Database.database().reference().child("DrMcreeProductionPerDay")
    let drMcreeProductionPerHourRef = Database.database().reference().child("DrMcreeProductionPerHour")
    let drMcreeDollarAmountSameDayTreatmentRef = Database.database().reference().child("DrMcreeDollarAmountSameDayTreatment")
    let drMcreePercentAppointmentsKeptRef = Database.database().reference().child("DrMcreePercentAppointmentsKept")
    let drMcreeRetentionRateRef = Database.database().reference().child("DrMcreeRetentionRate")
    
    let drOrzaGoalRef = Database.database().reference().child("DrOrzaGoal")
    let drOrzaNetProductionRef = Database.database().reference().child("DrOrzaNetProduction")
    let drOrzaDaysWorkedRef = Database.database().reference().child("DrOrzaDaysWorked")
    let drOrzaProductionPerDayRef = Database.database().reference().child("DrOrzaProductionPerDay")
    let drOrzaProductionPerHourRef = Database.database().reference().child("DrOrzaProductionPerHour")
    let drOrzaDollarAmountSameDayTreatmentRef = Database.database().reference().child("DrOrzaDollarAmountSameDayTreatment")
    let drOrzaPercentAppointmentsKeptRef = Database.database().reference().child("DrOrzaPercentAppointmentsKept")
    let drOrzaRetentionRateRef = Database.database().reference().child("DrOrzaRetentionRate")
    
    let drFranGoalRef = Database.database().reference().child("DrFranGoal")
    let drFranNetProductionRef = Database.database().reference().child("DrFranNetProduction")
    let drFranDaysWorkedRef = Database.database().reference().child("DrFranDaysWorked")
    let drFranProductionPerDayRef = Database.database().reference().child("DrFranProductionPerDay")
    let drFranProductionPerHourRef = Database.database().reference().child("DrFranProductionPerHour")
    let drFranDollarAmountSameDayTreatmentRef = Database.database().reference().child("DrFranDollarAmountSameDayTreatment")
    let drFranPercentAppointmentsKeptRef = Database.database().reference().child("DrFranPercentAppointmentsKept")
    let drFranRetentionRateRef = Database.database().reference().child("DrFranRetentionRate")
    
    let amyGoalRef = Database.database().reference().child("AmyGoal")
    let amyNetProductionRef = Database.database().reference().child("AmyNetProduction")
    let amyDaysWorkedRef = Database.database().reference().child("AmyDaysWorked")
    let amyProductionPerDayRef = Database.database().reference().child("AmyProductionPerDay")
    let amyHoursWorkedRef = Database.database().reference().child("AmyHoursWorked")
    let amyProductionPerHourRef = Database.database().reference().child("AmyProductionPerHour")
    let amyPercentAppointmentsKeptRef = Database.database().reference().child("AmyPercentAppointmentsKept")
    let amyPerioPercentRef = Database.database().reference().child("AmyPerioPercent")
    let amyFluoridePercentRef = Database.database().reference().child("AmyFluoridePercent")
    let amyOralIDPercentRef = Database.database().reference().child("AmyOralIDPercent")
    let amyArestinPercentRef = Database.database().reference().child("AmyArestinPercent")
    let amyReappointmentRateRef = Database.database().reference().child("AmyReappointmentRate")
    let amyRetentionRateRef = Database.database().reference().child("AmyRetentionRate")
    
    let aubreyGoalRef = Database.database().reference().child("AubreyGoal")
    let aubreyNetProductionRef = Database.database().reference().child("AubreyNetProduction")
    let aubreyDaysWorkedRef = Database.database().reference().child("AubreyDaysWorked")
    let aubreyProductionPerDayRef = Database.database().reference().child("AubreyProductionPerDay")
    let aubreyHoursWorkedRef = Database.database().reference().child("AubreyHoursWorked")
    let aubreyProductionPerHourRef = Database.database().reference().child("AubreyProductionPerHour")
    let aubreyPercentAppointmentsKeptRef = Database.database().reference().child("AubreyPercentAppointmentsKept")
    let aubreyPerioPercentRef = Database.database().reference().child("AubreyPerioPercent")
    let aubreyFluoridePercentRef = Database.database().reference().child("AubreyFluoridePercent")
    let aubreyOralIDPercentRef = Database.database().reference().child("AubreyOralIDPercent")
    let aubreyArestinPercentRef = Database.database().reference().child("AubreyArestinPercent")
    let aubreyReappointmentRateRef = Database.database().reference().child("AubreyPercentAppointmentsKept")
    let aubreyRetentionRateRef = Database.database().reference().child("AubreyRetentionRate")
    
    let dawnGoalRef = Database.database().reference().child("DawnGoal")
    let dawnNetProductionRef = Database.database().reference().child("DawnNetProduction")
    let dawnDaysWorkedRef = Database.database().reference().child("DawnDaysWorked")
    let dawnProductionPerDayRef = Database.database().reference().child("DawnProductionPerDay")
    let dawnHoursWorkedRef = Database.database().reference().child("DawnHoursWorked")
    let dawnProductionPerHourRef = Database.database().reference().child("DawnProductionPerHour")
    let dawnPercentAppointmentsKeptRef = Database.database().reference().child("DawnPercentAppointmentsKept")
    let dawnPerioPercentRef = Database.database().reference().child("DawnPerioPercent")
    let dawnFluoridePercentRef = Database.database().reference().child("DawnFluoridePercent")
    let dawnOralIDPercentRef = Database.database().reference().child("DawnOralIDPercent")
    let dawnArestinPercentRef = Database.database().reference().child("DawnArestinPercent")
    let dawnReappointmentRateRef = Database.database().reference().child("DawnReappointmentRate")
    let dawnRetentionRateRef = Database.database().reference().child("DawnRetentionRate")
    
    let sheilaGoalRef = Database.database().reference().child("SheilaGoal")
    let sheilaNetProductionRef = Database.database().reference().child("SheilaNetProduction")
    let sheilaDaysWorkedRef = Database.database().reference().child("SheilaDaysWorked")
    let sheilaProductionPerDayRef = Database.database().reference().child("SheilaProductionPerDay")
    let sheilaHoursWorkedRef = Database.database().reference().child("SheilaHoursWorked")
    let sheilaProductionPerHourRef = Database.database().reference().child("SheilaProductionPerHour")
    let sheilaPercentAppointmentsKeptRef = Database.database().reference().child("SheilaPercentAppointmentsKept")
    let sheilaPerioPercentRef = Database.database().reference().child("SheilaPerioPercent")
    let sheilaFluoridePercentRef = Database.database().reference().child("SheilaFluoridePercent")
    let sheilaOralIDPercentRef = Database.database().reference().child("SheilaOralIDPercent")
    let sheilaArestinPercentRef = Database.database().reference().child("SheilaArestinPercent")
    let sheilaReappointmentRateRef = Database.database().reference().child("SheilaReappointmentRate")
    let sheilaRetentionRateRef = Database.database().reference().child("SheilaRetentionRate")
    
    let ashleyGoalRef = Database.database().reference().child("AshleyGoal")
    let ashleyNetProductionRef = Database.database().reference().child("AshleyNetProduction")
    let ashleyDaysWorkedRef = Database.database().reference().child("AshleyDaysWorked")
    let ashleyProductionPerDayRef = Database.database().reference().child("AshleyProductionPerDay")
    let ashleyHoursWorkedRef = Database.database().reference().child("AshleyHoursWorked")
    let ashleyProductionPerHourRef = Database.database().reference().child("AshleyProductionPerHour")
    let ashleyPercentAppointmentsKeptRef = Database.database().reference().child("AshleyPercentAppointmentsKept")
    let ashleyPerioPercentRef = Database.database().reference().child("AshleyPerioPercent")
    let ashleyFluoridePercentRef = Database.database().reference().child("AshleyFluoridePercent")
    let ashleyOralIDPercentRef = Database.database().reference().child("AshleyOralIDPercent")
    let ashleyArestinPercentRef = Database.database().reference().child("AshleyArestinPercent")
    let ashleyReappointmentRateRef = Database.database().reference().child("AshleyReappointmentRate")
    let ashleyRetentionRateRef = Database.database().reference().child("AshleyRetentionRate")
    
    var sessionWoodstockCollectionsValue: Double = 0.0
    var sessionWoodstockOTCCollectionsValue: Double = 0.0
    var sessionWoodstockInsuranceCollectionsValue: Double = 0.0
    var sessionWoodstockNetProductionsValue: Double = 0.0
    
    var sessionKennesawCollectionsValue: Double = 0.0
    var sessionKennesawOTCCollectionsValue: Double = 0.0
    var sessionKennesawInsuranceCollectionsValue: Double = 0.0
    var sessionKennesawNetProductionValue: Double = 0.0
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        navigationItem.title = "MainViewController"
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.isNavigationBarHidden = true
        
        // how to run a timer now
        //percentTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.handlePercents), userInfo: nil, repeats: true)
        //percentTimer.fire()
        
        scrollView.contentSize = CGSize(width: (view.frame.width * 0.95), height: 5000)
        
        netProductionTextField1.backgroundColor = UIColor.green
        collectionsTextField1.backgroundColor = UIColor.red
        
        self.view.addSubview(titleUnderline)
        self.view.addSubview(titleLbl)
        self.view.addSubview(logo)
        self.view.addSubview(submitButton)
        self.view.addSubview(logOutButton)
        self.view.addSubview(scrollViewBorderView)
        self.scrollViewBorderView.addSubview(scrollView)
        
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
        categoryDivider4.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.48).isActive = true
        
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
        treatmentCoordinatorsLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.025)
        
        categoryDivider6.centerXAnchor.constraint(equalTo: scrollView.leftAnchor, constant: view.frame.width * 0.4).isActive = true
        categoryDivider6.topAnchor.constraint(equalTo: categoryDivider5.bottomAnchor, constant: 0).isActive = true
        categoryDivider6.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.001).isActive = true
        categoryDivider6.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.48).isActive = true
        
        amandaLbl.leftAnchor.constraint(equalTo: categoryDivider6.leftAnchor, constant: 5).isActive = true
        amandaLbl.centerYAnchor.constraint(equalTo: categoryHighlight3.centerYAnchor).isActive = true
        amandaLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.025)
        
        amountPresentedLbl2.leftAnchor.constraint(equalTo: categoryHighlight3.leftAnchor, constant: 0).isActive = true
        amountPresentedLbl2.topAnchor.constraint(equalTo: categoryDivider5.bottomAnchor, constant: 0).isActive = true
        amountPresentedLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        amountPresentedLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        amountPresentedLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        amountPresentedTextField3.leftAnchor.constraint(equalTo: categoryDivider4.leftAnchor, constant: 0).isActive = true
        amountPresentedTextField3.centerYAnchor.constraint(equalTo: amountPresentedLbl2.centerYAnchor).isActive = true
        amountPresentedTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        amountPresentedTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        amountPresentedTextField4.leftAnchor.constraint(equalTo: amountPresentedTextField3.rightAnchor, constant: 0.5).isActive = true
        amountPresentedTextField4.centerYAnchor.constraint(equalTo: amountPresentedLbl2.centerYAnchor).isActive = true
        amountPresentedTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        amountPresentedTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        AshleyGLbl.leftAnchor.constraint(equalTo: amountPresentedTextField4.leftAnchor, constant: 1).isActive = true
        AshleyGLbl.centerYAnchor.constraint(equalTo: categoryHighlight3.centerYAnchor).isActive = true
        AshleyGLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.025)
        
        amountAcceptedLbl2.centerXAnchor.constraint(equalTo: amountPresentedLbl2.centerXAnchor).isActive = true
        amountAcceptedLbl2.topAnchor.constraint(equalTo: amountPresentedLbl2.bottomAnchor, constant: 0.5).isActive = true
        amountAcceptedLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        amountAcceptedLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        amountAcceptedLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        amountAcceptedTextField3.leftAnchor.constraint(equalTo: categoryDivider6.leftAnchor, constant: 0).isActive = true
        amountAcceptedTextField3.centerYAnchor.constraint(equalTo: amountAcceptedLbl2.centerYAnchor).isActive = true
        amountAcceptedTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        amountAcceptedTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        amountAcceptedTextField4.leftAnchor.constraint(equalTo: amountAcceptedTextField3.rightAnchor, constant: 0.5).isActive = true
        amountAcceptedTextField4.centerYAnchor.constraint(equalTo: amountAcceptedLbl2.centerYAnchor).isActive = true
        amountAcceptedTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        amountAcceptedTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentOfDollarAmountScheduledLbl2.centerXAnchor.constraint(equalTo: amountAcceptedLbl2.centerXAnchor).isActive = true
        percentOfDollarAmountScheduledLbl2.topAnchor.constraint(equalTo: amountAcceptedLbl2.bottomAnchor, constant: 0.5).isActive = true
        percentOfDollarAmountScheduledLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        percentOfDollarAmountScheduledLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        percentOfDollarAmountScheduledLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        percentOfDollarAmountScheduledTextField3.leftAnchor.constraint(equalTo: categoryDivider6.leftAnchor, constant: 0).isActive = true
        percentOfDollarAmountScheduledTextField3.centerYAnchor.constraint(equalTo: percentOfDollarAmountScheduledLbl2.centerYAnchor).isActive = true
        percentOfDollarAmountScheduledTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        percentOfDollarAmountScheduledTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentOfDollarAmountScheduledTextField4.leftAnchor.constraint(equalTo: percentOfDollarAmountScheduledTextField3.rightAnchor, constant: 0.5).isActive = true
        percentOfDollarAmountScheduledTextField4.centerYAnchor.constraint(equalTo: percentOfDollarAmountScheduledLbl2.centerYAnchor).isActive = true
        percentOfDollarAmountScheduledTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        percentOfDollarAmountScheduledTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        numberPatientsPresentedTreatmentLbl2.centerXAnchor.constraint(equalTo: percentOfDollarAmountScheduledLbl2.centerXAnchor).isActive = true
        numberPatientsPresentedTreatmentLbl2.topAnchor.constraint(equalTo: percentOfDollarAmountScheduledLbl2.bottomAnchor, constant: 0.5).isActive = true
        numberPatientsPresentedTreatmentLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        numberPatientsPresentedTreatmentLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        numberPatientsPresentedTreatmentLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        numberPatientsPresentedTreatmentTextField3.leftAnchor.constraint(equalTo: categoryDivider6.leftAnchor, constant: 0).isActive = true
        numberPatientsPresentedTreatmentTextField3.centerYAnchor.constraint(equalTo: numberPatientsPresentedTreatmentLbl2.centerYAnchor).isActive = true
        numberPatientsPresentedTreatmentTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        numberPatientsPresentedTreatmentTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        numberPatientsPresentedTreatmentTextField4.leftAnchor.constraint(equalTo: numberPatientsPresentedTreatmentTextField3.rightAnchor, constant: 0.5).isActive = true
        numberPatientsPresentedTreatmentTextField4.centerYAnchor.constraint(equalTo: numberPatientsPresentedTreatmentLbl2.centerYAnchor).isActive = true
        numberPatientsPresentedTreatmentTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        numberPatientsPresentedTreatmentTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        numberPatientsAccpetedTreatmentLbl2.centerXAnchor.constraint(equalTo: numberPatientsPresentedTreatmentLbl2.centerXAnchor).isActive = true
        numberPatientsAccpetedTreatmentLbl2.topAnchor.constraint(equalTo: numberPatientsPresentedTreatmentLbl2.bottomAnchor, constant: 0.5).isActive = true
        numberPatientsAccpetedTreatmentLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        numberPatientsAccpetedTreatmentLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        numberPatientsAccpetedTreatmentLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        numberPatientsAcceptedTreatmentTextField3.leftAnchor.constraint(equalTo: categoryDivider6.leftAnchor, constant: 0).isActive = true
        numberPatientsAcceptedTreatmentTextField3.centerYAnchor.constraint(equalTo: numberPatientsAccpetedTreatmentLbl2.centerYAnchor).isActive = true
        numberPatientsAcceptedTreatmentTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        numberPatientsAcceptedTreatmentTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        numberPatientsAcceptedTreatmentTextField4.leftAnchor.constraint(equalTo: numberPatientsAcceptedTreatmentTextField3.rightAnchor, constant: 0.5).isActive = true
        numberPatientsAcceptedTreatmentTextField4.centerYAnchor.constraint(equalTo: numberPatientsAccpetedTreatmentLbl2.centerYAnchor).isActive = true
        numberPatientsAcceptedTreatmentTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        numberPatientsAcceptedTreatmentTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentPatientsAcceptedTreatmentLbl2.centerXAnchor.constraint(equalTo: numberPatientsAccpetedTreatmentLbl2.centerXAnchor).isActive = true
        percentPatientsAcceptedTreatmentLbl2.topAnchor.constraint(equalTo: numberPatientsAccpetedTreatmentLbl2.bottomAnchor, constant: 0.5).isActive = true
        percentPatientsAcceptedTreatmentLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        percentPatientsAcceptedTreatmentLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        percentPatientsAcceptedTreatmentLbl2.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        percentPatientsAcceptedTreatmentTextField3.leftAnchor.constraint(equalTo: categoryDivider6.leftAnchor, constant: 0).isActive = true
        percentPatientsAcceptedTreatmentTextField3.centerYAnchor.constraint(equalTo: percentPatientsAcceptedTreatmentLbl2.centerYAnchor).isActive = true
        percentPatientsAcceptedTreatmentTextField3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        percentPatientsAcceptedTreatmentTextField3.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentPatientsAcceptedTreatmentTextField4.leftAnchor.constraint(equalTo: percentPatientsAcceptedTreatmentTextField3.rightAnchor, constant: 0.5).isActive = true
        percentPatientsAcceptedTreatmentTextField4.centerYAnchor.constraint(equalTo: percentPatientsAcceptedTreatmentLbl2.centerYAnchor).isActive = true
        percentPatientsAcceptedTreatmentTextField4.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        percentPatientsAcceptedTreatmentTextField4.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
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
        treatmentCoordinatorsLbl3.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.025)
        
        categoryDivider8.centerXAnchor.constraint(equalTo: scrollView.leftAnchor, constant: view.frame.width * 0.4).isActive = true
        categoryDivider8.topAnchor.constraint(equalTo: categoryDivider7.bottomAnchor, constant: 0).isActive = true
        categoryDivider8.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.001).isActive = true
        categoryDivider8.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.48).isActive = true
        
        debbieDLbl.leftAnchor.constraint(equalTo: categoryDivider8.leftAnchor, constant: 5).isActive = true
        debbieDLbl.centerYAnchor.constraint(equalTo: categoryHighlight4.centerYAnchor).isActive = true
        debbieDLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.025)
        
        amountPresentedLbl3.leftAnchor.constraint(equalTo: categoryHighlight4.leftAnchor, constant: 0).isActive = true
        amountPresentedLbl3.topAnchor.constraint(equalTo: categoryDivider7.bottomAnchor, constant: 0).isActive = true
        amountPresentedLbl3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        amountPresentedLbl3.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        amountPresentedLbl3.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        amountPresentedTextField5.leftAnchor.constraint(equalTo: categoryDivider8.leftAnchor, constant: 0).isActive = true
        amountPresentedTextField5.centerYAnchor.constraint(equalTo: amountPresentedLbl3.centerYAnchor).isActive = true
        amountPresentedTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        amountPresentedTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        amountPresentedTextField6.leftAnchor.constraint(equalTo: amountPresentedTextField5.rightAnchor, constant: 0.5).isActive = true
        amountPresentedTextField6.centerYAnchor.constraint(equalTo: amountPresentedLbl3.centerYAnchor).isActive = true
        amountPresentedTextField6.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        amountPresentedTextField6.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        annaCLbl.leftAnchor.constraint(equalTo: amountPresentedTextField6.leftAnchor, constant: 1).isActive = true
        annaCLbl.centerYAnchor.constraint(equalTo: categoryHighlight4.centerYAnchor).isActive = true
        annaCLbl.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.025)
        
        amountAcceptedLbl3.centerXAnchor.constraint(equalTo: amountPresentedLbl3.centerXAnchor).isActive = true
        amountAcceptedLbl3.topAnchor.constraint(equalTo: amountPresentedLbl3.bottomAnchor, constant: 0.5).isActive = true
        amountAcceptedLbl3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        amountAcceptedLbl3.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        amountAcceptedLbl3.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        amountAcceptedTextField5.leftAnchor.constraint(equalTo: categoryDivider8.leftAnchor, constant: 0).isActive = true
        amountAcceptedTextField5.centerYAnchor.constraint(equalTo: amountAcceptedLbl3.centerYAnchor).isActive = true
        amountAcceptedTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        amountAcceptedTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        amountAcceptedTextField6.leftAnchor.constraint(equalTo: amountAcceptedTextField5.rightAnchor, constant: 0.5).isActive = true
        amountAcceptedTextField6.centerYAnchor.constraint(equalTo: amountAcceptedLbl3.centerYAnchor).isActive = true
        amountAcceptedTextField6.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        amountAcceptedTextField6.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentOfDollarAmountScheduledLbl3.centerXAnchor.constraint(equalTo: amountAcceptedLbl3.centerXAnchor).isActive = true
        percentOfDollarAmountScheduledLbl3.topAnchor.constraint(equalTo: amountAcceptedLbl3.bottomAnchor, constant: 0.5).isActive = true
        percentOfDollarAmountScheduledLbl3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        percentOfDollarAmountScheduledLbl3.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        percentOfDollarAmountScheduledLbl3.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        percentOfDollarAmountScheduledTextField5.leftAnchor.constraint(equalTo: categoryDivider8.leftAnchor, constant: 0).isActive = true
        percentOfDollarAmountScheduledTextField5.centerYAnchor.constraint(equalTo: percentOfDollarAmountScheduledLbl3.centerYAnchor).isActive = true
        percentOfDollarAmountScheduledTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        percentOfDollarAmountScheduledTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentOfDollarAmountScheduledTextField6.leftAnchor.constraint(equalTo: percentOfDollarAmountScheduledTextField5.rightAnchor, constant: 0.5).isActive = true
        percentOfDollarAmountScheduledTextField6.centerYAnchor.constraint(equalTo: percentOfDollarAmountScheduledLbl3.centerYAnchor).isActive = true
        percentOfDollarAmountScheduledTextField6.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        percentOfDollarAmountScheduledTextField6.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        numberPatientsPresentedTreatmentLbl3.centerXAnchor.constraint(equalTo: percentOfDollarAmountScheduledLbl3.centerXAnchor).isActive = true
        numberPatientsPresentedTreatmentLbl3.topAnchor.constraint(equalTo: percentOfDollarAmountScheduledLbl3.bottomAnchor, constant: 0.5).isActive = true
        numberPatientsPresentedTreatmentLbl3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        numberPatientsPresentedTreatmentLbl3.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        numberPatientsPresentedTreatmentLbl3.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        numberPatientsPresentedTreatmentTextField5.leftAnchor.constraint(equalTo: categoryDivider8.leftAnchor, constant: 0).isActive = true
        numberPatientsPresentedTreatmentTextField5.centerYAnchor.constraint(equalTo: numberPatientsPresentedTreatmentLbl3.centerYAnchor).isActive = true
        numberPatientsPresentedTreatmentTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        numberPatientsPresentedTreatmentTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        numberPatientsPresentedTreatmentTextField6.leftAnchor.constraint(equalTo: numberPatientsPresentedTreatmentTextField5.rightAnchor, constant: 0.5).isActive = true
        numberPatientsPresentedTreatmentTextField6.centerYAnchor.constraint(equalTo: numberPatientsPresentedTreatmentLbl3.centerYAnchor).isActive = true
        numberPatientsPresentedTreatmentTextField6.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        numberPatientsPresentedTreatmentTextField6.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        numberPatientsAccpetedTreatmentLbl3.centerXAnchor.constraint(equalTo: numberPatientsPresentedTreatmentLbl3.centerXAnchor).isActive = true
        numberPatientsAccpetedTreatmentLbl3.topAnchor.constraint(equalTo: numberPatientsPresentedTreatmentLbl3.bottomAnchor, constant: 0.5).isActive = true
        numberPatientsAccpetedTreatmentLbl3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        numberPatientsAccpetedTreatmentLbl3.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        numberPatientsAccpetedTreatmentLbl3.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        numberPatientsAcceptedTreatmentTextField5.leftAnchor.constraint(equalTo: categoryDivider8.leftAnchor, constant: 0).isActive = true
        numberPatientsAcceptedTreatmentTextField5.centerYAnchor.constraint(equalTo: numberPatientsAccpetedTreatmentLbl3.centerYAnchor).isActive = true
        numberPatientsAcceptedTreatmentTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        numberPatientsAcceptedTreatmentTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        numberPatientsAcceptedTreatmentTextField6.leftAnchor.constraint(equalTo: numberPatientsAcceptedTreatmentTextField5.rightAnchor, constant: 0.5).isActive = true
        numberPatientsAcceptedTreatmentTextField6.centerYAnchor.constraint(equalTo: numberPatientsAccpetedTreatmentLbl3.centerYAnchor).isActive = true
        numberPatientsAcceptedTreatmentTextField6.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
        numberPatientsAcceptedTreatmentTextField6.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentPatientsAcceptedTreatmentLbl3.centerXAnchor.constraint(equalTo: numberPatientsAccpetedTreatmentLbl3.centerXAnchor).isActive = true
        percentPatientsAcceptedTreatmentLbl3.topAnchor.constraint(equalTo: numberPatientsAccpetedTreatmentLbl3.bottomAnchor, constant: 0.5).isActive = true
        percentPatientsAcceptedTreatmentLbl3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.395).isActive = true
        percentPatientsAcceptedTreatmentLbl3.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.075).isActive = true
        percentPatientsAcceptedTreatmentLbl3.font = UIFont(name: "AmericanTypewriter-Bold", size: self.view.frame.width * 0.022)
        
        percentPatientsAcceptedTreatmentTextField5.leftAnchor.constraint(equalTo: categoryDivider8.leftAnchor, constant: 0).isActive = true
        percentPatientsAcceptedTreatmentTextField5.centerYAnchor.constraint(equalTo: percentPatientsAcceptedTreatmentLbl3.centerYAnchor).isActive = true
        percentPatientsAcceptedTreatmentTextField5.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        percentPatientsAcceptedTreatmentTextField5.heightAnchor.constraint(equalTo: netProdutionLbl.heightAnchor, multiplier: 1).isActive = true
        
        percentPatientsAcceptedTreatmentTextField6.leftAnchor.constraint(equalTo: percentPatientsAcceptedTreatmentTextField5.rightAnchor, constant: 0.5).isActive = true
        percentPatientsAcceptedTreatmentTextField6.centerYAnchor.constraint(equalTo: percentPatientsAcceptedTreatmentLbl3.centerYAnchor).isActive = true
        percentPatientsAcceptedTreatmentTextField6.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.255).isActive = true
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
        
        percentAppointmentsKeptLbl.centerXAnchor.constraint(equalTo: dollarAmountSameDayTreatmentLbl.centerXAnchor).isActive = true
        percentAppointmentsKeptLbl.topAnchor.constraint(equalTo: dollarAmountSameDayTreatmentLbl.bottomAnchor, constant: 0.5).isActive = true
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
        
        percentAppointmentsKeptLbl2.centerXAnchor.constraint(equalTo: dollarAmountSameDayTreatmentLbl2.centerXAnchor).isActive = true
        percentAppointmentsKeptLbl2.topAnchor.constraint(equalTo: dollarAmountSameDayTreatmentLbl2.bottomAnchor, constant: 0.5).isActive = true
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
        
        percentAppointmentsKeptLbl3.centerXAnchor.constraint(equalTo: productionPerHourLbl3.centerXAnchor).isActive = true
        percentAppointmentsKeptLbl3.topAnchor.constraint(equalTo: productionPerHourLbl3.bottomAnchor, constant: 0.5).isActive = true
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
        
        fluoridePercentLbl.centerXAnchor.constraint(equalTo: perioPercentLbl.centerXAnchor).isActive = true
        fluoridePercentLbl.topAnchor.constraint(equalTo: perioPercentLbl.bottomAnchor, constant: 0.5).isActive = true
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
        
        oralIdPercentLbl.centerXAnchor.constraint(equalTo: fluoridePercentLbl.centerXAnchor).isActive = true
        oralIdPercentLbl.topAnchor.constraint(equalTo: fluoridePercentLbl.bottomAnchor, constant: 0.5).isActive = true
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
        
        arestinPercentLbl.centerXAnchor.constraint(equalTo: oralIdPercentLbl.centerXAnchor).isActive = true
        arestinPercentLbl.topAnchor.constraint(equalTo: oralIdPercentLbl.bottomAnchor, constant: 0.5).isActive = true
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
        
        reappointmentRateLbl.centerXAnchor.constraint(equalTo: arestinPercentLbl.centerXAnchor).isActive = true
        reappointmentRateLbl.topAnchor.constraint(equalTo: arestinPercentLbl.bottomAnchor, constant: 0.5).isActive = true
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
        categoryDivider16.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.9).isActive = true
        
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
        
        percentAppointmentsKeptLbl4.centerXAnchor.constraint(equalTo: productionPerHourLbl4.centerXAnchor).isActive = true
        percentAppointmentsKeptLbl4.topAnchor.constraint(equalTo: productionPerHourLbl4.bottomAnchor, constant: 0.5).isActive = true
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
        
        fluoridePercentLbl2.centerXAnchor.constraint(equalTo: perioPercentLbl2.centerXAnchor).isActive = true
        fluoridePercentLbl2.topAnchor.constraint(equalTo: perioPercentLbl2.bottomAnchor, constant: 0.5).isActive = true
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
        
        oralIdPercentLbl2.centerXAnchor.constraint(equalTo: fluoridePercentLbl2.centerXAnchor).isActive = true
        oralIdPercentLbl2.topAnchor.constraint(equalTo: fluoridePercentLbl2.bottomAnchor, constant: 0.5).isActive = true
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
        
        arestinPercentLbl2.centerXAnchor.constraint(equalTo: oralIdPercentLbl2.centerXAnchor).isActive = true
        arestinPercentLbl2.topAnchor.constraint(equalTo: oralIdPercentLbl2.bottomAnchor, constant: 0.5).isActive = true
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
        
        reappointmentRateLbl2.centerXAnchor.constraint(equalTo: arestinPercentLbl2.centerXAnchor).isActive = true
        reappointmentRateLbl2.topAnchor.constraint(equalTo: arestinPercentLbl2.bottomAnchor, constant: 0.5).isActive = true
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
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
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
        }
        kennesawProductionPerActiveChairRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerActiveChairTextField2.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        
        hollyAmountPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            self.amountPresentedTextField1.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        hollyAmountAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            self.amountAcceptedTextField1.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        hollyPercentOfDollarAmountScheduledRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentOfDollarAmountScheduledTextField1.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        hollyNumberOfPatientsPresentedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberPatientsPresentedTreatmentTextField1.placeholder = (snap.value as AnyObject).description
        }
        hollyNumberOfPatientsAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberPatientsAcceptedTreatmentTextField1.placeholder = (snap.value as AnyObject).description
        }
        hollyPercentOfPatientAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentPatientsAcceptedTreatmentTextField1.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        
        sydneyAmountPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            self.amountPresentedTextField2.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        sydneyAmountAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            self.amountAcceptedTextField2.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        sydneyPercentOfDollarAmountScheduledRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentOfDollarAmountScheduledTextField2.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        sydneyNumberOfPatientsPresentedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberPatientsPresentedTreatmentTextField2.placeholder = (snap.value as AnyObject).description
        }
        sydneyNumberOfPatientsAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberPatientsAcceptedTreatmentTextField2.placeholder = (snap.value as AnyObject).description
        }
        sydneyPercentOfPatientAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentPatientsAcceptedTreatmentTextField2.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        
        amandaAmountPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            self.amountPresentedTextField3.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        amandaAmountAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            self.amountAcceptedTextField3.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        amandaPercentOfDollarAmountScheduledRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentOfDollarAmountScheduledTextField3.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        amandaNumberOfPatientsPresentedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberPatientsPresentedTreatmentTextField3.placeholder = (snap.value as AnyObject).description
        }
        amandaNumberOfPatientsAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberPatientsAcceptedTreatmentTextField3.placeholder = (snap.value as AnyObject).description
        }
        amandaPercentOfPatientAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentPatientsAcceptedTreatmentTextField3.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        
        ashleyAmountPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            self.amountPresentedTextField4.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        ashleyAmountAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            self.amountAcceptedTextField4.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        ashleyPercentOfDollarAmountScheduledRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentOfDollarAmountScheduledTextField4.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        ashleyNumberOfPatientsPresentedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberPatientsPresentedTreatmentTextField4.placeholder = (snap.value as AnyObject).description
        }
        ashleyNumberOfPatientsAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberPatientsAcceptedTreatmentTextField4.placeholder = (snap.value as AnyObject).description
        }
        ashleyPercentOfPatientAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentPatientsAcceptedTreatmentTextField4.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        
        debbieAmountPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            self.amountPresentedTextField5.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        debbieAmountAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            self.amountAcceptedTextField5.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        debbiePercentOfDollarAmountScheduledRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentOfDollarAmountScheduledTextField5.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        debbieNumberOfPatientsPresentedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberPatientsPresentedTreatmentTextField5.placeholder = (snap.value as AnyObject).description
        }
        debbieNumberOfPatientsAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberPatientsAcceptedTreatmentTextField5.placeholder = (snap.value as AnyObject).description
        }
        debbiePercentOfPatientAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentPatientsAcceptedTreatmentTextField5.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        
        annaAmountPresentedRef.observe((.value)) { (snap: DataSnapshot) in
            self.amountPresentedTextField6.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        annaAmountAcceptedRef.observe((.value)) { (snap: DataSnapshot) in
            self.amountAcceptedTextField6.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        annaPercentOfDollarAmountScheduledRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentOfDollarAmountScheduledTextField6.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        annaNumberOfPatientsPresentedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberPatientsPresentedTreatmentTextField6.placeholder = (snap.value as AnyObject).description
        }
        annaNumberOfPatientsAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberPatientsAcceptedTreatmentTextField6.placeholder = (snap.value as AnyObject).description
        }
        annaPercentOfPatientAcceptedTreatmentRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentPatientsAcceptedTreatmentTextField6.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        
        drVGoalRef.observe((.value)) { (snap: DataSnapshot) in
            self.goalTextField1.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        drVNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            self.netProductionTextField3.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        drVDaysWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            self.daysWorkedTextField1.placeholder = (snap.value as AnyObject).description
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
        drVPercentAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentAppointmentsKeptTextField1.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        drVRetentionRateRef.observe((.value)) { (snap: DataSnapshot) in
            self.retentionRateTextField1.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        
        drMcreeGoalRef.observe((.value)) { (snap: DataSnapshot) in
            self.goalTextField2.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        drMcreeNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            self.netProductionTextField4.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        drMcreeDaysWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            self.daysWorkedTextField2.placeholder = (snap.value as AnyObject).description
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
        drMcreePercentAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentAppointmentsKeptTextField2.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        drMcreeRetentionRateRef.observe((.value)) { (snap: DataSnapshot) in
            self.retentionRateTextField2.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        
        drOrzaGoalRef.observe((.value)) { (snap: DataSnapshot) in
            self.goalTextField3.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        drOrzaNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            self.netProductionTextField5.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        drOrzaDaysWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            self.daysWorkedTextField3.placeholder = (snap.value as AnyObject).description
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
        drOrzaPercentAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentAppointmentsKeptTextField3.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        drOrzaRetentionRateRef.observe((.value)) { (snap: DataSnapshot) in
            self.retentionRateTextField3.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        
        drFranGoalRef.observe((.value)) { (snap: DataSnapshot) in
            self.goalTextField4.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        drFranNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            self.netProductionTextField6.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        drFranDaysWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            self.daysWorkedTextField4.placeholder = (snap.value as AnyObject).description
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
        drFranPercentAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentAppointmentsKeptTextField4.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        drFranRetentionRateRef.observe((.value)) { (snap: DataSnapshot) in
            self.retentionRateTextField4.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        
        amyGoalRef.observe((.value)) { (snap: DataSnapshot) in
            self.goalTextField5.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        amyNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            self.netProductionTextField7.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        amyDaysWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            self.daysWorkedTextField5.placeholder = (snap.value as AnyObject).description
        }
        amyProductionPerDayRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerDayTextField5.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        amyHoursWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberOfHoursWorkedTextField1.placeholder = (snap.value as AnyObject).description
        }
        amyProductionPerHourRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerHourTextField5.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        amyPercentAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentAppointmentsKeptTextField5.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        amyPerioPercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.perioPercentTextField1.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        amyFluoridePercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.fluoridePercentTextField1.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        amyOralIDPercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.oralIdPercentTextField1.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        amyArestinPercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.arestinPercentTextField1.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        amyReappointmentRateRef.observe((.value)) { (snap: DataSnapshot) in
            self.reappointmentRateTextField1.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        amyRetentionRateRef.observe((.value)) { (snap: DataSnapshot) in
            self.retentionRateTextField5.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        
        aubreyGoalRef.observe((.value)) { (snap: DataSnapshot) in
            self.goalTextField6.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        aubreyNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            self.netProductionTextField8.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        aubreyDaysWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            self.daysWorkedTextField6.placeholder = (snap.value as AnyObject).description
        }
        aubreyProductionPerDayRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerDayTextField6.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        aubreyHoursWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberOfHoursWorkedTextField2.placeholder = (snap.value as AnyObject).description
        }
        aubreyProductionPerHourRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerHourTextField6.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        aubreyPercentAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentAppointmentsKeptTextField6.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        aubreyPerioPercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.perioPercentTextField2.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        aubreyFluoridePercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.fluoridePercentTextField2.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        aubreyOralIDPercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.oralIdPercentTextField2.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        aubreyArestinPercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.arestinPercentTextField2.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        aubreyReappointmentRateRef.observe((.value)) { (snap: DataSnapshot) in
            self.reappointmentRateTextField2.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        aubreyRetentionRateRef.observe((.value)) { (snap: DataSnapshot) in
            self.retentionRateTextField6.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        
        dawnGoalRef.observe((.value)) { (snap: DataSnapshot) in
            self.goalTextField7.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        dawnNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            self.netProductionTextField9.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        dawnDaysWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            self.daysWorkedTextField7.placeholder = (snap.value as AnyObject).description
        }
        dawnProductionPerDayRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerDayTextField7.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        dawnHoursWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberOfHoursWorkedTextField3.placeholder = (snap.value as AnyObject).description
        }
        dawnProductionPerHourRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerHourTextField7.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        dawnPercentAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentAppointmentsKeptTextField7.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        dawnPerioPercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.perioPercentTextField3.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        dawnFluoridePercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.fluoridePercentTextField3.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        dawnOralIDPercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.oralIdPercentTextField3.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        dawnArestinPercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.arestinPercentTextField3.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        dawnReappointmentRateRef.observe((.value)) { (snap: DataSnapshot) in
            self.reappointmentRateTextField3.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        dawnRetentionRateRef.observe((.value)) { (snap: DataSnapshot) in
            self.retentionRateTextField7.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        
        sheilaGoalRef.observe((.value)) { (snap: DataSnapshot) in
            self.goalTextField8.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        sheilaNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            self.netProductionTextField10.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        sheilaDaysWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            self.daysWorkedTextField8.placeholder = (snap.value as AnyObject).description
        }
        sheilaProductionPerDayRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerDayTextField8.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        sheilaHoursWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberOfHoursWorkedTextField4.placeholder = (snap.value as AnyObject).description
        }
        sheilaProductionPerHourRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerHourTextField8.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        sheilaPercentAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentAppointmentsKeptTextField8.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        sheilaPerioPercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.perioPercentTextField4.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        sheilaFluoridePercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.fluoridePercentTextField4.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        sheilaOralIDPercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.oralIdPercentTextField4.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        sheilaArestinPercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.arestinPercentTextField4.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        sheilaReappointmentRateRef.observe((.value)) { (snap: DataSnapshot) in
            self.reappointmentRateTextField4.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        sheilaRetentionRateRef.observe((.value)) { (snap: DataSnapshot) in
            self.retentionRateTextField8.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        
        ashleyGoalRef.observe((.value)) { (snap: DataSnapshot) in
            self.goalTextField9.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        ashleyNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            self.netProductionTextField11.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        ashleyDaysWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            self.daysWorkedTextField9.placeholder = (snap.value as AnyObject).description
        }
        ashleyProductionPerDayRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerDayTextField9.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        ashleyHoursWorkedRef.observe((.value)) { (snap: DataSnapshot) in
            self.numberOfHoursWorkedTextField5.placeholder = (snap.value as AnyObject).description
        }
        ashleyProductionPerHourRef.observe((.value)) { (snap: DataSnapshot) in
            self.productionPerHourTextField9.placeholder = ("$" + (snap.value as AnyObject).description)
        }
        ashleyPercentAppointmentsKeptRef.observe((.value)) { (snap: DataSnapshot) in
            self.percentAppointmentsKeptTextField9.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        ashleyPerioPercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.perioPercentTextField5.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        ashleyFluoridePercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.fluoridePercentTextField5.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        ashleyOralIDPercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.oralIdPercentTextField5.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        ashleyArestinPercentRef.observe((.value)) { (snap: DataSnapshot) in
            self.arestinPercentTextField5.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        ashleyReappointmentRateRef.observe((.value)) { (snap: DataSnapshot) in
            self.reappointmentRateTextField5.placeholder = ("%" + (snap.value as AnyObject).description)
        }
        ashleyRetentionRateRef.observe((.value)) { (snap: DataSnapshot) in
            self.retentionRateTextField9.placeholder = ("%" + (snap.value as AnyObject).description)
        }
    } // end of view appear
    
    @objc func handleSubmition() {
        
        woodstockNetProductionRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.netProductionTextField1.text != "" {
                self.woodstockNetProductionRef.setValue(Int(snap.value as! Int) + Int(self.netProductionTextField1.text!)!)
                self.netProductionTextField1.text = ""
            }
        }
        woodstockCollectionsRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.collectionsTextField1.text != "" {
                self.woodstockCollectionsRef.setValue(Int(snap.value as! Int) + Int(self.collectionsTextField1.text!)!)
                self.collectionsTextField1.text = ""
            }
        }
        woodstockInsuranceCollectionsRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.insuranceCollectionsTextField1.text != "" {
                self.woodstockInsuranceCollectionsRef.setValue(Int(snap.value as! Int) + Int(self.insuranceCollectionsTextField1.text!)!)
                self.insuranceCollectionsTextField1.text = ""
            }
        }
        woodstockOTCollectionsRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.otcCollectionsTextField1.text != "" {
                self.woodstockOTCollectionsRef.setValue(Int(snap.value as! Int) + Int(self.otcCollectionsTextField1.text!)!)
                self.otcCollectionsTextField1.text = ""
            }
        }
        woodstockDollarAmountRefundedToInsuranceRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.amountRefundedToInsuranceTextField1.text != "" {
                self.woodstockDollarAmountRefundedToInsuranceRef.setValue(Int(snap.value as! Int) + Int(self.amountRefundedToInsuranceTextField1.text!)!)
                self.amountRefundedToInsuranceTextField1.text = ""
            }
        }
        woodstockDollarAmountRefundedToPatientsRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.amountRefundedToPatientsTextField1.text != "" {
                self.woodstockDollarAmountRefundedToPatientsRef.setValue(Int(snap.value as! Int) + Int(self.amountRefundedToPatientsTextField1.text!)!)
                self.amountRefundedToPatientsTextField1.text = ""
            }
        }
        woodstockPercentOTCToTotalCollectionsRef.observe((.value)) { (snap: DataSnapshot) in
            let percentage = Double(Double(self.sessionWoodstockOTCCollectionsValue / self.sessionWoodstockCollectionsValue) * 100)
            let roundedPercent = Double(round(10*percentage)/10)
            self.woodstockPercentOTCToTotalCollectionsRef.setValue(roundedPercent)
        }
        woodstockPercentInsuranceToTotalCollectionsRef.observe((.value)) { (snap: DataSnapshot) in
            let percentage = Double(Double(self.sessionWoodstockInsuranceCollectionsValue / self.sessionWoodstockCollectionsValue) * 100)
            let roundedPercent = Double(round(10*percentage)/10)
            self.woodstockPercentInsuranceToTotalCollectionsRef.setValue(roundedPercent)
        }
        woodstockPercentCollectionsToNetProductionRef.observe((.value)) { (snap: DataSnapshot) in
            let percentage = Double(Double(self.sessionWoodstockCollectionsValue / self.sessionWoodstockNetProductionsValue) * 100)
            let roundedPercent = Double(round(10*percentage)/10)
            self.woodstockPercentCollectionsToNetProductionRef.setValue(roundedPercent)
        }
        woodstockNetProductionRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            let value = Int(self.sessionWoodstockNetProductionsValue / 6)
            self.woodstockProductionPerActiveChairRef.setValue(value)
        }
        
        kennesawNetProductionRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.netProductionTextField2.text != "" {
                self.kennesawNetProductionRef.setValue(Int(snap.value as! Int) + Int(self.netProductionTextField2.text!)!)
                self.netProductionTextField2.text = ""
            }
        }
        kennesawCollectionsRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.collectionsTextField2.text != "" {
                self.kennesawCollectionsRef.setValue(Int(snap.value as! Int) + Int(self.collectionsTextField2.text!)!)
                self.collectionsTextField2.text = ""
            }
        }
        kennesawInsuranceCollectionsRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.insuranceCollectionsTextField2.text != "" {
                self.kennesawInsuranceCollectionsRef.setValue(Int(snap.value as! Int) + Int(self.insuranceCollectionsTextField2.text!)!)
                self.insuranceCollectionsTextField2.text = ""
            }
        }
        kennesawOTCollectionsRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.otcCollectionsTextField2.text != "" {
                self.kennesawOTCollectionsRef.setValue(Int(snap.value as! Int) + Int(self.otcCollectionsTextField2.text!)!)
                self.otcCollectionsTextField2.text = ""
            }
        }
        kennesawDollarAmountRefundedToInsuranceRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.amountRefundedToInsuranceTextField2.text != "" {
                self.kennesawDollarAmountRefundedToInsuranceRef.setValue(Int(snap.value as! Int) + Int(self.amountRefundedToInsuranceTextField2.text!)!)
                self.amountRefundedToInsuranceTextField2.text = ""
            }
        }
        kennesawDollarAmountRefundedToPatientsRef.observeSingleEvent(of: (.value)) { (snap: DataSnapshot) in
            if self.amountRefundedToPatientsTextField2.text != "" {
                // continue here!!
            }
        }
        
    } // end of handle submition
    
    @objc func handleLogOut() {
        self.signedIn = false
        UserDefaults.standard.set(false, forKey: "signedIn")
        UserDefaults.standard.synchronize()
        self.present(ViewController(), animated: true) {}
    }
    
    func roundToTens(_ x : Double) -> Int {
        return 10 * Int((x / 10.0).rounded())
    }
    
}

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
}
