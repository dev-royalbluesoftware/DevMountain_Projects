//
// MemberCollectionViewCell.swift
// ProAthleteFinder
//


import UIKit

class MemberCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var memberImageView: UIImageView!
    
    // MARK: - Properties
    
    var member: Member? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Helper Functions
    
    func updateViews() {
        guard let member = member else { return }
        memberImageView.contentMode = .scaleAspectFill
        memberImageView.image = member.photo
    }
}
