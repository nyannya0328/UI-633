//
//  ResizebleLottieView.swift
//  UI-633
//
//  Created by nyannyan0328 on 2022/08/06.
//

import SwiftUI
import Lottie

struct ResizebleLottieView: UIViewRepresentable {
    var lottieView : AnimationView
    var color : SwiftUI.Color = .black
    func makeUIView(context: Context) -> UIView {
        
        let view = UIView()
        view.backgroundColor = .clear
        
        setUp(to: view)
        return view
        
    }
    func updateUIView(_ uiView: UIView, context: Context) {
        
        if let animationView = uiView.subviews.first(where: { view in
            view is AnimationView
        }) as? AnimationView{
            
           // animationView.logHierarchyKeypaths()
            
            let lottieColor = ColorValueProvider(UIColor(color).lottieColorValue)
            let fileKeyPath = AnimationKeypath(keys: ["**","Fill 1","**","Color"])
            animationView.setValueProvider(lottieColor, keypath: fileKeyPath)
            
        
            let strokeKeyPath = AnimationKeypath(keys: ["**","Stroke 1","**","Color"])
            animationView.setValueProvider(lottieColor, keypath: fileKeyPath)
           
    
            
            
            
        }
        
    }
    func setUp(to : UIView){
        
        lottieView.backgroundBehavior = .forceFinish
        lottieView.shouldRasterizeWhenIdle = true
        lottieView.backgroundColor = .clear
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        
        let contains = [
        
        
            lottieView.widthAnchor.constraint(equalTo: to.widthAnchor),
            lottieView.heightAnchor.constraint(equalTo: to.heightAnchor)
        
        
        ]
        
        to.addSubview(lottieView)
        to.addConstraints(contains)
        
    }
}

