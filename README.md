# ShinyAppProject
Developing Data Products Final Project , creating Shiny app
### What does this app do:
This small Shiny application demonstrates Shinys automatic UI updates. 
It show the attendance numbers of 3 different springs in Florida from year 2000-2013.  
<br>
On the left panel, it shows a  `Drop Down` menu Shiny Gadget, where the user can pick which spring, the user would like to observe. When the user pick a Spring from adropdown box, a barplot of that springs attendacewill display. Notice how the `renderPlot` expression is automatically re-evaluated when the spring name changes, causing a new bar plot to be generated and the plot to be rendered.  

Also on the left panel, the user has the choice of displaying a map where the Springs are located or not displaying  using Shiny Gadget ` Radio Buttons`. 

The left panel also has a help text , instructing the user of the use of the app and providing more information about available tabs included

The app also provides several tabs, where the user can see summary of the data, the data used in a table form, Readme file about this app and instruction from the project itslef.


### Github
For more information about this app and the code used please visit
https://github.com/kathy0305/ShinyAppProject.git

### App link
https://kathy0305.shinyapps.io/3_major_fl_springs_attendance_by_year

### App slide presentation
http://rpubs.com/kathy0305/270000



