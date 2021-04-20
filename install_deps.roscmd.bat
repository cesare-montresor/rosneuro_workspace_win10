REM "TO BE USED FROM WITHIN" roscmd

REM Install external dependencies via Vcpkg.
REM liblsl for acquisiiton_plugin ( maybe easier without vcpkg )
Vcpkg install liblsl 
REM TODO: see if libeegdev can compile ( main maintainer: debian ) 

REM Add favorite tools to opt/choco (ex: git)
choco install git -y
