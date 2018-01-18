//
//  ErrorViewController.swift
//  FastMovie
//
//  Created by Lázaro Lima dos Santos on 18/01/18.
//  Copyright © 2018 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

class ErrorViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    private var message: String = ""
    var completion: (() -> Void)?
    
    init(message: String, completion:@escaping () -> Void) {
        super.init(nibName: "ErrorViewController", bundle: nil)
        self.modalPresentationStyle = .overFullScreen
        self.completion = completion
        self.message = message
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    func configureView() {
        self.messageLabel.text = message
    }
    
    @IBAction func tryAgainAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        completion!()
    }
    
}
