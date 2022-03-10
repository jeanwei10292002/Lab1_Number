//
//  NumberCollectionViewController.swift
//  NumberCollectionview
//
//  Created by jeanwei on 2022/3/10.
//

import UIKit

private let reuseIdentifier = "Cell"

class NumberCollectionViewController: UICollectionViewController {
    
    var colorch = [UIColor(red: 187/255, green: 110/255, blue: 124/255, alpha: 1),UIColor(red: 79/255, green: 127/255, blue: 178/255, alpha: 1),UIColor(red: 107/255, green: 171/255, blue: 81/255, alpha: 1)]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCellSize()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    func configureCellSize() {
        let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout
        let width = floor((collectionView.bounds.width - 3 * 2 - 50 * 2) / 6)
        flowLayout?.itemSize = CGSize(width: width, height: width)
        flowLayout?.estimatedItemSize = .zero
        flowLayout?.sectionInset = UIEdgeInsets(top: 50, left: 50, bottom: 0, right: 50)
        flowLayout?.collectionView?.backgroundColor = UIColor.black
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 49
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath) as! NumberCollectionViewCell
        if let textLabel = cell.contentView.subviews[0] as? UILabel{
            for i in 0...indexPath.row{
            textLabel.text = "\(String(format: "%02d", i + 1))"
            }
           }
        switch indexPath.row{
        case 0,1,6,7,11,12,17,18,22,23,28,29,33,34,39,44,45:
            cell.numberLabel.textColor = colorch[0]
            cell.backgroundColor = UIColor(red: 187/255, green: 110/255, blue: 124/255, alpha: 0.2)
        case 2,3,8,9,13,14,19,24,25,30,35,36,40,41,46,47:
            cell.numberLabel.textColor = colorch[1]
            cell.backgroundColor = UIColor(red: 79/255, green: 127/255, blue: 178/255, alpha: 0.2)
        default:
            cell.numberLabel.textColor = colorch[2]
            cell.backgroundColor = UIColor(red: 107/255, green: 171/255, blue: 81/255, alpha: 0.2)
        }
        
        
        // Configure the cell
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      let selectedCell = collectionView.cellForItem(at: indexPath) as! NumberCollectionViewCell
            switch indexPath.row{
            case 0,1,6,7,11,12,17,18,22,23,28,29,33,34,39,44,45:
                selectedCell.numberLabel.textColor = UIColor.white
                selectedCell.contentView.backgroundColor = UIColor(red: 228/255, green: 93/255, blue: 69/255, alpha: 1)
            case 2,3,8,9,13,14,19,24,25,30,35,36,40,41,46,47:
                selectedCell.numberLabel.textColor = UIColor.white
                selectedCell.contentView.backgroundColor = UIColor(red: 66/255, green: 152/255, blue: 247/255, alpha: 1)
            default:
                selectedCell.numberLabel.textColor = UIColor.white
                selectedCell.contentView.backgroundColor = UIColor(red: 95/255, green: 182/255, blue: 56/255, alpha: 1)
           }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
