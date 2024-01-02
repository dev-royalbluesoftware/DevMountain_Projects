//
// PhotoCollectionViewController.swift
// ProAthleteFinder
//


import UIKit

class PhotoCollectionViewController: UICollectionViewController {

    // MARK: - Properties
    var displayedMembers: [Member] = []
    var targetedMember: Member?
    var selectedClan = "family"
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    // MARK: - Helper Functions
    
    func shuffleMembers(clan: String) {
        if clan == "family" {
            let shuffledFamilyGroup = MemberController.family.shuffled()
            let familyGroup = shuffledFamilyGroup.prefix(3)
            
            displayedMembers = Array(familyGroup)
            targetedMember = MemberController.nonFamily.randomElement()
            
        } else {
            let shuffledNonFamilyGroup = MemberController.nonFamily.shuffled()
            let nonFamilyGroup = shuffledNonFamilyGroup.prefix(3)
            
            displayedMembers = Array(nonFamilyGroup)
            targetedMember = MemberController.family.randomElement()
        }
        updateViews()
    }
    
    func updateViews() {
        guard let member = targetedMember else { return }
        
        displayedMembers.append(member)
        displayedMembers.shuffle()
        
        self.title = "Find \(member.name)"
        collectionView.reloadData()
    }
    
    func presentAlert(member: Member) {
        let success = member == targetedMember
        let alertController = UIAlertController(title: success ? "Impressive, you really know your Buells" : "Better Luck next time.  You should take time to meet the Buells", message: nil, preferredStyle: .alert)
        
        let doneAction = UIAlertAction(title: "Done", style: .cancel)
        let shuffleAction = UIAlertAction(title: "Shuffle", style: .default) {
            _ in self.shuffleMembers(clan: self.selectedClan)
        }
        
        alertController.addAction(doneAction)
        if success {
            alertController.addAction(shuffleAction)
        }
        
        present(alertController, animated: true)
    }
    
  
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toClanSelectorVC" {
            guard let destination = segue.destination as? ClanSelectorViewController else { return }
            destination.delegate = self
        }
    }
  

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayedMembers.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "memberCell", for: indexPath) as? MemberCollectionViewCell else { return UICollectionViewCell() }
        let member = displayedMembers[indexPath.row]
        
        cell.member = member
        
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let member = displayedMembers[indexPath.row]
        presentAlert(member: member)
    }
}

// MARK: - Extension UICollectionView Delegate FlowLayout

extension PhotoCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 2
        
        return CGSize(width: width - 20, height: width + 30)
    }
}

// MARK: - Extension ClanSelector Delegate

extension PhotoCollectionViewController: ClanSelectorDelegate {
    func clanWasSelected(clan: String) {
        selectedClan = clan
        shuffleMembers(clan: clan)
    }
}
