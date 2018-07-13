//
//  ViewController.swift
//  TaggAR
//  Copyright © 2018 Ari Herman. All rights reserved.


import UIKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet weak var draw: UIButton!
    
    @IBOutlet weak var arView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.arView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.arView.showsStatistics = true
        self.arView.session.run(configuration)
        self.arView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func renderer(_ renderer: SCNSceneRenderer, willRenderScene scene: SCNScene, atTime time: TimeInterval) {
        guard let pointView = arView.pointOfView else {return}
        let transform = pointView.transform
        let cameraOrigin = SCNVector3(-transform.m31,-transform.m32,-transform.m33)
        let currentLocation = SCNVector3(transform.m41, transform.m42, transform.m43)
        let currentPositionOfCamera = cameraOrigin + currentLocation
        DispatchQueue.main.async {
            if self.draw.isHighlighted {
                let sphereNode = SCNNode(geometry: SCNSphere(radius: 0.02))
                sphereNode.position = currentPositionOfCamera
                self.arView.scene.rootNode.addChildNode(sphereNode)
                sphereNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red
                print("draw button is being pressed")
            } else {
//                let pointer = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.1/2))
                let pointer = SCNNode(geometry: SCNPlane(width: 0.1, height: 0.1))
                pointer.position = currentPositionOfCamera

                self.arView.scene.rootNode.enumerateChildNodes({ (node, _) in
                    if node.geometry is SCNPlane {
                        node.removeFromParentNode()
                    }
                })
                
                self.arView.scene.rootNode.addChildNode(pointer)
                pointer.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "Pointer")
            }
        }
    }
//        currentLocation is location translationally
//        cameraOrigin is the initial orientation of the camera


}

func +(left: SCNVector3, right: SCNVector3) -> SCNVector3 {
    return SCNVector3Make(left.x + right.x, left.y + right.y, left.z + right.z)
}

