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
                imageSource: "asset:///images/background.jpg"
            }
        ]

        ImageButton {
            id: bayanImageButton

            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center

            defaultImageSource: "asset:///images/bayan.png"
            pressedImageSource: "asset:///images/bayan-pressed.png"

            attachedObjects: [
                LayoutUpdateHandler {
                    id: bayanImageButtonLayoutUpdateHandler
                }
            ]

            onTouch: {
                if (event.isDown()) {
                    var localOriginX = bayanImageButtonLayoutUpdateHandler.layoutFrame.width/2
                    var localOriginY = bayanImageButtonLayoutUpdateHandler.layoutFrame.height/2

                    var innerCircleRadius = bayanImageButtonLayoutUpdateHandler.layoutFrame.width/4
                    var outerCircleRadius = bayanImageButtonLayoutUpdateHandler.layoutFrame.width/2

                    var localEventDistanceSquareFromOriginX = (event.localX - localOriginX) * (event.localX - localOriginX)
                    var localEventDistanceSquareFromOriginY = (event.localY - localOriginY) * (event.localY - localOriginY)

                    if (localEventDistanceSquareFromOriginX +
                        localEventDistanceSquareFromOriginY <= (innerCircleRadius * innerCircleRadius)) {
                        bayanMaidanMrdangaMediaPlayer.play()
                    } else if (localEventDistanceSquareFromOriginX +
                        localEventDistanceSquareFromOriginY <= (outerCircleRadius * outerCircleRadius)) {
                        bayanSyahiMrdangaMediaPlayer.play()
                    }
                }
            }
        }

        ImageButton {
           id: dayanMadianImageButton
                                     
           verticalAlignment: VerticalAlignment.Center
           horizontalAlignment: HorizontalAlignment.Center

           defaultImageSource: "asset:///images/dayan.png"
           pressedImageSource: "asset:///images/dayan-pressed.png"

           onTouch: {
              if (event.isDown()) {
                  dayanMaidanMrdangaMediaPlayer.play()
              }
           }
        }
    } 
}
