# Vimod-Pub-solo-sfm2lift
## Make a LIFT file from MDF schema SFM file

This project is set up to make one LIFT file. It makes use of the Vimod-Pub scripting menus and tasks. If you want to make multiple concordances this is not the best way to do it.
If you want to make multiple LIFT files, then it is best to use the structure in Vimod-Pub project. https://github.com/SILAsiaPub/vimod-pub

## To setup this tool:
* You must have iconv.exe installed in the subfolder pub\tools\iconv\bin. You can get this file from: http://gnuwin32.sourceforge.net/downlinks/libiconv-bin-zip.php
* You must have Java installed and either:
  * in the path 
  * or edit "pub\setup\user_installed_tools.var" and change the line 
      * # java=C:\Program Files\Java\jre8\bin\java.exe
      * change by removing the # and putting in your path to Java. i.e. replace the bit in [] brackets.
      * java=C:\[your-java-path]\bin\java.exe
       
## To use this tool

* Open the project.tasks file in the root of this project.
  * Edit the variables values in double quotes to suit your project. 
  * If your source is not UTF8 you must supply source-sfm-legacy variable. Do not edit the source-sfm-utf8 variable.
  * If you have a source in UTF8 already then edit source-sfm-utf8 variable.
  * 
* Start pub.cmd by double clicking on it from Windows Explorer. You should see the following
  * ![start screen](pub/resources/startscreen.GIF)
  * If you don't see the above, check Java is installed as above.
* Type the letter a and press enter to move the files into the project.
* Now step through each of the other steps.
* If you have a Yellow screen, something went wrong.Read what it says and try and fix it.
* At the end of step e the PDF should open after a few minutes.

It maybe that you need to adjust the CSS files to get the look you want. These are found in the css folder. If you adjust the css files you don't need to remake your HTML files just the PDF. But if you change your project.tasks file you do need to remake the HTML files before remaking the PDF.