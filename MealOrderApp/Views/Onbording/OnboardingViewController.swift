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
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            // Bu blok, currentPage değişkeninin değeri değiştiğinde çalışır
            // Eğer şu anki sayfa, toplam sayfa sayısının bir eksiği ise (son sayfadaysa)
            if currentPage == slides.count - 1 {
                // "Get started" yazısını nextBtn üzerine ayarla
                nextBtn.setTitle("Get started", for: .normal)
            } else {
                // Değilse, "Next" yazısını nextBtn üzerine ayarla
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        slides = [ OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from     different", image: .slide1),
                   OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best", image: .slide2),
                   OnboardingSlide(title: "İnstant Word-Wide Delivery", description: "Your orders will be delivered instantly irrespecticve of your location around the word", image: .slide3)]
        pageControl.numberOfPages = slides.count
        collectionView.delegate = self
        collectionView.dataSource = self
        


    }
    
    @IBAction func nextBtnCliced(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(identifier: "HomeNC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .crossDissolve
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1 // currentPage değişkenini bir artır. Bu, bir sonraki öğeye geçmek için kullanılır.
            let indexPath = IndexPath(item: currentPage, section: 0)// IndexPath nesnesi, collectionView içindeki bir öğeyi belirtir. Bu durumda, "currentPage" değeri      kullanılarak bir IndexPath oluşturuluyor.
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            // scrollToItem fonksiyonu, belirtilen IndexPath'e (yani belirli bir hücreye) kaydırma işlemi gerçekleştirir.
            // at: .centeredHorizontally, bu hedef hücreyi yatay eksende merkeze yerleştirir.
            // animated: true, kaydırma işleminin animasyonlu olmasını sağlar.
            
        }
        
        
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
        // UIScrollView'nin genişliğini temsil eden bir değer alınır.
        currentPage = Int(scrollView.contentOffset.x / width)
        // scrollView.contentOffset.x, UIScrollView'ın içindeki içeriğin x eksenindeki konumunu temsil eder.
        // width, UIScrollView'ın genişliğini temsil eder.
        // scrollView.contentOffset.x / width işlemi, mevcut konumun genişlik üzerinde kaç kez sığdığını belirler.
        // Int() fonksiyonu, sonucu bir tamsayıya dönüştürerek sayfa indeksini bulur.
        // Bu sayede, mevcut sayfa indeksi, UIScrollView'ın içeriğinin nerede olduğuna bağlı olarak güncellenir.
        
        
        
    }
    
}
