//
//  SpinnerView.swift
//  TwitterApp
//
//  Created by Tatiana Carvajal on 26/10/23.
//

import Foundation
import UIKit

class SpinnerView: UIView {
    

    @IBOutlet var loader: UIActivityIndicatorView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    
    private func loadView() {
        let contentView = self.loadFromNib()
        contentView.frame = self.bounds
        self.addSubview(contentView)
    }
    
    private func loadFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return nibView
    }
    
    func showAnimation() {
        loader.startAnimating()
        self.isHidden = false
    }
    
    func stopAnimation() {
        loader.stopAnimating()
        self.isHidden = true
    }
}
