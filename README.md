This repository it's an attemp to provide a starting point for anyone wanting to setup a ROSNeuro on Windows.
     
# Install    

## 1. Setup ROS Env     
Setup the ROS env on windows following the official instructions. It's easy for Kinetic, Melodic and Noetic.      
_note: at the time of writing, I personally tested it on Melodic only._     
http://wiki.ros.org/Installation/Windows._    

**WARNING:**    
`Install.bat` is **an attempt** to automate setup, it **might** perform the correct actions.    
It's adviced to open, read and **run the commands manually** (copy-paste-run lines one by one).   
_Note: For the installation process cmd.exe requires to be **Run As Administrator**._      
_Note: Install.bat DOES NOT attempt to install Visual Studio Community, that is still a manual step._    


## 2. git clone ( --recurse-submodules ! )    
```
git clone --recurse-submodules https://github.com/cesare-montresor/rosneuro_workspace_win10.git
```    

## 3. roscmd & catkin_make
Now you need to open a ros console using **roscmd.lnk** and build using **catkin_make**.
You can refer the the Use section below for each part individually.



# Use
     
## roscmd.lnk
In order to obtain a properly **configured ROS console**:
1. Start a terminal using `roscmd.lnk` 
2. Manually source devel/
```
cd catkin_ws/devel
setup.bat
```

## roscmd.lnk as Admin
**Run As Administrator** to install deps/lib/packets to the opt/ environment.
1. Start a terminal using `roscmd.lnk` using: Right Click -> **Run As Administrator**
2. The cmd.exe spawn in c:\Windows\System32\.
   Navigate back to rosneuro_workspace_win10/ root folder via command line
3. Manually source devel/
```
cd catkin_ws/devel
setup.bat
```
4. Admin powers    
Move to c:\opt\ros\x64\<YOUR-DISTRO>\ to access the local ros setup.    
Available package managers:    

```
choco [search|install|...] package_name    
vcpkg [search|install|...] cpp_lib   
```


## catkin_make

 

# Code portability issues:

## C2131 - C3863
*\roswin10\catkin_ws\src\rosneuro_data\src\test_neurodata_tools.cpp(46): error C2131: expression did not evaluate to a constant*
https://stackoverflow.com/questions/33423502/expression-did-not-evaluate-to-a-constant-c

### SOLOUTON
from: 
```
int32_t tritmp[tri.size()];
```
to:
```
int32_t* tritmp = new int32_t[tri.size()];  
...
free(tritmp);
```


## LNK2019 - LNK1120 
https://docs.microsoft.com/it-it/cpp/error-messages/tool-errors/linker-tools-error-lnk2019?view=msvc-160

Creating library C:\Users\Cesare\Projects\roswin10\catkin_ws\devel\lib\rosneuro_acquisition.lib and object C:\Users\Cesare\Projects\roswin10\catkin_ws\devel\lib\rosneuro_acquisition.exp

acquisition.cpp.obj : error LNK2019: unresolved external symbol "public: __cdecl rosneuro::Acquisition::Acquisition(void)" (??0Acquisition@rosneuro@@QEAA@XZ) referenced in function main
acquisition.cpp.obj : error LNK2019: unresolved external symbol "public: virtual __cdecl rosneuro::Acquisition::~Acquisition(void)" (??1Acquisition@rosneuro@@UEAA@XZ) referenced in function main
acquisition.cpp.obj : error LNK2019: unresolved external symbol "public: bool __cdecl rosneuro::Acquisition::Run(void)" (?Run@Acquisition@rosneuro@@QEAA_NXZ) referenced in function main

C:\Users\Cesare\Projects\roswin10\catkin_ws\devel\bin\rosneuro_acquisition.dll : fatal error LNK1120: 3 unresolved externals
### SOLUTION
Linux file system is case-sensitive, Windows file system is case-**in**sensitive. 
In **rosneuro_acquisition** 2 files where overlapping:
```
catkin_ws\src\rosneuro_acquisition\src\Acquisition.hpp
catkin_ws\src\rosneuro_acquisition\src\acquisition.hpp
```

The solution have been to rename `acquisition.hpp` into `main.hpp` ( and the CMakeList.txt accordingly )

## liblsl, libeedgev

As the package **rosneuro_acquisition_plugins** is intended to be just a container, all the plugins with external dependencies have been removed, for now.
Creating a new **win10** git branch and/or tag seams the cleanset way to switch between plugins-sets with ease.

# TODOs:
- Find a better way to bootstrap roscmd (ex: to soruce correctly also devel/setup.bat).
- Add Branch/Tag for for **win10** plugins.
