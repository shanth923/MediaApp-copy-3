//
//  SeocndViewController.swift
//  MediaApp
//
//  Created by R Shantha Kumar on 11/28/19.
//  Copyright © 2019 R Shantha Kumar. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


class SeocndViewController: UIViewController {
    
    

    var posterView:UIImageView!
    var storyView:UITextView!
    var songLbl:UILabel!
    var audioSongs:AVPlayer = AVPlayer()
    var trailers:AVPlayerViewController!
    var allButton = [UIButton]()
    var allvideo = [UIButton]()
    
    var isButtonOn = [Bool]()
    
    var wholeData = [Movie]()
    
    @IBOutlet weak var stackView2: UIStackView!
    
    
//    GOING PREVIOUS SCREEN
    
   @IBAction func back(_ sender: UIButton)
   {
        
        dismiss(animated: true, completion: nil)
        
        
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
       data()
       
    }
    
   
    
    
    
    
 var allmovies = [UILabel()]
    
    
//DISPLAYING DATA IN VIEW
    
    
    func data(){
        
        
        SingletonFormsData.shared.movieName = [String]()
        
        
        stackView2.spacing = 30
        
      
        for v in 0...wholeData.count-1{
            var movieName:String!
            
            movieName = wholeData[v].title as! String
            SingletonFormsData.shared.movieName.append(movieName)
        }
    
        var movieName = UILabel()
        movieName.translatesAutoresizingMaskIntoConstraints = false
        movieName.heightAnchor.constraint(equalToConstant: 80).isActive = true
        movieName.textAlignment = .center
        movieName.text = SingletonFormsData.shared.movieName[SingletonFormsData.shared.selectedButton!] as! String
        stackView2.addArrangedSubview(movieName)
       
        
        
     
        posterView = UIImageView()
        posterView.translatesAutoresizingMaskIntoConstraints = false
        posterView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        posterView.image = SingletonFormsData.shared.images[SingletonFormsData.shared.selectedButton!]
        stackView2.addArrangedSubview(posterView)
        
        var story = UILabel()
        story.translatesAutoresizingMaskIntoConstraints = false
        story.heightAnchor.constraint(equalToConstant: 40).isActive = true
        story.text = "story"
        stackView2.addArrangedSubview(story)
        
        
        storyView = UITextView()
        storyView.text! = SingletonFormsData.shared.story[SingletonFormsData.shared.selectedButton!]
       storyView.translatesAutoresizingMaskIntoConstraints = false
        storyView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        storyView.backgroundColor = UIColor.clear
        storyView.isEditable = false
        stackView2.addArrangedSubview(storyView)
        
        var song = UILabel()
        song.translatesAutoresizingMaskIntoConstraints = false
        song.heightAnchor.constraint(equalToConstant: 40).isActive = true
        song.text = "songs"
        stackView2.addArrangedSubview(song)
        
        
       
//      let audioSongsd = try!AVAudioPlayer(contentsOf:URL(string:SingletonFormsData.shared.songss[SingletonFormsData.shared.selectedButton!] as?       String ?? "rtyrtyrtyr")!)
//       audioSongs = AVPlayer(url: URL())
        
        var number = 1
        
//        LOOPS FOR INVINDUAL SONGS
        
        for x in 0...wholeData[0].songs![SingletonFormsData.shared.selectedButton!].count-1
        {
        
            let button = UIButton()
            button.addTarget(self, action: #selector(playAndPause(button:)), for: UIControl.Event.touchUpInside)
            button.backgroundColor = .red
            button.tag = x
            button.setTitle("song\(number)", for: UIControl.State.normal)
            
            number += 1
            allButton.append(button)
    
            
            stackView2.addArrangedSubview(button)
            
        }
        
        var trailer = UILabel()
        trailer.translatesAutoresizingMaskIntoConstraints = false
        trailer.heightAnchor.constraint(equalToConstant: 40).isActive = true
        trailer.text = "trailer"
        stackView2.addArrangedSubview(trailer)
        
        let videoButton = UIButton()
        videoButton.addTarget(self, action: #selector(videoButton(button:)), for: UIControl.Event.touchUpInside)
        videoButton.heightAnchor.constraint(equalToConstant: 200).isActive = true
        videoButton.setBackgroundImage(SingletonFormsData.shared.images[SingletonFormsData.shared.selectedButton!],for: UIControl.State.normal)
        videoButton.backgroundColor = .blue
        videoButton.setTitle("play", for: UIControl.State.normal)
        
        stackView2.addArrangedSubview(videoButton)
        
        

    } 
    
//    EVENT FOR VIDEO BUTTON
    
    
    @objc func videoButton(button:UIButton){
        
        let video:AVPlayer!
        
        video = AVPlayer(url: URL(string: SingletonFormsData.shared.videoData[SingletonFormsData.shared.selectedButton!])!)
        
        let videoPlayer = AVPlayerViewController()

        videoPlayer.player = video
        
        video.play()
        
        present(videoPlayer, animated: true) {
            
        }

    }
    
    
    
    let vieplayer = AVPlayerViewController()
    
    
    
//    EVENT FOR AUDIO BUTTON
    @objc func playAndPause(button:UIButton)
        
    {
        var audio:AVPlayer!
        
        SingletonFormsData.shared.buttonTapped = button.tag
        
       let audiod =  SingletonFormsData.shared.songs[SingletonFormsData.shared.selectedButton!][button.tag]
        
        let data = AVPlayer(url: URL(string: audiod)!)
        
        
            
                vieplayer.player = data
        
                 data.play()
        
        

        
        
    }


}
