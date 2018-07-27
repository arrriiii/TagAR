# TagAR

The source code of your project on GitHub, with:
Clear documentation on how to setup/install your project
Any third-party dependencies or configuration required

## Trello Board ##

[Trello Board Link](https://trello.com/b/2CE8lUVi/capstone-project)

## Product Plan ##

[Product Plan Link](https://gist.github.com/Ari-1/83cdd076125a5daf274bfbcb8a480f71)

## Installation ##

In order to use the TagAR app, you'll need to download the latest version of Xcode (9.0 or above), and a iOS device with A9 chip or higher.PLEASE NOTE: ARKit apps do not run on simulators! You must run your code on a physical device. The list of technologies to run the app on your computer below.

* Xcode 9.0 or above  
>Xcode is an Integrated Development Environment (IDE) developed by Apple. You can download the latest version through the Mac App store. By default the App Store is in the Dock. You can also find it in your Launchpad.
    
* iOS device, with A9 chip or higher. The only devices that support ARKit are:

> iPhone 6s and 6s Plus (Some issues may arise) 
> iPhone 7 and 7 Plus 
> iPhone SE 
> iPad Pro (9.7, 10.5 or 12.9) – both first-gen and 2nd-gen 
> iPad (2017) 
> iPhone 8 and 8 Plus 
> iPhone X  (Some inconsistencies may arise) 

* macOS 10.12.6 or above (Sierra)
* Connection cable for your device to your computer
* Apple Developer Account
> You can obtain a developer licence from Apple for $99 per year or you can register with your Apple ID for the free account. Note that the free account is limited to 10 apps per week, so unless you plan building more than 10 apps/week or releasing your app to the App Store, then you should be fine with the free account.


### Tips Before Running the App ###

1. If you're having trouble running the app with ARkit, Try:
  * Cleaning the project (command+shift+k)
  * Turning computer on and off
2. If that doesn't work, the Xcode installation may be corrupt, in which case,
  * Uninstall and reinstall Xcode (not the beta version, install the release version)
3. If a white screen shows up when you run the app,
  * Your device is not compatible with ARkit. Please see the list of supported devices above.
  
## SetUp ##

### Downloading the project ###
1. If you are familiar with git, git clone the project in the terminal or download the zip file from the project [Github page](https://github.com/Ari-1/TagAR)
2. Once downloaded, open the zip file and save it in netural location (desktop or documents) 
3. Launch Xcode. You should see the version is 9.0 or above
4. Click on Open another project... select the TagAR project file and open

### Slideloading the App ###
5. Make sure you are in the top project folder and select the General tab
6. Update the Bundle Identifier with your name
> Mine may say _com.jmft.tagAR_ You'll want to put _com.**your name**.tagAR
7. Update the Team with your Developer Apple ID
> If your Apple ID does not show up, you can add your account with **Add Account** option, this will prompt a sign in window to login in with your Apple ID and password.
8. Clean the project before running under the Product tab and select Clean. Alternatively, `⇧⌘K` 
9. Build the App by pressing the play button on the top of the project folder

> During the sideloading steps, at various times, you may see a popup that will request your password for Keychain. It's essential that you enter your password and click "Always Allow". This pop up might show up more than once, usually around 3-4 times. You must click "Always Allow" every single time. If at any point in this process you are denied permission, you'll get an error that says `swift sdtlib tool error` and you'll have to troubleshoot using these steps listed [HERE](https://stackoverflow.com/questions/41205250/swift-sdtlib-tool-error-task-failed-with-exit-code-1)
> First time sideloading the app, may require your permissions on your device. To enable this, go to your device settings under General, select Device Management and authorize the Developer Apple ID. Stop and rebuild the app from xcode.
  
  
  
