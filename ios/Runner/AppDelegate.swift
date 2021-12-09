import UIKit
import Flutter


class Dog: Codable {
    let name: String
    let age: Int
    let race: String
    
    init(name: String, age: Int, race: String) {
        self.name = name
        self.age = age
        self.race = race
    }
}

class Cat: Codable {
    let name: String
    let age: Int
    let color: String
    
    init(name: String, age: Int, color: String) {
        self.name = name
        self.age = age
        self.color = color
    }
    
    func toJson() -> String? {
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(self)
            return String(data: jsonData, encoding: String.Encoding.utf8)
        } catch {
            print("Converting Cat to JSON failed")
            return nil
        }
    }
}

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    private func showAlert(name: String) {
        let alert = UIAlertController(title: "Dog name", message: name, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      let methodChannelName = "METHOD_CHANNEL_TEST"
      let methodChannel = FlutterMethodChannel(name: methodChannelName,
                                                binaryMessenger: controller.binaryMessenger)
      let eventChannelName = "EVENT_CHANNEL_TEST"
      let eventChannel = FlutterEventChannel(name: eventChannelName, binaryMessenger: controller.binaryMessenger)
      
      // *********** METHOD CHANNEL IMPLEMENTATION
      
      methodChannel.setMethodCallHandler({
        (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          switch(call.method) {
          case "showNativeAlert":
              guard let dogName = call.arguments as? String else {
                  print("Method Channel: Wrong argument type while parsing arguments on the native iOS side")
                  result(nil)
                  break
              }
              self.showAlert(name: dogName)
              break
              
          case "transformDogIntoCat":
              guard let dogDictionary = call.arguments as? [String: Any] else {
                  print("Method Channel: Error while parsing arguments on the native iOS side")
                  result(nil)
                  break
              }
              do {
                  let dog = try JSONDecoder().decode(Dog.self, from: JSONSerialization.data(withJSONObject: dogDictionary))
                  let cat = Cat(name: dog.name, age: dog.age, color: "White")
                  result(cat.toJson())
              } catch {
                  print("Method Channel: Wrong argument type while parsing arguments on the native iOS side")
                  result(nil)
              }
              break
              
          default:
              print("Method Channel: Method \(call.method) is not supported")
              result(FlutterMethodNotImplemented)
          }
      })
      
      // *********** EVENT CHANNEL IMPLEMENTATION
      let randomNumberStreamHandler = RandomNumberStreamHandler()
      eventChannel.setStreamHandler(randomNumberStreamHandler)
      
      
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}


class RandomNumberStreamHandler: NSObject, FlutterStreamHandler{
    var sink: FlutterEventSink?
    var timer: Timer?
    var counter = 0
    
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        sink = events
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(sendNewRandomNumber), userInfo: nil, repeats: true)
        return nil
    }
    
    @objc func sendNewRandomNumber() {
        guard counter < 5 else {
            timer?.invalidate()
            return
        }
        guard let sink = sink else { return }
        
        let randomNumber = Int.random(in: 1..<10)
        sink(randomNumber)
        counter += 1
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        sink = nil
        timer?.invalidate()
        return nil
    }
}
