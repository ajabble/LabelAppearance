## Lets create CocoaPod
Open terminal and follow steps:

###### Update your system with latest ruby gems
`sudo gem update --system
`

###### Install CocoaPods
`sudo gem install cocoapods
`
###### Create Project for CocoaPod
**pod lib create** command helps you to create directory structure for pod

*For Example:*

` pod lib create AJLabelAppearance
`
and will ask following questions:

Before you can create a new library we need to setup your git credentials.

> 1) What is your name?

> 2) What is your email?

> 3)  What language do you want to use?? [ Swift / ObjC ]

> 4) Would you like to include a demo application with your library? [ Yes / No ]

> 5) Which testing frameworks will you use? [ Specta / Kiwi / None ]

> 6) Would you like to do view based testing? [ Yes / No ]

> 7) What is your class prefix?

###### Updating your pod spec
`pod lib lint`

command is used to validate pod spec file

*For Example:*

` pod lib lint AJLabelAppearance.podspec
`

It will display warnings and errors, so we have to update podspec file with main points are *summary, description, homepage, source*.

#### Note
```
For the GitHub link upload the project on GitHub by using command line tools or by using the GitHub desktop.

Create a repository / Commit and Push the project to GitHub.
```

*Validate again with command 'pod lib lint' and it will display output like:*

`
-> AJLabelAppearance (0.1.0)
`

###### Add code to project
Lets add some functionality to the pod:

1. Go to Pods folder there is file available with project i.e **ReplaceMe.m** and it will be an empty file.

2. Delete this file and add yours NSObject file (.h | .m ) and add your own code.

3. And access methods in actual Project, if any issues related with file not found from the pod then use **pod install** and close the project and open it again.

4. If you want to access this right now in any of other project, use

`pod 'AJLabelAppearance', :git => '{GITHUB_LINK}'
`

###### Its time to make your Pod Available
Push code to GitHub 

Tagging

```
git tag 0.1.0
git push origin 0.1.0
```

This step indicates that you are marking this commit as a specific release of your pod. The name of the tag should match *s.version* in your **.podspec** file.

### Push to Cocoapods repository
`
pod trunk push {YOUR_POD_NAME
`

It will be used for push specs to cocoapod repo.

###### To register for Cocoapods
`pod trunk register {YOUR_EMAIL_ID AUTHOR_NAME} --description='{YOUR_DESC}'
`

1) It will ask to verify the session by clicking the verification email that has been sent to your mail.

2) Again try after registration

`pod trunk push {YOUR_.podspec} --verbose`

Now Pod is published and you can use it in your project.

### How to use this Pod

Step 1: `pod init`

Step 2: Add pod to Podfile e.g. `pod AJLabelAppearance` under your project target in Podfile.

Step 3: `pod install`

Cheers!!
