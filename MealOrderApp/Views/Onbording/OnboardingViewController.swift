//
//  OnbordingViewController.swift
//  MealOrderApp
//
//  Created by Fatih on 25.12.2023.
//

import UIKit

class OnbordingViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [OnboardingSlide] = []
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = [ OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different", image: .slide1),
                   OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best", image: .slide2),
                   OnboardingSlide(title: "İnstant Word-Wide Delivery", description: "Your orders will be delivered instantly irrespecticve of your location around the word", image: .slide3)]
        collectionView.delegate = self
        collectionView.dataSource = self
        


    }
    
    @IBAction func nextBtnCliced(_ sender: UIButton) {
    }
    

}

extension OnbordingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }
    
}
