//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Sowmya Reddy Atla on 7/30/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var tweetContent: UILabel!
    
    @IBOutlet weak var FavoriteButton: UIButton!
    @IBOutlet weak var RetweetButton: UIButton!
    
    
    var favorited:Bool = false
    var tweetId: Int = -1
    //var retweeted: Bool = false
    
    
    
    @IBAction func FavoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if(toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { Error in
                print("Favorite did not succeed \(Error)")
            })
        }
        else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { Error in
                 print("unfavorite did not succeed \(Error) ")
            })
        }
        
    }
    
    
    @IBAction func retweet(_ sender: Any) {
        
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { Error in
            print("Error in retweeting \(Error)")
        })
        
    }
    
    
    func setRetweeted(_ isRetweeted:Bool){
        if(isRetweeted){
            RetweetButton.setImage(UIImage(named:"retweet-icon-green"), for: UIControl.State.normal)
            RetweetButton.isEnabled = false
        }else{
            RetweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            RetweetButton.isEnabled = true
        }
    }
    
    
    func setFavorite(_ isFavorited:Bool){
        
        favorited = isFavorited
        if(favorited){
            FavoriteButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        
        else{
            FavoriteButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
