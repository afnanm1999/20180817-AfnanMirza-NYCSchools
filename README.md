## 20180817-AfnanMirza-NYCSchools

<img src="https://raw.githubusercontent.com/afnanm1999/20180817-AfnanMirza-NYCSchools/master/20180817-AfnanMirza-NYCSchools/Supporting%20Files/logo.png" width="250">

### Instructions

** Coding Challenge: NYC Schools **

**GOAL** : Verify candidate can provide a technical solution and follow instructions

**REQUIREMENTS** :

These requirements are rather high-level and vague. If details are omitted, it is because we will be happy with any of a wide variety of solutions. Don&#39;t worry about finding &quot;the&quot; solution. Feel free to be creative with the requirements. Your goal is to impress (but do so with clean code).

Create a browser based or native app to provide information on NYC High schools.

1. Display a list of NYC High Schools.
1. Get your data here: [https://data.cityofnewyork.us/Education/DOE-High-School-Directory-2017/s3k6-pzi2](https://data.cityofnewyork.us/Education/DOE-High-School-Directory-2017/s3k6-pzi2)
2. Selecting a school should show additional information about the school
1. Display all the SAT scores - include Math, Reading and Writing.
1. SAT data here: [https://data.cityofnewyork.us/Education/SAT-Results/f9bf-2cp4](https://data.cityofnewyork.us/Education/SAT-Results/f9bf-2cp4)
2. It is up to you to decide what additional information to display

When creating a name for your project, please use the following naming convention:

**YYYYMMDD-[First&amp;LastName]-NYCSchools** **(**_Example: 20180101-DanielleBordner-NYCSchools)_

In order to prevent you from running down rabbit holes that are less important to us, try to prioritize the following:

**What is Important**

- Proper function – requirements met.
- Well constructed, easy-to-follow, commented code (especially comment hacks or workarounds made in the interest of expediency (i.e. // given more time I would prefer to wrap this in a blah blah blah pattern blah blah )).
- Proper separation of concerns and best-practice coding patterns.
- Defensive code that graciously handles unexpected edge cases.

**What is Less Important**

- Demonstrating technologies or techniques you are not already familiar with.

**Bonus Points!**

- Unit Tests
- Additional functionality – whatever you see fit.

**iOS:**

- For applications that include CocoaPods with their project code, having the Pods included in the code commits as source is recommended. (Even though it goes against the CocoaPods general rules).
- Be sure to use safe area insets.
- Make sure your app is compatible with iPhone X.

**Android:**

- Make sure you are correctly handing any necessary permissions.
- Please make sure you are using Java. If you want to demonstrate the use of Kotlin, we&#39;d rather you use a combination of both.

As mentioned, you are not expected to function in a vacuum. Use all the online resources you can find, and please do contact us with questions or for interim feedback if you desire.

### How to Use the app

In order to test the app, project files need to be opened in Xcode 9.2<br/>
There is no need to configure anything inside of the application source code. The project is already configured and can be run directly on a simulator of your choice. when the app first launches it will fetch the School's Data from the City of New York websites API. Once the data has been fetched successfully it will then list all of the schools in a UITableViewCell. Users can then go ahead and click on a school of their choice. This action will present a new View Controller with the Selected Schools SAT Scores and other information.
