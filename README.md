<h1 align=center > SSH Manager </h1>

<img align=center alt="GitHub all releases" src="https://img.shields.io/github/downloads/Starsky-pil/SSH-Manager/total"> <img align=center alt="GitHub top language" src="https://img.shields.io/github/languages/top/Starsky-pil/SSH-Manager"> <img align=center alt="GitHub issues" src="https://img.shields.io/github/issues/Starsky-pil/SSH-Manager">

# Table of Contents  
* [First step](#First-step)  
* [Config.txt](#configtxt)  
* [Colors](#Colors)  
* [The main menu](#The-main-menu)  
    
<a name="headers"/>

# First step

First, when you succesfully downloaded the manager, you will basically launch it. After that you launched it, it will create 4 folders (download, upload, SSHPK and PortableGit) and one config.txt, it will extract fart.exe, refrersh.exe and SSHKeyMove.exe. All of those things will be explained! 

# Config.txt

As I said before, you will have a config.txt, this file will be very inportant because this is where all your configs will be stored ( username for the SSH login, the remote IP, if you want to personalize the name of upload and download folders and if you want to personalize the color of your text)
```
#IP of the remote server 
server=5.196.26.143
.   
#User 
user=starsky
.    
#Personalized name of the upload folder 
upload=upload
.    
#Personalized name of the download folder (or the path) 
download=download
.    
#Personalize the color of the script: 
colour=Aqua
.    
#Personalize the color when download is successful: 
colors=Green
```
:warning: *the most important thing is that you only have to change words after the =* :warning:

# Colors

List of all colors
----------- |
Blue                  
Yellow
Green       
White       
Light Red
Aqua        
Gray 
Light Aqua       
Light Purple
Red          
Light Blue   
Light Yellow
Purple        
Light Green 
Light White

# The main menu

The main menu is composed in 7 options:
<p align="center">
  <img src="https://cdn.discordapp.com/attachments/669629495866556436/802644044462555166/mainpanel.png" width="556" title="SSH Main">
</p>

1. The first one is the quickest, it will open you another prompt and will ask for your password for the SSH connection ( it will use your configs settings)
2. This one is a bit more complicated, first, it will create a SSH Key, then it will try to move it (using SSHKeyMove.exe) and will request more permission because the public * key is in a restricted zone and will be moved in the folder SSHPK for ease reasons. Then it will make a connection at the IP and with the user that you putted in config.txt, the public key will be moved to your home. And that's it!
3. This one is pretty understandable, it will copy your folder upload (or sthg else if u edited the name) and send it to your home, you will juste have to connect by typing your password and that's all!
4. This one will use fart.exe, you just have to put the word that you want to change ( be carefull if it have multiple time the same word!) and then put the new one, press enter, and you're fine!
5. It will use refresh.exe because an exe can't kill hisself and restart at the same time x)
6. I suppose that you can understand.
7. I supose too
