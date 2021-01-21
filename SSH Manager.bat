@echo off
    Title SSH Login by Starsky version 1.7
    ::  ©2021 Starsky. All right reserved
    ::  Version 64-bit

:packagechecking    
    if exist PortableGit ( goto :configchecking ) else (
    tar -xf PortablGit.zip  
    del PortableGit.zip  
    )
    if exist fart.exe ( echo fart.exe exist ) else (
    curl -# --output fart199b_win32.zip --url "https://freefr.dl.sourceforge.net/project/fart-it/fart-it/1.99b/fart199b_win32.zip" && tar -xf fart199b_win32.zip && del fart199b_win32.zip
    )
:configchecking
    if exist config.txt (echo config.txt exist>nul) else (
        goto :Reset
        echo config.txt was not found and have been created
    )

:colorchecker
    for /f "delims=" %%x in (config.txt) do (set "%%x")

        if %colour%==Blue (set colours=01 ) 
        if %colour%==Green (set colours=02 )
        if %colour%==Aqua (set colours=03 )
        if %colour%==Red (set colours=04 )
        if %colour%==Purple (set colours=05 )
        if %colour%==Yellow (set colours=06 )
        if %colour%==White (set colours=07 )
        if %colour%==Gray (set colours=08 )
        if %colour%==Light Blue (set colours=09 )
        if %colour%==Light Green (set colours=0a )
        if %colour%==Light Aqua (set colours=0b )
        if %colour%==Light Red (set colours=0c )
        if %colour%==Light Purple (set colours=0d )
        if %colour%==Light Yellow (set colours=0e )
        if %colour%==Bright White (set colours=0f )

        if %colors%==Blue (set colorz=01)
        if %colors%==Green (set colorz=02)
        if %colors%==Aqua (set colorz=03)
        if %colors%==Red (set colorz=04)
        if %colors%==Purple (set colorz=05)
        if %colors%==Yellow (set colorz=06)
        if %colors%==White (set colorz=07)
        if %colors%==Gray (set colorz=08)
        if %colors%==Light Blue (set colorz=09)
        if %colors%==Light Green (set colorz=0a)
        if %colors%==Light Aqua (set colorz=0b)
        if %colors%==Light Red (set colorz=0c)
        if %colors%==Light Purple (set colorz=0d)
        if %colors%==Light Yellow (set colorz=0e)
        if %colors%==Bright White (set colorz=0f)

:start

    if exist %upload% (echo %upload% exist) else (
        mkdir %upload%
        echo %upload% was not found
    )
        if exist %download% (echo %download% exist) else (
        mkdir %download%
        echo %download% was not found
    )
        if exist SSHPK (echo SSHPK exist) else (
        mkdir SSHPK
        echo SSHPK was not found
    )
    cls
    color %colours%
:main
    cls
    echo                        SSH manager                                                                                                                                                                                   
    echo Currently logged as: %user% 
    echo Remote machine IP: %server%                                                                                                                                                                                                               
    echo What do you want:
    echo          1. Connect SSH
    echo          2. SSH Keys                                                    
    echo          3. Transfer File via SSH
    echo          4. Edit config.txt
    echo          5. Reload the manager
    echo          6. Reset config.txt  
    echo          7. Exit                                                                                                          
                                                                                                                                                                                 
    set choice=
    set /p choice=Select a number: 
        if '%choice%'=='1' goto :SSH
        if '%choice%'=='2' goto :SSHK
        if '%choice%'=='3' goto :SCP
        if '%choice%'=='4' goto :editc
        if '%choice%'=='5' goto :refresh
        if '%choice%'=='6' goto :Reset
        if '%choice%'=='7' exit

    goto:main

:editc
    cls

    :nerror02
        type config.txt
        echo .
        echo To edit this file, you must enter what you want to be replace with the new value (enter r to return)
        set oldvalue=
        set /p oldvalue= Old value:
        if '%oldvalue%'=='' goto :error02
        if '%oldvalue%'=='r' goto :main
        
    :nerror03
        set newvalue=
        set /p newvalue= New value:
        if '%newvalue%'=='' goto :error03
        if '%newvalue%'=='r' goto :main
        
    :replace
        cls
        set sure=
        set /p sure= You have chose to replace %oldvalue% with %newvalue% are you sure (y:yes / n:no)?
        if '%newvalue%'=='y' goto :sure
        if '%newvalue%'=='Y' goto :sure
        if '%newvalue%'=='N' goto :main
        if '%newvalue%'=='n' goto :main

    :sure
            fart.exe config.txt %oldvalue% %newvalue%
        timeout /T 4 /nobreak>nul
        goto :main

:SSH 
    cls
    start ssh %user%@%server%
    goto start

:SSHK
    cls
    if exist SSHPK (echo SSHPK exist) else (
        mkdir SSHPK
        echo SSHPK was not found
    )
    if exist %HOMEDRIVE%%USERPROFILE%\.ssh (echo %HOMEDRIVE%%USERPROFILE%\.ssh exist && pause>nul) else (
        mkdir %HOMEDRIVE%%HOMEPATH%\.ssh
    )
    cls
    echo Please, don't rename the public key. The file will be copy for reasons of ease in: /SSHPK .
    timeout /t /nobreak>nul
    ssh-keygen -t rsa
    start SSHKeyMove.exe
    scp -r ./SSHPK/id_rsa.pub %user%@%server%:.
    echo Your file have been sent to your home.
    timeout /t 10
    goto :main

:SCP

    cls
    echo       SSH Login pannel 
    echo .                                                                                                                                                                            
    set scp=
    set /p scp=Download or Upload?(r to go back):
        if '%scp%'=='Download' goto :dscp
        if '%scp%'=='download' goto :dscp
        if '%scp%'=='Upload' goto :uscp
        if '%scp%'=='upload' goto :uscp
        if '%scp%'=='r' goto :main
        if '%scp%'=='R' goto :main
    goto:SCP

:dscp 
    cls
    echo       SSH Login pannel 
    echo .            
    set dscp=
    set /p dscp=The path of what you want to download:
    cls
    scp -r %user%@%server%:%dscp% ./%download%
    color 0%colorz%
    echo All files have been successfully downloaded
    echo Press enter to return
    pause>nul
    color %colours%
    goto :main

:uscp 
    cls
    echo       SSH Login pannel 
    echo .            
    set rpath=
    set /p rpath= Set the remote path for the upload (nothing will upload it in your home ):
        if '%rpath%'=='' goto :error03
        if '%rpath%'=='r' goto :main
    scp -r ./%upload% %user%@%server%:.
    goto :main

:refresh
    start "" "refresh.exe"
    exit
:Reset
    del /f config.txt
    echo #IP of the remote server >> config.txt
    echo server=X.XXX.XX.XXX>> config.txt
    echo _>> config.txt
    echo #User >> config.txt
    echo user=IMASUPERSER>> config.txt
    echo _>> config.txt
    echo #Personalized name of the upload folder >> config.txt
    echo upload=upload>> config.txt
    echo _>> config.txt
    echo #Personalized name of the download folder (or the path) >> config.txt
    echo download=download>> config.txt
    echo _>> config.txt
    echo #Personalize the color of the script: >> config.txt
    echo colour=Blue>> config.txt
    echo _>> config.txt
    echo #Personalize the color when download is successful: >> config.txt
    echo colors=Green>> config.txt
    goto :configchecking

::Error list
    :error01
    cls
    echo Please enter a value or abort to abort 
    TIMEOUT /T 4 /nobreak>nul
    goto :nerror02



    :error02
    cls
    echo Please enter a value or r to return
    TIMEOUT /T 4 /nobreak>nul
    goto :nerror02

    :error03
    echo Please enter a value or r to return
    TIMEOUT /T 4 /nobreak>nul
    cls
    goto :uscp