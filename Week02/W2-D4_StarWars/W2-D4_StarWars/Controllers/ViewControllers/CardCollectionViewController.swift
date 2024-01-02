//
// CardCollectionViewController.swift
// W2-D4_StarWars
//


import UIKit

private let reuseIdentifier = "characterCell"

class CardCollectionViewController: UICollectionViewController {

    // MARK: - Properties
    
    private var displayedCharacters: [Character] = []
    private var targetCharacter: Character?
    private var selectedFaction = "jedi"
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        shuffleCharacters(for: selectedFaction)
    }

    // MARK: - Helper Functions
    
    func shuffleCharacters(for faction: String) {
        if faction == "sith" {
            let sithGroup = CharacterController.sith.prefix(3)
            targetCharacter = CharacterController.jedi.randomElement()
            displayedCharacters = Array(sithGroup)
        
        } else if faction == "jedi" {
            let jediGroup = CharacterController.jedi.prefix(3)
            targetCharacter = CharacterController.sith.randomElement()
            displayedCharacters = Array(jediGroup)
        }
        updateViews()
    }
    
    func presentAlert(for character: Character) {
        let success = character == targetCharacter
        let alertController = UIAlertController(title: success ? "Good Job!" : "Better Luck next time", message: nil, preferredStyle: .alert)
        let doneAction = UIAlertAction(title: "Done", style: .cancel)
        let shuffleAction = UIAlertAction(title: "Shuffle", style: .default) { _ in
            self.shuffleCharacters(for: self.selectedFaction)
        }
        
        alertController.addAction(doneAction)
        if success {
            alertController.addAction(shuffleAction)
        }
        present(alertController, animated: true)
    }
    
    private func updateViews() {
        guard let target = targetCharacter else { return }
        displayedCharacters.append(target)
        displayedCharacters.shuffle()
        
        title = "Find \(target.name)"
        collectionView.reloadData()
    }
    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayedCharacters.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CharacterCollectionViewCell else { return UICollectionViewCell() }
        let character = displayedCharacters[indexPath.row]
        
        cell.displayImage(for: character)
        return cell
    }
   
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCharacter = displayedCharacters[indexPath.row]
        presentAlert(for: selectedCharacter)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "filterVC" {
            let viewController = segue.destination as? FilterViewController
            viewController?.delegate = self
        }
    }
}

// MARK: - Extension UICollectionView Delegate FlowLayout

extension CardCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 2
        return CGSize(width: width - 15, height: width + 30)
    }
}

// MARK: - Extension FilterSelection Delegate

extension CardCollectionViewController: FilterSelectionDelegate {
    func selected(faction: String) {
        selectedFaction = faction
        shuffleCharacters(for: faction)
    }
}
