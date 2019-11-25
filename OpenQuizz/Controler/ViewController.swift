//
//  ViewController.swift
//  OpenQuizz
//
//  Created by Yann Yver on 18/11/2019.
//  Copyright © 2019 Yann Yver. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionView: QuestionsView!
    
    var game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let name = Notification.Name(rawValue: "QuestionsLoaded")
        NotificationCenter.default.addObserver(self, selector: #selector(questionsLoaded), name: name, object: nil)
        
        startNewGame()
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(dragQuestionView(_:)))
        questionView.addGestureRecognizer(panGestureRecognizer)
    }
    
    func questionsLoaded() {
        activityIndicator.isHidden = true
        newGameButton.isHidden = false
        
        questionView.title = game.currentQuestion.title
    }

    @IBAction func didTapNewGameButton() {
        startNewGame()
    }
    
    private func startNewGame() {
        activityIndicator.isHidden = false
        newGameButton.isHidden = true
        
        questionView.title = "Loading..."
        questionView.style = .standard
        
        scoreLabel.text = "0 / 10"
        
        game.refresh()
    }
    
    func dragQuestionView(_ sender: UIPanGestureRecognizer) {
        if game.state == .ongoing {
        switch sender.state {
        case .began, .changed:
            transformeQuestionViewWith(gesture: sender)
            case .cancelled, .ended:
            answerQuestion()
        default:
            break
            }
        }
    }
    
    private func transformeQuestionViewWith(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: questionView)
        questionView.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
    }
    
    private func answerQuestion() {
        
    }
}

