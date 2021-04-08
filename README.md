`OpenUv.lua` is a simple dzVent script for retrieving UV-related information from
[openuv.io](https://openuv.io/).


# Installation

In DomoticZ webpage
* Menu Setup / More Options / Events
* Add script
* Select dzVents / minimal
* Paste the code of the file `OpenUV.lua` in the text editor
* Leave `Off` the script
* Save as `OpenUV`
* Create the following Virtual sensors
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
  * Note: These are proposed names
 * Update the script with the idx of the created Virtual sensors
 * Update the script wit hlatitude, longitude and altitude of your location
 * Update the script with your scpecific API_Key obtained from [openuv.io](https://openuv.io/)


