//
//  ViewController.swift
//  TaggAR
//  Copyright © 2018 Ari Herman. All rights reserved.


import UIKit
import ARKit
import MapKit
import SceneKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet weak var draw: UIButton!
    @IBOutlet weak var arView: ARSCNView!
    @IBOutlet weak var hiddenButton: UIButton!
    
    @IBOutlet weak var redColor: UIButton!
    @IBOutlet weak var whiteColor: UIButton!
    @IBOutlet weak var purpleColor: UIButton!
    @IBOutlet weak var yellowColor: UIButton!
    @IBOutlet weak var blackColor: UIButton!
    @IBOutlet weak var greenColor: UIButton!
    @IBOutlet weak var blueColor: UIButton!
    @IBOutlet weak var more: UIButton!
    
    var redButtonLocation : CGPoint!
    var whiteButtonLocation : CGPoint!
    var purpleButtonLocation : CGPoint!
    var yellowButtonLocation : CGPoint!
    var blackButtonLocation : CGPoint!
    var greenButtonLocation : CGPoint!
    var blueButtonLocation : CGPoint!
    
    
    
    // IBOutlet-reference to storyboard/ IBAction- reference to an action
    
    let configuration = ARWorldTrackingConfiguration()
    var colorPicker = UIColor.black
    var showResetButton = false
    var canvasNode = SCNNode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.arView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.arView.session.run(configuration)
        self.arView.delegate = self
        self.arView.isUserInteractionEnabled = true
        arView.scene.rootNode.addChildNode(canvasNode)
        
        
        redButtonLocation = redColor.center
        whiteButtonLocation = whiteColor.center
        purpleButtonLocation = purpleColor.center
        yellowButtonLocation = yellowColor.center
        blackButtonLocation = blackColor.center
        greenButtonLocation = greenColor.center
        blueButtonLocation = blueColor.center
        
        
        redColor.center = more.center
        whiteColor.center = more.center
        purpleColor.center = more.center
        blackColor.center = more.center
        yellowColor.center = more.center
        greenColor.center = more.center
        blueColor.center = more.center
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    func renderer(_ renderer: SCNSceneRenderer, willRenderScene scene: SCNScene, atTime time: TimeInterval) {
        guard let cameraPoint = arView.pointOfView else {return}
        let transform = cameraPoint.transform
        let cameraOrigin = SCNVector3(-transform.m31,-transform.m32,-transform.m33)
        let translation = SCNVector3(transform.m41, transform.m42, transform.m43)
        let cameraRelativePosition = cameraOrigin + translation
       
        DispatchQueue.main.async {
            
            if self.draw.isHighlighted {
                let sphereNode = SCNNode(geometry: SCNSphere(radius: 0.02))
                sphereNode.position = cameraRelativePosition
                sphereNode.geometry?.firstMaterial?.diffuse.contents = self.colorPicker
               
                if self.showResetButton == false {
                    self.buttonIsVisible()
                }
                
                self.canvasNode.addChildNode(sphereNode)
//                self.arView.scene.rootNode.addChildNode(sphereNode)
            }
        }
    }
    
    func toggleButton(button: UIButton, onImage: UIImage, offImage: UIImage) {
        if button.currentImage == offImage {
            button.setImage(onImage, for: .normal)
        } else {
            button.setImage(offImage, for: .normal)
        }
    }
    
    @IBAction func moreClicked(_ sender: UIButton) {
        if more.currentImage == #imageLiteral(resourceName: "more_off") {
            UIView.animate(withDuration: 0.3, animations: {
                
                self.redColor.alpha = 1
                self.whiteColor.alpha = 1
                self.purpleColor.alpha = 1
                self.blackColor.alpha = 1
                self.yellowColor.alpha = 1
                self.greenColor.alpha = 1
                self.blueColor.alpha = 1
                
                self.redColor.center = self.redButtonLocation
                self.whiteColor.center = self.whiteButtonLocation
                self.purpleColor.center = self.purpleButtonLocation
                self.blackColor.center = self.blackButtonLocation
                self.yellowColor.center = self.yellowButtonLocation
                self.greenColor.center = self.greenButtonLocation
                self.blueColor.center = self.blueButtonLocation
            })
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                self.redColor.alpha = 0
                self.whiteColor.alpha = 0
                self.purpleColor.alpha = 0
                self.blackColor.alpha = 0
                self.yellowColor.alpha = 0
                self.greenColor.alpha = 0
                self.blueColor.alpha = 0
                
                self.redColor.center = self.more.center
                self.whiteColor.center = self.more.center
                self.purpleColor.center = self.more.center
                self.blackColor.center = self.more.center
                self.yellowColor.center = self.more.center
                self.greenColor.center = self.more.center
                self.blueColor.center = self.more.center
            })
            
        }
        toggleButton(button: sender, onImage: #imageLiteral(resourceName: "more_on"), offImage: #imageLiteral(resourceName: "more_off"))
    }
    
    func buttonIsVisible() {
        self.showResetButton = true
        hiddenButton.isHidden = false
    }
    
    
    @IBAction func reset(_ sender: Any) {
        self.canvasNode.enumerateChildNodes { (node, _) in
           node.removeFromParentNode()
        }
        hiddenButton.isHidden = true
        self.showResetButton = false
    }
    
    
    @IBAction func red(_ sender: Any) {
        self.colorPicker = UIColor.red
    }
    
    @IBAction func blue(_ sender: Any) {
        self.colorPicker = UIColor.blue
    }
    
    @IBAction func black(_ sender: Any) {
        self.colorPicker = UIColor.black
    }
    
    @IBAction func green(_ sender: Any) {
        self.colorPicker = UIColor.green
    }
    
    @IBAction func white(_ sender: Any) {
        self.colorPicker = UIColor.white
    }
    
    @IBAction func purple(_ sender: Any) {
        self.colorPicker = UIColor.purple
    }
    
    @IBAction func yellow(_ sender: Any) {
        self.colorPicker = UIColor.yellow
    }
    
}

func +(left: SCNVector3, right: SCNVector3) -> SCNVector3 {
    return SCNVector3Make(left.x + right.x, left.y + right.y, left.z + right.z)
}

//        translation is location translationally
//        cameraOrigin is the initial orientation of the camera

