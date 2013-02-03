// Tabbed Pane project template
import bb.cascades 1.0
import bb.multimedia 1.0

Page {
    attachedObjects: [       
        MediaPlayer {
            id: bayanMaidanMrdangaMediaPlayer
            sourceUrl: "asset:///sounds/ki.ogg"
        },

        MediaPlayer {
            id: bayanSyahiMrdangaMediaPlayer
            sourceUrl: "asset:///sounds/ge.ogg"
        },

        MediaPlayer {
            id: dayanMaidanMrdangaMediaPlayer
            sourceUrl: "asset:///sounds/ta.ogg"
        },

        MediaPlayer {
            id: dayanSyahiMrdangaMediaPlayer
            // sourceUrl: "asset:///sounds/dayan-syahi.ogg"
        }
    ]        
                 
    onCreationCompleted: {
        OrientationSupport.supportedDisplayOrientation = SupportedDisplayOrientation.All;
    }

    Container {
        layout: StackLayout {
            orientation: LayoutOrientation.LeftToRight
        }

        background: back.imagePaint
        attachedObjects: [
            ImagePaintDefinition {
                id: back
                repeatPattern: RepeatPattern.XY
                imageSource: "asset:///images/background.png"
            }
        ]

        ImageButton {
            id: bayanMadianImageButton

            layoutProperties: AbsoluteLayoutProperties {
                positionX: 225
                positionY: 137
            }

            onTouch: {
                if (event.isDown()) {
                    bayanMaidanMrdangaMediaPlayer.play()
                }
            }

            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center

            defaultImageSource: "asset:///images/bayan.png"
            pressedImageSource: "asset:///images/bayan-pressed.png"
            disabledImageSource: ""

            overlapTouchPolicy: OverlapTouchPolicy.Allow
        }

        /* ImageButton {
            id: bayanSyahiImageButton
            
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 270
                positionY: 182
            }

            onTouch: {
                if (event.isDown()) {
                    bayanSyahiMrdangaMediaPlayer.play()
                }
            }

            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center

            defaultImageSource: ""
            pressedImageSource: "asset:///images/bayan-syahi.png"
            disabledImageSource: ""

            overlapTouchPolicy: OverlapTouchPolicy.Allow
        } */

        ImageButton {
           id: dayanMadianImageButton

           layoutProperties: AbsoluteLayoutProperties {
               positionX: 160
               positionY: 615
           }

           onTouch: {
              if (event.isDown()) {
                  dayanMaidanMrdangaMediaPlayer.play()
              }
           }
                                     
           verticalAlignment: VerticalAlignment.Center
           horizontalAlignment: HorizontalAlignment.Center

           defaultImageSource: "asset:///images/dayan.png"
           pressedImageSource: "asset:///images/dayan-pressed.png"
           disabledImageSource: ""

           overlapTouchPolicy: OverlapTouchPolicy.Allow
        }

        /* ImageButton {
            id: dayanSyahiImageButton
                                        
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center

            defaultImageSource: ""
            pressedImageSource: "asset:///images/dayan-syahi.png"
            disabledImageSource: ""

            overlapTouchPolicy: OverlapTouchPolicy.Allow

            onTouch: {
                if (event.isDown()) {
                    dayanSyahiMrdangaMediaPlayer.play()
                }
            }
        
        } */ 
    } 
}
