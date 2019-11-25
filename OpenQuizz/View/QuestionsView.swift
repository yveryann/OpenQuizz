//
//  QuestionsView.swift
//  OpenQuizz
//
//  Created by Yann Yver on 25/11/2019.
//  Copyright © 2019 Yann Yver. All rights reserved.
//

import UIKit

class QuestionsView: UIView {

    @IBOutlet private var label: UILabel!
    @IBOutlet private var icon: UIImageView!
    
    enum Style {
        case correct, incorrect, standard
    }
    
    var style: Style = .standard {
        didSet {
            setStyle(style)
        }
    }
    
    private func setStyle(_ style: Style) {
        switch style {
        case .correct:
            backgroundColor = UIColor(displayP3Red: 200/255.0, green: 236/255.0, blue: 160/255.0, alpha: 1)
            icon.image = UIImage(named: "Icon Correct")
            icon.isHidden = false
        case .incorrect:
            backgroundColor = #colorLiteral(red: 0.9524384141, green: 0.5314579606, blue: 0.5782763362, alpha: 1)
            icon.image = UIImage(named: "Icon Error")
            icon.isHidden = false
        case .standard :
            backgroundColor = #colorLiteral(red: 0.7496888041, green: 0.7689389586, blue: 0.7860597372, alpha: 1)
            icon.image = UIImage(named: "Icon Standard")
            icon.isHidden = true
        }
    }
    
    var title = "" {
        didSet {
            label.text = title
        }
    }
}
