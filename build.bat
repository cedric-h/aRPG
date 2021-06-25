@echo off

IF "%_called_vcvars_%" EQU "" (
    set _called_vcvars_=yes
    call "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvars64.bat"
    popd
)

set application_name=app
set compile_flags= -nologo /Zi /FC /I ../source/
set common_link_flags= -opt:ref -incremental:no /Debug:fastlink
set platform_link_flags= %common_link_flags%

if not exist build mkdir build
pushd build

"../sokol/shdc/win32/sokol-shdc.exe" --input ../shaders.glsl --output shaders.glsl.h --slang hlsl5
"cl.exe" %compile_flags% ../main.c /link %platform_link_flags% /out:%application_name%.exe
popd
