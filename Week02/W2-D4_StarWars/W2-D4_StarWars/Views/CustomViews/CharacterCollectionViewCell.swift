//
// CharacterCollectionViewCell.swift
// W2-D4_StarWars
//


import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var characterImageView: UIImageView!
    
    // MARK: - Helper Functions
    
    func displayImage(for character: Character) {
        characterImageView.contentMode = .scaleAspectFill
        characterImageView.image = character.photo
    }
}
