# Working with Input Widgets and Forms

Mobile applications often need to collect user input. This can be for configuration settings, for getting personal information or just for app interactions. User input in Flutter is collected using input widgets and these input widgets can be embedded within forms.

In this app, you will learn the different types of input widgets that you can use to accept different types of inputs, continuous inputs and categorical inputs. You will understand the use cases and special characteristics of these different input types and how these inputs can be grouped together into forms with a submit button. You will implement and handle changes in a variety of different input types.

You will see how to use text fields for free-form inputs, radio buttons for single selections, checkboxes for multiple selections, and the Switch widget for binary input. You will use change handlers to handle input changes and state updates, and use grouped widgets to update the same state using multiple inputs.

Finally, you will see how input widgets can be embedded to be part of Flutter forms. You will learn how FormState is accessed and validated using FormField widgets and how you can create custom widgets that can be embedded in Flutter forms. When you're finished with this course, you will be able to create input widgets to accept all kinds of user inputs and embed these widgets in forms and use validators and onSaved callbacks with your forms.

## Input widget in Flutter
The framework itself contains a number of built-in widgets for the most common kinds of inputs. Now, each of these widgets available in the framework can be styled and decorated to get the right look and feel for whatever your use case is. Each input widget has its own set of decoration properties. Also, each widget can respond to changes and update its state based on what the user has specified. Input widgets can be categorized into 2 broad types. Certain input widgets, such as text fields, can accept free-form input, so, you can type an alphanumeric characters, long sentences, multi-line sentences, and so on. There are other input widgets that constrain what inputs you can specify to a specific set or range of values. Drop-downs, radio buttons, checkboxes, sliders, all of these are examples of input widgets that constrain your input.

Essentially, when you think of what kind of input widget you want to use, think about what kind of response you expect from the user. Some input widgets, such as text fields, will allow free-form responses. That's when you don't know what the user might input, comments or reviews. If you want to ensure that the user responses are from a constrained set of values, then you should use a constrained input widget, such as those that accept categorical values. Radio buttons and drop-downs allow you to select one from many categories. Or you might have input widgets that accept a range of values, sliders for example.

Let's do a quick overview of some of these input widgets and see why you might use them. The TextField is what you'll use to accept free-form text input. Now, in Flutter, your text fields can be single line text fields or accept multi-line input. Flutter also gives you the option to constrain what you can accept in your TextField. You can say you want only numeric input, or you can tailor the keyboard to accept email addresses, you can add validators and so on. You can also decorate your text fields using an outline, hint text, labels, icons, etc. Now, if you want the user to choose one amongst a discrete set of values, you may use the radio button. This is a single-select input widget. It's used to accept a discrete value from a set of probable values.

You can also group multiple radio buttons together to form a set of possible inputs. And the radio button is the most useful when you have a few choices and you want the user to choose one amongst them. If you have a discrete set of options and you want the user to choose one or more of these options, you can use the checkbox which is a multi-select input and this is what you'll use to accept multiple values or multiple options from the user. If you want the user to make a binary choice, yes, no, true, false, up, down, choose the switch input widget that allows binary input.

This is what you'll use to have the user make a choice between two discrete values. True/false, yes/no, on/off, enabled/disabled. These are all examples where you might choose the switch input. The drop-down is another example of a single-select input. This is what you'll use when you want the user to accept a discrete value from a set. Now, a drop-down is a better choice as compared with the radio button if you have a large number of choices that the user can select from. Input widgets in Flutter can be used standalone to accept a single response, or you can group multiple widgets together to form a form. A form is just a set of input fields used to collect responses from the user. These responses are then validated and submitted to the server for processing.

The form submission happens when you click the submit button that is often associated with the form. When you use forms in Flutter, it's common practice for the input widgets to be FormField elements. A FormField widget in Flutter is usually part of a form that may contain other widgets that are also FormFields. FormField widgets have a certain standard set of properties that are useful when working with forms. For example, every FormField widget has an initial value that you can assign to set up the initial state of the widget.

Every FormField widget accepts a validation callback. This callback is invoked when you validate all of the widgets in a form. Every FormField widget has a validation mode that you can use to specify when exactly that particular field should be validated. Should validate it right away on submit you can specify this. And finally, every FormField has an onSaved callback. This is the callback that is invoked when you invoke save on the FormState. So, now is a good time to explain what exactly the FormState is. Every form widget that you create in Flutter is associated with the state object and that is the FormState. The FormField widgets that are included in a form become part of the form's state.

Every form that you'll use in Flutter has a FormState object for the form as a whole and it holds state information for all of the widgets and you can call methods on this FormState, for example, calling FormState.save() will invoke each form field's onSaved callback. You can call FormState.validate to validate all of the FormFields that exist in a form. The FormState allows you to operate on the form as a whole. When you're working with forms, you'll need to use a global key to uniquely identify your form. A global key is a key that is unique across the entire application, and this key can be used to uniquely identify your app's elements. Global keys associated with elements are commonly used to provide access to other objects associated with those elements, such as the state of the object or the BuildContext of the object. Global keys, when used with forms, allow you to specify and manipulate the FormState for a form as a whole.

## TextField Widget
I return a MaterialApp. This widget is the starting point of your application and it tells Flutter that you're planning to use material components and material design in your app. I have set a theme for this MaterialApp with the primarySwatch set to deepPurple, and that's why our app bar appears in deepPurple if you look at the emulator. The home property is set to a Scaffold. The Scaffold widget is used under the MaterialApp and it gives you many basic functionalities that you'll need in an app that uses material design like AppBar, drawer, floating action button, and so on.

Our Scaffold has an AppBar property which is set to the Text Insta Store and then the body of the Scaffold is set to this TextInputWidget. This TextInputWidget is a custom SatefulWidget that I have defined that holds the text field that you see displayed in the emulator. Look at this TextInputWidget class extends the StatefulWidget base class. Now, at this point in time, this widget does not hold state, but you can imagine that whatever the user types into the text, you might want to save in a member variable, and this is exactly why I've chosen to make this a StatefulWidget, though it actually does not store any state at this point in time.

The TextField class is a material design TextField. This lets the user enter text into the application, either with the hardware keyboard or with an on-screen keyboard. Now, by default, a TextField has a decoration that draws a divider below the TextField, and you can see that in the emulator, the gray line is the divider indicating where the TextField is. The TextField is just above that divider.

Now, I have wrapped this TextField in a center widget and a padding widget so that it's centered nicely in the middle of our app. Now, you can use this TextField to enter text. The minute you select the TextField, you'll see that your software keyboard pops up. Now, I'll use my hardware keyboard to enter text into the TextField. It's useful to have a label associated with a TextField and you can set that label using the decoration property of the TextField. When my app hot reloads, you can see the change in the emulator, you can see that my TextField now has a label, Share your thoughts. Now, this particular InputDecoration object has just one property assigned. But you should know that the InputDecoration class contains borders, labels, icons and styles. Everything that you need to decorate a material design text field. You have to admit that our TextField is now looking a lot better. 

The prefixIcon property will set an Icon at the beginning of your TextField. The InputDecoration class allows you to set suffix icons, styles for your icons, colors for your icons, and many other decoration properties. I want to change the border of this TextField, so that the entire TextField has an outline. Now, whether you want the border or not, that's up to you and that's part of your app's design. But I really think the OutlineInputBorder gives a very clear representation of where exactly the TextField is. You can also set the border to InputBorder.none or the underline input border. That is the default. You'll see that when the TextField is selected and I'm about to select it right now, it gets this nice purple outline. And the message icon is also displayed in the purple color, that is our primary swatch remember. Another common practice when specifying text fields in your mobile applications is to specify a hintText that appears within the TextField and is replaced by whatever you type in. You can type in letters and you can type in numbers, special characters, anything. But let's say you know that your TextField only accepts numeric inputs. Maybe it's the field for ZIP code or age or some numeric value. You can specify your keyboardType, keyboardType set to TextInputType.number as I've done here, will pop up the numeric keyboard when your TextField is selected.

And this is a really nice usability feature. Your users know that this field expects numeric input, they should use the numeric keyboard. You can change the keyboard input type to be text. That is the default value. This is what brings up the alphanumeric keyboard. When you do not specify any keyboardType for your TextField, it is this TextInputType.text that is the default value bringing up the alphanumeric keyboard. Let's say that this TextField is for the user to type in an email address. You may want a keyboard that enables the @ sign for the emailAddress.

Set your TextInputType to emailAddress. Now, when you bring up the keyboard, notice that the keyboard has an @ sign at the bottom left. This is facilitated by the TextInputType.emailAddress that we have specified on line 48. What if you want to restrict the length of the input that your TextField accepts? Well, you can set the maxLength property. Here I've set maxLength to 5 and when your app reloads, take a look at the emulator and observe that just below the TextField, you see 0/5. You've typed in 0 characters out of the 5 permitted in this TextField. Now, let me try and type something in this TextField. I'm going to try and type in Awesome but after the first 5 characters, Aweso, it doesn't let me type in any further. I've reached my limit. Let me increase the maxLength of my TextField. Instead of 5, I'm going to set 50, and this will update the limit in the emulator as well. I've typed in 0 out of 50 so far.

## Handling Updates to the Text Field 
What we're going to be doing in this demo is wiring up an onChanged handler to our text field such that whatever we type into the text field will be displayed in the text widget just below. So, the text widget that says No thoughts yet will contain our thoughts as we type them into the text field, and we'll do that using onChanged handler.

Let's turn our attention to the code. Once again, I use the MyStore StatelessWidget that contains our MaterialApp. I have a Scaffold and the body of the Scaffold is set to the TextInputWidget. If you scroll down, you'll see that the TextInputWidget is a StatefulWidget and now it's going to actually hold some state.
I have the String thoughts that is set to "No thoughts yet. . ." that is the member variable that holds the state of our custom text input widget and this is the state that we'll update using the text field.

The onChanged handler will be invoked each time you update the text field, that is, each time you type something into the text field. You can see that this onChanged handler takes in the current text as an input value. Now, if you want to update the state of your text input widget based on the current text in the text field, you can invoke the setState function. I simply set the current thoughts variable to the input text. In addition, I have a debugPrint statement that prints out my current thoughts to the output console. This means that the onChanged handler of the text field is invoked for each character that you type into the text field. This is an important detail to remember about the onChanged handler. Each time you type into the text field or you delete something from the text field, the onChanged handler will be invoked. Now, let's say you do not want your state to change for every character that you type in. You only want the state to change when you click on a button in the keyboard.
The onSubmitted handler is invoked by passing in the text that is in the text field and within that I call setState and update the thoughts variable to the current text. And I print out the screen You've submitted your thought, right, and I print out the current thoughts. On the onChanged handler, I simply print out Your current thought, unlike the onChanged handler, the onSubmitted handler will be invoked only when we click on a button indicating that we have finished entering our text into our text field.

I've cleared out the current text field and I'm now going to type out Flutter is fun. Observe in the Console window each time I type in a character, the onChanged handler is called, but observe that the text widget still says Flutter is amazing! That's because the text widget will only be updated when the onSubmitted handler is invoked and the onSubmitted handler will be invoked when I click on this accept button in my soft keyboard. And once that's done, you can see Flutter is fun! displayed in our text widget.

Remember, the text widget is only updated when the onSubmitted handler is invoked, and that's done when we press some other button outside of the text field. Flutter offers an alternative to the onChanged and onSubmitted handlers. If you want much more control over how exactly you handle changes in your text field, you can use a text editing controller, and that exactly what I have set up here in this updated version of the code.

a TextEditingController. This is the TextEditingController that we are going to associate with our text field. You can add listeners to the TextEditingController in order to listen for whatever changes are made with the text field. Now, if you have a TextEditingController, it's common practice to set up your listeners in the init state method of the object. So, I have the initState method defined call all super.initState and then I add a listener to my TextEditingController. This listener will listen for changes to our text field input and then perform some corresponding actions.

## Processing Input Using Radio Buttons

The next input widget that we'll explore here in Flutter is the radio button. I've already updated the code to display the radio button here in this RadioStore.dart file, and I've run the app so that you can see what the UI looks like. you can see that we have an image of a pair of heels and then we have a number of sizes that you can select, Small, Medium, or Large. The size selections are done using a radio button. Currently I have the Large size selected and you can see the text just below the image which says Currently selected: Size.large. 

MaterialApp within which there's a Scaffold, and the body of the Scaffold is set to the RadioInputWidget, a custom widget that I have created. Radio buttons allow you to select one of a discrete set of categories. Now, these categories need not always be represented using an enum, but it's common practice to use an enum because it makes it very clear what option you're trying to select. You can see that within the RadioInputWidget state. I have a SingleChildScrollView, which means that the contents of that view can be scrolled. So, if the contents of this Widget overflow the device screen, you should be able to scroll and view those contacts. The SingleChildScrollView has a single child that is a Column, and the Column contains a number of widgets arranged vertically.

The Container widget our product image. The Padding widget is what contains the text which displays the currently selected size, and the three ListTiles make up a list. Each ListTile contains a single radio button which is part of our larger radio button group to select sizes. The RadioInputWidget is a stateful widget and the state for this widget is held in the member variable. the Size member variable. You can see that we've set the Size to large by default, but this is something that will be updated when we click on the different radio buttons. I'm going to expand each of these in turn. Notice that I have a Container with an AssetImage, displaying images/heels.jpg. This is what contains the Text widget displaying the Currently selected size. you can see we have the text Currently selected and we display $_size the enum, and the Currently selected size at this point in time is size.large.

I'll now expand each of the list tiles in turn and you can see how each radio button is configured. Now, a ListTile is very useful as a widget to hold radio buttons because you can associate Text, icons, etc with your buttons. The radio button itself does not have associated text or images. Observe that the title of this ListTile says Small. The leading property is where I specify my Radio button, set to your member state variable when that radio button is clicked, and that is set in the value property. you can see that this first radio button is associated with the value Size.small. The groupValue is set to the currently selected value for a group of radio buttons, and all radio buttons that are set to the same currently selected value will be part of the same group. All our three radio buttons that belong to the same group will be set to the same group value and then I have the onChanged handler. So, each time this radio button is clicked, I'll update the state of my widget to be equal to the value. So, size will be equal to Size.small.

Now, in Flutter, it's common practice to have radio buttons embedded within list tiles. So common that there is a widget meant explicitly for this, and that is the RadioListTile. The RadioListTile makes it very easy for you to use radio buttons within list tiles. If you take a look at RadioListTile properties, you'll find that the code is much simpler. There is a title property that allows you to set title for the radio button. The value, groupValue, and the onChanged handlers, all are part of the RadioListTile. You don't need to embed a separate radio widget within your ListTile.

If you look at the code in each RadioListTile, you'll see that it's a lot simpler. That's because the value, groupValue, and onChanged properties are directly present on this widget. You don't need a separate radio button and the functionality is the same. I've run this code and you can select the different options and you can see that the currently selected state is updated.

## Handling Input Using Checkboxes
The radio button that we explored in the previous screen is a great input widget when we want to select one value out of many. But what if we want to enable multiple selection? Well, that's when you'll use the checkbox widget and that's what we're going to explore here in RadioStore.  you can see that I have four items which displays different products, and then there is a checkbox associated with each item.

Remember, checkboxes allow multiple selections, which means multiple items can be selected at any point. Observe the body property of Scaffold. I've set it to be equal to the CheckboxInputWidget, a custom widget for checkboxes that I have created.
I've set up a list view displaying products, where each product is associated with a checkbox, and this is within the CheckboxInputWidget. Every item that I display as a part of a list is a Product on my e-commerce site and I'm going to represent each item using the Product class defined. Each product has a reference to an image that is the imageName, a title, and a state to indicate whether the product has been checked or not. Here I have each checkbox manage its own checked state associated with the Product that it displays. you can see the State object associated with our CheckboxInputWidget. Within that, I have a list of products that I display, that is our productsList. So, I have a Sweatshirt, a Tie, a Top, and Jeans. Initially, the checked state for all four products is set to false and you can see. Now let's take a look at the build method where our ListView has been set up. Notice that I use the ListView.builder. The number of items that I'm about to display is _productList.length, that is the itemCount. The itemBuilder contains the callback that is used to build each item in my list. Each item is displayed using the Card widget that allows me to nicely configure the look and feel of my list items and the child widget for each card is a ListTile that contains a Checkbox.

Now, every checkbox has the current value that is the current checked state and I set the value of this checkbox based on the checked state for this particular product at index I. Then every checkbox also has its own onChanged handler and within the onChanged handler, I call the setState and update the checked state of this current product.

Now, the way the Checkbox works is that each Checkbox is its own independent entity. It's not part of a group, unlike with radio buttons. So, each checkbox updates and manages its own state. There is no group value property associated with the Checkbox. The rest of the code here is simply a Row widget with an image defined.

I can replace this code with a CheckboxListTile. The CheckboxListTile has a value and onChanged property.
Those are properties of the checkbox and the remaining properties, title, etc belong to the ListTile. So, this allows you to display checkboxes within list tiles very easily.

## Toggling Values Using the Switch Input
It's very often the case that the input that you seek from the user can be one of two values. That is, this is binary input, so the user can say true or false, yes or no, I agree or disagree. Now, an input widget that captures binary input is the Switcher, and the Switcher is what we're going to look at in SwitchStore. You can see that we have an image that will be manipulated using a Switcher at the bottom. When we toggle the Switcher to go from off to on, the image will change. Let's take a look at the code now. observe that the body property of the Scaffold has been set to a new custom widget the SwitchInputWidget. This is the widget that will contain our switch input and also the image that it manipulates. Notice that the SwitchInputWidget extends the StatefulWidget base class. The state variable is the _showSweater that has been initially set to false. When _showSweater is false, the jeans image is what will be displayed. When this is true, a sweater image will be displayed. I have a Container here that actually holds the image. You can see that this container has a child that is a Column object.let's take a look at the children widgets within this column. The first child is an image, that is the image that is displayed based on the current state of the widget. I have a ternary operator checking to see whether _showSweater is true. If it's true, the AssetImage sweatshirt.jpg is what will be displayed. If _showSweater is false, then the image jeans.jpg is what will be displayed. I have the message Toggle to change the image. _normalToggleButton, That is the method that I invoke to set up our switch input. So let's take a look at this _normalToggleButton().

Now within this method, I have a Switch widget. Now, the value of this switch widget is determined by our showSweater state. The value will be false when showSweater is false, will be true otherwise. It has an onChanged handler and within this handler, we update the state of _showSweater to true or false based on the value of the switch input, whether it's turned on or off. Now, this entire widget is wrapped within a Transform.scale. The Transform object allows you to apply different transformations on your input widget, and the scale transformation allows you to change the size of the widget. Here I've set the scale property to 2.0, which means the widget that it wraps will be displayed at twice its original size.

Now, we've already seen what the UI looks like, let's use the toggle button. When I turn it on, you see the sweatshirt and when I turn it off, you see the pair of jeans. Now you can set up many properties on the Switch widget to edit its look and feel. Here I've set the activeColor for the Switch widget to be orangeAccent. This means that when the Switch widget is turned on, it will have an orangish tint. Let's try this. I've turned it on to show the sweater and you can see that its color is the orange color. You can also configure the color of the widget in its inactive state, inactiveThumbColor set to blueGrey. Observe the updated Switch widget.

You can see that the knob or the thumb of the widget is now in the blueGrey state. Now when you move it to the active state, it becomes orange and when you move it back to the inactive state, it becomes blueGrey. You can make your switch input even more interesting by updating the image displayed on the knob, activeThumbImage has been set to sweatshirt and inactiveThumbImage has been set to jeans.

You'll now get a visual cue on the knob of the switch input to indicate what state it's in.

You can see the jeans image on the knob of the switch input. If you turn the switch on, the activeThumbImage, that is, the sweatshirt will be displayed. If you turn the switch off the inactiveThumbImage will be displayed. Let's look at Transform.scale. Let's say I set the scale property to 1. We'll see the original size of the Switch widget and you can see that it's a lot smaller. Now let's say you want the Switch widget to be displayed hugely magnified. Set the scale property to 4.0. 

## Selecting Input Values Using Dropdowns
Another useful widget that allows you to select one from a set of discrete values is the drop-down. The functionality of a drop-down is similar to that of a radio button. Select one option out of many. With a radio button if you have a large number of options, radio button becomes unwieldy. If you have a large number of options that the user can pick from, use the drop-down. I've already updated the code for the drop-down in this DropdownStore.dart file and you can see what our app looks like in the emulator. You can see we're selecting the sizes for our shoes and the Small size is selected in the drop-down by default. The structure of the app remains the same and the body property of our Scaffold has been set to the DropdownInputWidget. The DropdownInputWidget is a StatefulWidget. we have a member variable called value that has been set to the String Small. Small represents the current selected state of the drop-down. The sizes list defined contains the options that we are specifying in the drop-down, the Small, Medium, and Large sizes. the first child is a Container that displays the image heels.jpg. Just under the Container, we have a centered Text widget which displays the current Selected size. we can see the Container that contains our drop-down. This DropdownButton widget represents the drop-down as a whole, and the individual menu items in the drop-down are represented using the DropdownMenuItem widget.

we've set the value property of the drop-down button and assigned it the value member variable, which if you remember, contained the string small, that is the currently selected value in the drop-down. I've also set an icon for the drop-down,the keyboard_arrow_down so that we can see a little down arrow next to the drop-down list. You can see that in the emulator. The individual drop-down menu items are specified in the sizes list that we had initialized earlier. The map operation operates on each element in the sizes list, and for each element creates a DropdownMenuItem.

Now that you have some experience with these input widgets, the code was actually quite straightforward. I've already run the code, let's use the drop-down. You can see that when I select Medium, the Selected size says Medium, and when I select Large once again, the Selected size is updated, and if you select Small, well, the Selected size will say Small.

## Working with Grouped Input Widgets
In all our examples so far, when we've had stateful widgets that accept inputs, input widgets have updated only one state. So, each input widget has had its own state that it updates. Now, in this example, we'll see how you can group multiple widgets together and have the same state updated using multiple input widgets. In this way, we'll create a grouped widget that can then be reused in multiple portions of your code and the grouped widget that we'll create will be a Username, Password, and Confirmed Password field. I've already set up the code in the GroupedInputStore.dart file. Take a look at the app that's running. You can see there are three text fields here. There is a Username field, a Password field, and a Confirm Password field. This entire thing is going to be a single stateful grouped widget with multiple input fields that update the same state. We'll check to see whether the Password and Confirm Password fields match. If no, then we'll show an error message saying Passwords do not match, please try again.

If yes, we'll indicate that the passwords match. So, the match Boolean variable will be updated by the Password field as well as the Confirm Password field. Now, we are ready to take a look at the code. The basic structure of the app remains the same. I have the body set to the PasswordInputWidget. This is going to be our grouped widget. I call it a grouped widget because we have multiple input fields updating the same state. The PasswordInputWidget extends the StatefulWidget base class.  I have 3 member variables of this State class holding state information.

The first is the match variable, which is initially set to false. We initially indicate that the passwords do not match. The password and confirmPassword variables hold the current values of password and confirmPassword as specified in the text field. Initially, these are the empty String.  I have the checkPasswords method. This is the method that we'll invoke to check to see whether the two passwords specified in the password and in the confirmPassword fields match. The code for this is pretty straightforward.

I check to see whether any values have been specified for password and confirmPassword, password isNotEmpty and confirmPassword isNotEmpty. I check to see whether the password is equal to the confirmPassword. If yes, then I set the current state of match to be equal to true. The first TextField defined  is for the Username. The keyboardType is TextInputType text, meaning this is a regular alphanumeric keyboard. The second TextField is defined for the password.

we set the password to the password passed, we invoke the checkPasswords method to check whether the password is equal to the confirmed password. we have the third TextField for Confirm Password.keyboardType is again text. The onChanged handler will update the confirmPassword member variable. we call checkPassword after we've updated the confirm password to see whether the two passwords match. I have a Text widget which displays whether the passwords matched or not.
You can see that I checked the match variable , I print out Passwords match! And if match is false, I print out Passwords do not match please try again. I've also assigned a TextStyle based on the match variable. If the passwords match, the text will be displayed in the blueGrey color. Otherwise, it will be displayed in the red color.

We can actually see the password. Passwords are supposed to be obscured. You're not supposed to be able to see the password as you type it in. Well, we can fix that by setting the obscureText property to true for both these text fields. I've set obscureText to true for the Password text field and I'm going to do the same thing for Confirm Password.  Let the app reload and you can see that we can no longer see the password and confirm passwords. The text has been obscured. 

Let's make this page a little more meaningful. I'm going to add a Submit button just before the Username, Password, and Confirm Password text fields. You can see I've specified an ElevatedButton which is only available to be pressed if the match variable is set to true.
I set the onPressed handler that onPressed handler will be available only when match is true. That is my conditional check there, and within the on-pressed handler, I show a little AlertDialog. I invoke showDialog  see that the builder sets up an AlertDialog, a dialog that pops up as an alert on screen.

You can set the title and content properties to set up the title and content of this AlertDialog. And you can see I've specified a TextButton in the actions property of the dialog. The onPressed handler of this text button will simply go back to the previous screen when you click on OK on this text button. you can see the termination of our ternary conditional operator.

If match is false, the onPressed property of the ElevatedButton is set to null, which means the Submit button will be disabled. Now, let's take a look at how this app works. Now, I'm going to go ahead and edit the Confirm Password field so that the passwords do not match. Observe that the Submit button is not enabled. I'm going to go ahead and fix the Confirm Password so that the passwords match. In that case, the Submit button is enabled and you can click on it. If you click on the Submit button, you should see an alert dialog pop up on screen and if you click on Okay, you go back to the previous page. This is thanks to the code on line 104 where we call Navigator.of(ctx).pop to navigate back to the previous page from the alert dialog.