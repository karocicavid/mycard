//
//  ViewController.swift
//  WarCardGame
//
//  Created by student on 17.11.2020.
//

import UIKit

class ViewController: UIViewController {
    var playerscore = 0
    var cpuscore  = 0
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var CPUCard: UIImageView!
    @IBOutlet weak var action_button: UIButton!
    @IBOutlet weak var PlayerCard: UIImageView!
    @IBOutlet weak var CPUScore: UILabel!
    @IBOutlet weak var PlayerScore: UILabel!
    
    @IBOutlet weak var RedKey: UIButton!
    @IBOutlet weak var GreenKey: UIButton!

 
    @IBAction func Greenaction(_ sender: UIButton) {
        message.text = "New Game!"
        playerscore = 0
        cpuscore = 0
        CPUScore.text = ""
        PlayerScore.text = ""
        PlayerCard.image = UIImage (imageLiteralResourceName: "back")
        CPUCard.image = UIImage (imageLiteralResourceName: "back")
        GreenKey.isHidden = true;
        GreenKey.isEnabled = false;
        RedKey.isHidden = true;
        RedKey.isEnabled=false;
    }
    
    @IBAction func Redaction(_ sender: UIButton) {
        exit(0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GreenKey.isHidden = true;
        GreenKey.isEnabled = false;
        RedKey.isHidden = true;
        RedKey.isEnabled=false;
        // Do any additional setup after loading the view.
    }
    
    //generate values 2-14
    func generateValue()->Int{
        return Int.random(in: 2...14)    }
    
    //function action for Deal button
    @IBAction func DealFunc(_ sender: UIButton) {

        var playernumber=generateValue()
        var cpunumber=generateValue()
        if playerscore != 20 && cpuscore != 20{
        PlayerCard.image = UIImage (imageLiteralResourceName: "card\(playernumber)")
            CPUCard.image = UIImage (imageLiteralResourceName: "card\(cpunumber)")
            if playernumber>cpunumber {
                playerscore += 1
                message.text = "You Win round"
                PlayerScore.text = String(playerscore)
                CPUScore.text = String(cpuscore)
            }
            else if playernumber<cpunumber{
                cpuscore += 1
                message.text = "You Lost round"
                PlayerScore.text = String(playerscore)
                CPUScore.text = String(cpuscore)
            }
            else {
                message.text = "Draw"
                PlayerScore.text = String(playerscore)
                CPUScore.text = String(cpuscore)
            }
        }
        else if playerscore == 20 || cpuscore == 20 {
                GreenKey.isHidden = false;
                GreenKey.isEnabled = true;
                RedKey.isHidden = false;
                RedKey.isEnabled = true;
            if playerscore>cpuscore{
                message.text = "Player wins.New game - GREEN, exit -RED"
            }
            else if cpuscore>playerscore{
                message.text = "Player lost.New game - GREEN, exit -RED"
            }
        }

    }
    
    
}

