        if exist %USERPROFILE%\.ssh\id_rsa.pub ( copy %USERPROFILE%\.ssh\id_rsa.pub "%~dp0SSHPK") else (
        echo nop
    )
