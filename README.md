# Install 

There is an Install.bat with a list of commands that need to be run in the terminal. 
At this stage of development one cannot install.



# code portability issues:

## C2131 - C3863
*\roswin10\catkin_ws\src\rosneuro_data\src\test_neurodata_tools.cpp(46): error C2131: expression did not evaluate to a constant*
https://stackoverflow.com/questions/33423502/expression-did-not-evaluate-to-a-constant-c

FIX
from: 
int32_t tritmp[tri.size()];

to:
int32_t* tritmp = new int32_t[tri.size()];  
...
free(tritmp);



## LNK2019 - LNK1120 
https://docs.microsoft.com/it-it/cpp/error-messages/tool-errors/linker-tools-error-lnk2019?view=msvc-160

Creating library C:\Users\Cesare\Projects\roswin10\catkin_ws\devel\lib\rosneuro_acquisition.lib and object C:\Users\Cesare\Projects\roswin10\catkin_ws\devel\lib\rosneuro_acquisition.exp

acquisition.cpp.obj : error LNK2019: unresolved external symbol "public: __cdecl rosneuro::Acquisition::Acquisition(void)" (??0Acquisition@rosneuro@@QEAA@XZ) referenced in function main
acquisition.cpp.obj : error LNK2019: unresolved external symbol "public: virtual __cdecl rosneuro::Acquisition::~Acquisition(void)" (??1Acquisition@rosneuro@@UEAA@XZ) referenced in function main
acquisition.cpp.obj : error LNK2019: unresolved external symbol "public: bool __cdecl rosneuro::Acquisition::Run(void)" (?Run@Acquisition@rosneuro@@QEAA_NXZ) referenced in function main

C:\Users\Cesare\Projects\roswin10\catkin_ws\devel\bin\rosneuro_acquisition.dll : fatal error LNK1120: 3 unresolved externals
