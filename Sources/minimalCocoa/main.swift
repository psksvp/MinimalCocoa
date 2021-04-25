/**
 Minimal Cocoa ...
 
  by psksvp@gmail.com
 */

import Foundation
import AppKit
import Cocoa


class TestView: NSView
{
  override func draw(_ dirtyRect: NSRect)
  {
    NSBezierPath.stroke(NSMakeRect(10, 10, 100, 400))
    NSBezierPath.strokeLine(from: NSPoint(x:0, y:0),
                            to: NSPoint(x:self.frame.size.width, y:self.frame.size.height))
  }
}



class MainController: NSObject, NSApplicationDelegate
{
  var rootWindow: NSWindow? = nil
  
  func applicationDidFinishLaunching(_ notification: Notification)
  {
    rootWindow = NSWindow(contentRect: NSMakeRect(0, 0, 640, 480),
                          styleMask: [.titled, .closable, .resizable],
                          backing: .buffered,
                          defer: true)
    
    
    rootWindow?.orderFrontRegardless()
    rootWindow?.title = "rootVision"
    NSApplication.shared.activate(ignoringOtherApps: true)
    //rootWindow?.contentView?.wantsLayer = true
    rootWindow?.contentView = TestView();
  
  }
  
  func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool
  {
    print("exiting?")
    return true
  }
}


let a = NSApplication.shared
a.setActivationPolicy(.regular)
let mc = MainController()
a.delegate = mc
a.run()
