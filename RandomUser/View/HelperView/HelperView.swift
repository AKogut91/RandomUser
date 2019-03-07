//
//  HelperView.swift
//  RandomUser
//
//  Created by AlexanderKogut on 3/7/19.
//  Copyright © 2019 AlexanderKogut. All rights reserved.
//

import UIKit

class HelperView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var retryButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("HelperView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.backgroundColor = .clear
        loadingLabel.text = Localization.Loading.loading
        loadingLabel.textColor = UIColor.errorLabelColor()
        activityIndicator.color = UIColor.errorLabelColor()
        retryButton.isHidden = true
        retryButton.setTitle(Localization.Errors.tapToRetry, for: .normal)
    }
    
    func showErrorlabel() {
        loadingLabel.text = Localization.Errors.failedToLoading
        loadingLabel.font = UIFont.systemFont(ofSize: 21)
    }
}
