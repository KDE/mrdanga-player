/******************************************************************************
 * This file is part of the MrdangaPlayer project
 * Copyright (c) 2013 Laszlo Papp <lpapp@kde.org>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 */

import bb.cascades 1.0

Page {

    // Dock Container is the way to hold overlapping controls with
    // Cascades, at least for now. There is no 'z' index support establish
    // by Cascades QML either.

    Container {
        id: overlappingControlsContainer

        preferredWidth: 768.0
        preferredHeight: 1180.0

        layout: DockLayout {
        }

        verticalAlignment: VerticalAlignment.Top
        horizontalAlignment: HorizontalAlignment.Left

        ScrollView {
            id: gerritScrollView

            scrollViewProperties {
                pinchToZoomEnabled: true
                scrollMode: ScrollMode.Both
            }

            verticalAlignment: VerticalAlignment.Fill
            visible: false

            WebView {
                id: gerritWebView

                url: "https://codereview.qt-project.org/"
                visible: true

                settings.viewport: {
                    // "width" : "device-width"
                    // "height": "devide-height"
                    // defaultFontSize: searchModel.fontSize
                    "initial-scale" : 1.0
                }
                
                onLoadingChanged: {
                    if (loadRequest.status == WebLoadStatus.Started) {
                        activityIndicator.start();
                        gerritScrollView.visible = false
                    }
                    else if (loadRequest.status == WebLoadStatus.Succeeded) {
                        gerritScrollView.visible = true
                        activityIndicator.stop();
                    }
                    else if (loadRequest.status == WebLoadStatus.Failed) {
                        activityIndicator.stop();
                    }
                }
            }

            gestureHandlers: [
                DoubleTapHandler {
                    onDoubleTapped: {
                        gerritScrollView.resetViewableArea();
                    }
                }
            ]
        }


        // This is necessary to place the activity indicator horizontally
        // and vertically in the middle

        Container {
            id: activityIndicatorContainer

            layout: StackLayout {    
            }   

            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center

            ActivityIndicator {
                id: activityIndicator

                minWidth: 200.0
                minHeight: 200.0

                onStarted: {
                    activityIndicator.visible = true
                    gerritScrollView.visible = false
                }   

                onStopped: {
                    activityIndicatorContainer.visible = false
                    gerritScrollView.visible = true
                }   
            }   
        }   
    }
}
