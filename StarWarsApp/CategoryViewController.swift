//
//  CategoryViewController.swift
//  StarWarsApp
//
//  Created by Denys Roger on 24/02/21.
//

import UIKit
import Speech

class CategoryViewController: UICollectionViewController,  UITextFieldDelegate {
    
    var starWarsItens : Array<StarWarsElement>!

    var searchedItens : Array<StarWarsElement>! = []
    
    var selectedItem : StarWarsElement!
    
    var swList = StarWarsList()
    var api = APIManager()
    
    let voiceBttn = UIButton(type: .custom)
    
    let audioEngine = AVAudioEngine()
    let speechRecognizer = SFSpeechRecognizer()
    let request = SFSpeechAudioBufferRecognitionRequest()
    var task: SFSpeechRecognitionTask!
    var started: Bool = false
    
    
    @IBOutlet weak var searchBar: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        starWarsItens = swList.returnAllObjectsOfType(requestType: category)
        
        voiceBttn.setImage(UIImage(named: "IconMicrophone-2"), for: .normal)
        voiceBttn.addTarget(self, action: #selector(startStopRecognizer), for: .touchUpInside)
        
        let bgImageView = UIImageView(image: UIImage(named: "BackGround.png"))
        bgImageView.contentMode = .scaleAspectFit
        self.collectionView.backgroundView = bgImageView
        
        
        searchBar.delegate = self
        searchBar.layer.cornerRadius = searchBar.frame.size.height/2
        searchBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        searchBar.textColor = .white
        searchBar.leftView = UIImageView(image: UIImage(named: "IconSearch-2"))
        searchBar.rightView = voiceBttn
        searchBar.leftViewMode = .always
        searchBar.rightViewMode = .always
        searchBar.clipsToBounds = true
        
    }
    
//    MARK:- CollectionView
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if searchBar.text?.count == 0 {
            return starWarsItens.count
        }
        else{
            return searchedItens.count
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell {
            
            if searchBar.text?.count == 0 {
                itemCell.configure(with: starWarsItens[indexPath.row].name ?? "Null", itemImage: starWarsItens[indexPath.row].image)
                    
            }
            else{
                itemCell.configure(with: searchedItens[indexPath.row].name ?? "Null", itemImage: searchedItens[indexPath.row].image)
            }
            
            
            cell = itemCell
            cell.layer.cornerRadius = 25
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedItem = searchBar.text?.count == 0 ? starWarsItens[indexPath.row] : searchedItens[indexPath.row]
        
        performSegue(withIdentifier: "InfoViewCat", sender: self)
        
        if let index = lastOpenedItens.firstIndex(where: { (item) -> Bool in
            item.name == starWarsItens[indexPath.row].name
        }) {
            lastOpenedItens.remove(at: index)
        }
        
        lastOpenedItens.insert(starWarsItens[indexPath.row], at: 0)
    }
    
//    MARK:- Segue Itens
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is InfoViewController {
            let vc = segue.destination as? InfoViewController
            
            vc?.itemCategory = selectedItem.category
            vc?.itemID = selectedItem.apiID!
            vc?.selectedName = selectedItem.name ?? "Null"
            vc?.selectedImage = selectedItem.image
        }
    }
    
    
    // MARK:- UITextFieldDelegates
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        searchBar.leftView?.isHidden = true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if searchBar.text?.count != 0{
            self.searchedItens.removeAll()
            
            for item in starWarsItens{
                let range = item.name!.lowercased().range(of: searchBar.text!, options: .caseInsensitive, range: nil, locale: nil)
                if range != nil {
                    self.searchedItens.append(item)
                }
            }
        } else {
            self.searchedItens.removeAll()
        }
        
        self.collectionView.reloadData()
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        searchBar.resignFirstResponder()
        self.searchedItens.removeAll()
        for item in starWarsItens{
            searchedItens.append(item)
        }
        return true
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if searchBar.text?.count != 0{
//            self.searchedItens.removeAll()
//
//            for item in starWarsItens{
//                let range = item.name!.lowercased().range(of: searchBar.text!, options: .caseInsensitive, range: nil, locale: nil)
//                if range != nil {
//                    self.searchedItens.append(item)
//                }
//            }
//        } else {
//            self.searchedItens.removeAll()
//        }
//
//        self.collectionView.reloadData()
//        return true
//    }
    
//    MARK:- Request Permission for microphone usage
    
    func requestPermission(){
        self.voiceBttn.isEnabled = false
        SFSpeechRecognizer.requestAuthorization { (authState) in
            OperationQueue.main.addOperation {
                
                if authState == .authorized {
                  print(("Accepted!"))
                
                }else if authState == .denied {
                    self.alertView(message: "User denied usage.")
                
                }else if authState == .notDetermined {
                    self.alertView(message: "User phone doesn't support voice recognition.")
                
                }else if authState == .restricted {
                    self.alertView(message: "Usage of voice recognition is restricted on user phone.")
                }
            }
        }
    }
    
//    MARK:- Voice Recognizer
    
    @objc func startStopRecognizer(){
        started = !started
        
        if started{
            startVoiceRecognition()
        } else {
            stopVoiceRecognition()
        }
    }
    
     func startVoiceRecognition(){
        let node = audioEngine.inputNode
        let recordingFormat = node.outputFormat(forBus: 0)
        
        node.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) {
            (buffer, _) in
            self.request.append(buffer)
        }
        audioEngine.prepare()
        do{
            try audioEngine.start()
        } catch _{
            alertView(message: "Couldn't start audio engine.")
        }
        
        guard let myRecognition = SFSpeechRecognizer() else {
            self.alertView(message: "Voice recognition isn't allowed by your phone.")
            return
        }
        
        if !myRecognition.isAvailable{
            self.alertView(message: "Recognition is busy right now, please try again later.")
            
        }
        
        task = speechRecognizer?.recognitionTask(with: request, resultHandler: { (response, error) in
            guard let response = response else {
                if error != nil {
                    self.alertView(message: error!.localizedDescription)
                } else {
                    self.alertView(message: "Problem trying to give a response.")
                }
                return
            }
            
            let message = response.bestTranscription.formattedString
            self.searchBar.text = message
            
        })
        
    }
    
    func stopVoiceRecognition() {
        task.finish()
        task.cancel()
        task = nil
        
        request.endAudio()
        audioEngine.stop()
        audioEngine.inputNode.removeTap(onBus: 0)
    }
    
    
//    MARK:- Alert Function
    
    func alertView(message: String){
        let controller =  UIAlertController.init(title: "Error ocurred..!", message: message, preferredStyle: .alert)
        
        controller.addAction(UIAlertAction(title: "Ok", style: .default, handler: {
            (_) in
            controller.dismiss(animated: true, completion: nil)
        }))
        self.present(controller, animated: true, completion: nil)
    }
}
