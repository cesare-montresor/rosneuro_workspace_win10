

REM Install choco ( gracefully fail if fail, not a problem)
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

REM Install GIT
choco upgrade git -y

REM Change installation dir for the package manager (choco)
mkdir c:\opt\chocolatey
set ChocolateyInstall=c:\opt\chocolatey

REM Add choco repository for microsoft-ros
choco source add -n=ros-win -s="https://aka.ms/ros/public" --priority=1


REM Install your favourite ROS version
REM Full-desktop it's adviced as best hope-for-deps 
REM
REM WARNING: during this command windows may "force restart" ( 1 time for desktop-full )
REM After reboot, reopen roscmd.lnk as admin and restart the command.
REM 
choco upgrade ros-melodic-desktop_full -y --execution-timeout=0
