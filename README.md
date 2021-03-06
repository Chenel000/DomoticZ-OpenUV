`OpenUv.lua` is a simple dzVent script for retrieving UV-related information from
[openuv.io](https://openuv.io/).


# Installation (Please read the full wording before proceed)

In DomoticZ webpage
* Create the following Virtual sensors:
  * Name: UV index, type: UV
  * Name: UV max, type: UV
  * Name: Ozone, type: Custom sensor, unit: du
  * Name: Safe Time Skin 1, type: Custon sensor, unit: minutes
  * Name: Safe Time Skin 2, type: Custon sensor, unit: minutes
  * Name: Safe Time Skin 3, type: Custon sensor, unit: minutes
  * Name: Safe Time Skin 4, type: Custon sensor, unit: minutes
  * Name: Safe Time Skin 5, type: Custon sensor, unit: minutes
  * Name: Safe Time Skin 6, type: Custon sensor, unit: minutes
  * Name: UV Max Time, type: Custon sensor, unit: hh.mm
  * Note1: These are proposed names replace as you like. 
  * Note2: UV type devices will appear in the `Weather` tab of DomoticZ web page, and the rest of devices will appear in the `Utility` tab. If you prefer that all the UV related devices appear in the `Weather` tab, configure all the `Safe Time Skin` and the `UV Max Time` devices as UV devices and include the units in the name, ie `Safe Time Skin 1 (min)` and `UV Max Time (hh.mm)`, it will continue to appear UV as the default unit right to the value, but it will easier to check all these parameters together. In this way all the UV related devices will be shown together in the same `Weather` tab.

* Copy the script:
  * Menu Setup / More Options / Events
  * Add script
  * Select dzVents / minimal
  * Paste and replace the existing code with the code of the file `OpenUV.lua`.
  * Update the script code with the idx of the created Virtual sensors
  * Update the script code with latitude, longitude and altitude values of your location
  * Update the script code with your scpecific API_Key obtained from the [OpenUV console](https://www.openuv.io/console)
  * Enable the execution of the script by switching the state to `On`
  * Save as `OpenUV`

* Every 15 minutes from 08:00 to 20:00 the created Virtual sensors will be updated. This time configuration matches with the requirement of a maximum of 50 request per day applied by [openuv.io](https://openuv.io/)
