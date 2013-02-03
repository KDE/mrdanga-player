// Tabbed Pane project template
import bb.cascades 1.0
import bb.multimedia 1.0

Page {
    Container {
        layout: AbsoluteLayout {
        }

        background: "asset:///images/background.png"

        ImageButton {
            id: bayanMadianImageButton

            layoutProperties: AbsoluteLayoutProperties {
                positionX: 225
                positionY: 137
            }

            onClicked: {
                mrdangaMediaPlayer.setSourceUrl("asset:///sounds/ge.mp3")
                mrdangaMediaPlayer.play()
            }

            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center

            defaultImageSource: "asset:///images/bayan.png"
            pressedImageSource: "asset:///images/bayan-pressed.png"
            disabledImageSource: ""

            overlapTouchPolicy: OverlapTouchPolicy.Allow

            //    scalingMethod: ScalingMethod.AspectFit
        }

        /* ImageButton {
            id: bayanSyahiImageButton
            
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 270
                positionY: 182
            }

            onClicked: {
                mrdangaMediaPlayer.setSourceUrl("asset:///sounds/ki.mp3")
                mrdangaMediaPlayer.play()
            }

            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center

            defaultImageSource: ""
            pressedImageSource: "asset:///images/bayan-syahi.png"
            disabledImageSource: ""

            overlapTouchPolicy: OverlapTouchPolicy.Allow

            //    scalingMethod: ScalingMethod.AspectFit
        } */

        ImageButton {
           id: dayanMadianImageButton

           layoutProperties: AbsoluteLayoutProperties {
               positionX: 160
               positionY: 615
           }

           onClicked: {
              mrdangaMediaPlayer.setSourceUrl("asset:///sounds/ta.mp3")
              mrdangaMediaPlayer.play()
           }
                                     
           verticalAlignment: VerticalAlignment.Center
           horizontalAlignment: HorizontalAlignment.Center

           defaultImageSource: "asset:///images/dayan.png"
           pressedImageSource: "asset:///images/dayan-pressed.png"
           disabledImageSource: ""

           overlapTouchPolicy: OverlapTouchPolicy.Allow

           //    scalingMethod: ScalingMethod.AspectFit
        }

        /* ImageButton {
            id: dayanSyahiImageButton
                                        
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center

            defaultImageSource: ""
            pressedImageSource: "asset:///images/dayan-syahi.png"
            disabledImageSource: ""

            overlapTouchPolicy: OverlapTouchPolicy.Allow

            //    scalingMethod: ScalingMethod.AspectFit
            //
            onClicked: {
                mrdangaMediaPlayer.setSourceUrl("asset:///sounds/dayan-syahi.wav")
                mrdangaMediaPlayer.play()
            }
        
        } */ 
    } 

    attachedObjects: [       
        SystemSound {
            id: systemSound
        },

        MediaPlayer {
            id: mrdangaMediaPlayer
        }
    ]        
                 
    onCreationCompleted: {
        OrientationSupport.supportedDisplayOrientation = SupportedDisplayOrientation.All;
    }
}
