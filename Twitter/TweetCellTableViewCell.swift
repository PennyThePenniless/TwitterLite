//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Paola Jose Lora on 9/27/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

   
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var Username: UILabel!
    
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    
    var favorited:Bool = false
    var retweeted:Bool = false
    var tweetID:Int = -1
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if(toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetID, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("Favotite did not succeed: \(error)")
            })
        }
        else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetID, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("Unfavotite did not succeed: \(error)")
            })
        }
    }
    
    @IBAction func retweetTweet(_ sender: Any) {
        let toBeRetweeted = !retweeted
        if(toBeRetweeted) {
            TwitterAPICaller.client?.retweetTweet(tweetId: tweetID, success: {
                self.setRetweet(true)
            }, failure: { (error) in
                print("Retweet did not succeed: \(error)")
            })
        }
        else {
            TwitterAPICaller.client?.unRetweetTweet(tweetId: tweetID, success: {
                self.setRetweet(false)
            }, failure: { (error) in
                print("Unretweet did not succeed: \(error)")
            })
        }
    }
    
    func setRetweet(_ isRetweeted:Bool) {
        retweeted = isRetweeted
        if(retweeted) {
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
        }
        else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
        }
    }
    
    func setFavorite(_ isFavorited:Bool) {
        favorited = isFavorited
        if(favorited) {
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else {
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
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
