//
//  ViewController.swift
//  Mobile Case Study
//
//  Created by Deniz Gülbahar on 2.09.2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    private var data = [Results]()
    private var filtereddata = [Results]()
    private var searching = false
    
    private var collectionView:UICollectionView?
    
    var service = Service()
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    private let searchBar:UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Find..."
        return searchBar
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        configureCollectionView()
        view.backgroundColor = .systemBackground
        fetchURL()
    }
    
   
    @IBAction func changeSegment(_ sender: UISegmentedControl) {
        searching = false
        searchBar.text = ""
        fetchURL()
    }
    private func configureCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1.5
        layout.minimumInteritemSpacing = 1.5
        layout.sectionInset = UIEdgeInsets(top: 0, left: 1.5, bottom: 0, right: 1.5)
        let size = (view.width - 4.5)/2
        layout.itemSize = CGSize(width: size, height: size*3/2)  
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
        view.addSubview(collectionView)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier:CollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    
     func fetchURL() {
         guard let url = service.newsURL(searchText: searchBar.text!, category: segmentedControl.selectedSegmentIndex, mediatype: segmentedControl.selectedSegmentIndex, type: segmentedControl.selectedSegmentIndex) else {
             return
         }
        
        URLSession.shared.dataTask(with: url) {  data,response,error in
                guard error == nil || data != nil else {
                    print("Error")
                    return
                }
                do {
                    let response = try JSONDecoder().decode(FeedResponse.self, from: data!)
                    
                    if let received = response.feed?.results {
                        self.data = received
                }
                DispatchQueue.main.async {
                    if let collectionView = self.collectionView {
                        collectionView.reloadData()
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        } .resume()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationController?.navigationBar.topItem?.titleView = searchBar
        segmentedControl.frame = CGRect(x: 30, y: view.safeAreaInsets.top, width: view.width-60, height: 40)
        collectionView?.frame = CGRect(x: 0, y: segmentedControl.bottom+10, width: view.width, height: view.height-segmentedControl.height-70)
    }
}

extension SearchViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searching {
            return filtereddata.count
        }
        else {
            return data.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if searching {
            let model = ResultsViewModel(model: filtereddata[indexPath.row])
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
            cell.configure(with: model)
            return cell
        } else {
            let model = ResultsViewModel(model: data[indexPath.row])
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
            cell.configure(with: model)
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        if searching {
        let model = ResultsViewModel(model: filtereddata[indexPath.row])
        let vc = DetailsViewController()
        vc.title = ""
        vc.model = model
        navigationItem.backButtonTitle = ""
        navigationController?.pushViewController(vc, animated: true)
            
        } else {
        let model = ResultsViewModel(model: data[indexPath.row])
        let vc = DetailsViewController()
        vc.model = model
        navigationItem.backButtonTitle = ""
        navigationController?.pushViewController(vc, animated: true)
         
        }
    }

}

extension SearchViewController:UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searching = true
        guard let collectionview = collectionView else {
            return
        }
        filtereddata = searchText.isEmpty ? data :  data.filter ({$0.name!.lowercased().contains(searchText.lowercased())})
        collectionview.reloadData()
    }
    
}
