


@[TOC](文章目录)

---



# 1.文件树和CMakeLists.txt一览
- 文件树

```powershell
xu736946693@ubuntu:~/Desktop/CMake-template$ tree  -L 3
.
├── cmake
│   ├── ProjectXXConfig.cmake.in
│   └── ProjectXXConfigVersion.cmake.in
├── CMakeLists.txt
├── doc
│   └── READMEimgRes
│       └── 8836961877de48e1ada55af7810b1457.png
├── lib
│   ├── authority.h
│   ├── Module1
│   │   ├── filename.cpp
│   │   └── filename.h
│   └── projectname.h
├── LICENSE
├── main.cpp
├── README.md
├── run.sh
└── settings.zip
```

- 工程目录下的CMakeLists.txt

```txt
cmake_minimum_required(VERSION 3.16)

PROJECT(projectname)

set(CMAKE_CXX_STANDARD 17)
ADD_SUBDIRECTORY(src bin)
```
- 根目录下的CMakeLists.txt

```txt
cmake_minimum_required(VERSION 3.16)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 17)
# 设置库的名称
set(LIB_NAME ProjectXX)
set(STATIC_LIB ${LIB_NAME}_static)
# 设置可执行文件的名字
PROJECT(${LIB_NAME}_exe)
#设置版本
set(version 1.0)
# 拼接名字
set(LIB_NAME_VERSION ${LIB_NAME}-${version})
#设置安装位置，将头文件和库都安装到这个文章
set(CMAKE_INSTALL_PREFIX /usr/local)

# 依赖的外部库
#find_package(OpenCV REQUIRED)

# 自己的库依赖的头文件
include_directories(
        ${CMAKE_CURRENT_SOURCE_DIR}
        ${CMAKE_CURRENT_BINARY_DIR}
        lib
        lib/Module1
        # 以下为外部依赖
        #        ${OpenCV_INCLUDE_DIRS}
)

file(GLOB_RECURSE source
        lib/*.h
        lib/*.hpp
        lib/*.cpp
        lib/Module1/*
        )

# ----------------- 可执行文件 -----------------
# 可执行文件生成
add_executable(${PROJECT_NAME}   main.cpp)
# 设置可执行文件的依赖
#target_link_libraries(${PROJECT_NAME}
#        # 以下为外部依赖
#        ${OpenCV_LIBS}
#        )
# ----------------- 结束可执行文件的生成 -----------------


# ----------------- 安装（不需要修改） -----------------
# 安装源码文件
install(FILES ${source}
        DESTINATION ${CMAKE_INSTALL_PREFIX}/include/${LIB_NAME_VERSION}
        )

# 安装可执行文件
install(TARGETS ${PROJECT_NAME}
        DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/${LIB_NAME_VERSION}
        EXPORT ${LIB_NAME_VERSION}-targets
        )
install(EXPORT ${LIB_NAME_VERSION}-targets
        DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/${LIB_NAME_VERSION}
        )
# ----------------- 结束安装 -----------------

# ----------------- 生成 CMake 配置文件（不需要修改） -----------------
# 生成 CMake 配置文件
include(CMakePackageConfigHelpers)
configure_package_config_file(
        ${CMAKE_CURRENT_SOURCE_DIR}/cmake/${LIB_NAME}Config.cmake.in
        ${CMAKE_CURRENT_BINARY_DIR}/${LIB_NAME}Config.cmake
        INSTALL_DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/${LIB_NAME_VERSION}
)

configure_package_config_file(
        ${CMAKE_CURRENT_SOURCE_DIR}/cmake/${LIB_NAME}ConfigVersion.cmake.in
        ${CMAKE_CURRENT_BINARY_DIR}/${LIB_NAME}ConfigVersion.cmake
        INSTALL_DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/${LIB_NAME_VERSION}
)

# 安装 CMake 配置文件
install(FILES
        ${CMAKE_CURRENT_BINARY_DIR}/${LIB_NAME}Config.cmake
        ${CMAKE_CURRENT_BINARY_DIR}/${LIB_NAME}ConfigVersion.cmake
        DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/${LIB_NAME_VERSION}
        )
# ----------------- 结束生成 CMake 配置文件 -----------------
```

## 1.1 语法基本规则

 - **变量在使用时加${}，但在IF控制语句中不加（基本也用不到）**
 - **参数与参数之间用 " ; " 或者 "    " 分隔**
 - **指令不区分大小写，参数和变量区分大小写**

## 1.2 文件目录讲解

- cmake-build-debug目录：用来执行编译和安装
- cmake目录：用来CMakeLists.txt的配置文件
- doc目录：用来存放说明文档
- lib目录：用来存放库文件
- LICENSE文件：用来存放版权信息
- main.cpp：用来存放程序的入口
- README.md：用来存放基本项目说明
- run.sh：一键调用的脚本文件
- settings.zip：用来存放一些配置文件

# 2.基本指令讲解
## 2.1 CMAKE_MINIMUM_REQUIRED(VERSION XXX)
指定最低版本要求

## 2.2 PROJECT(projectname)
参数一：生成工程的名字

可选参数二：使用的编程语言。可以不指定编程语言，自动识别(recommended)

## 2.3 SET(CMAKE_CXX_STANDARD 17)
设置C++标准

## 2.4 ADD_SUBDIRECTORY(src bin)
在./src/目录下寻找并链接下一个CMakeLists.txt，然后**在编译目录下，即cmake-build-debug目录下**生成一个bin目录，并且在bin目录下执行下一个CMakeLists.txt里面的语句

参数一：下一个CMakeLists.txt的目录

可选参数二：为下一个CMakeLists.txt创建一个目录去执行
## 2.5 INCLUDE_DIRECTORIES(lib/)
添加头文件搜索的路径`./lib`

 - **在Linux系统中，默认的头文件搜索路径是/usr/include和/usr/local/include**

## 2.6 ADD_EXECUTABLE(main main.cpp)

将main.cpp文件生成可执行文件

参数一：生成的可执行文件的名字

参数二：含main函数的文件名或者变量

 - **INCLUDE_DIRECTORIES指令要放在ADD_EXECUTABLE的前面**
 - **TARGET_LINK_LIBRARIES指令要放在ADD_EXECUTABLE的后面**

## 2.7 TARGET_LINK_LIBRARIES(参数一;参数二)

链接某个库到可执行文件

参数一：可执行文件名，一般是main

参数二：库文件的路径

 - **在Linux系统中，默认的库文件搜索路径是/usr/lib**
## 2.8 SET()
```cpp
SET(LIB_LIST projectname.h
             authority.h
             filename/filename.h
             filename/filename.cpp    )
```

将projectname.h、authority.h、filename/filename.h、filename/filename.cpp 这四个文件定义为变量LIB_LIST

参数一：要定义的变量名

参数二：要定义的东西

## 2.9 FIND_PACKAGE()

在使用OpenCV库时，常常使用此指令来找到OpenCV的包

```cpp
FIND_PACKAGE(OpenCV REQUIRED)
```

#  3.构建和安装同名静态库和动态库
## 3.1 静态库和动态库的区别
 - 静态库拓展名为" .a "  和 " .lib " ，动态库拓展名为" .so "  和 " .dll "
 - 静态库在编译时会整合到目标可执行文件中，生成的可执行文件可以独立运行
 - 动态库在编译时不会整合到目标可执行文件中，生成的可执行文件不可以独立运行

## 3.2 构建指令

### 3.2.1 ADD_LIBRARY

```cpp
ADD_LIBRARY(projectname_static STATIC ${LIB_LIST} )
ADD_LIBRARY(projectname_shared SHARED ${LIB_LIST} )
```
将变量LIB_LIST生成静态库文件libprojectname_static.so

将变量LIB_LIST生成动态态库文件libprojectname_shared.h

参数一：生成的库文件名

参数二：静态库(STATIC)或动态库(SHARED)

参数三：源代码文件或变量

 - **在CMake的机制中，以上两条指令被认为是构建了同名的库，如果不进行属性设置，那么在编译时会自动进行覆盖**
### 3.2.2 SET_TARGET_PROPERTIES

```cpp
SET_TARGET_PROPERTIES(projectname_static PROPERTIES 
                      OUTPUT_NAME "projectname"
                      CLEAN_DIRECT_OUTPUT 1)
SET_TARGET_PROPERTIES(projectname_shared PROPERTIES 
                      OUTPUT_NAME "projectname"
                      CLEAN_DIRECT_OUTPUT 1)
```
将两个库文件名都重命名为 " projectname "，并且指定输出时不清除同名文件

参数一：输出文件的名字

参数二：PROPERTIES，表示设置属性

参数OUTPUT_NAME：重命名

参数CLEAN_DIRECT_OUTPUT：输出形式

 - 除此之外，还有很多参数可以选择
## 3.3 安装指令
### 3.3.1 INSTALL()

```cpp
INSTALL(FILES projectname.h DESTINATION include/projectname/)
INSTALL(FILES authority.h DESTINATION include/projectname/)
INSTALL(TARGETS projectname_static projectname_shared 
        LIBRARY DESTINATION lib/projectname/
        ARCHIVE DESTINATION lib/projectname/ )  
```

将文件projectname.h、authority.h、projectname_static、projectname_shared安装到指定位置

参数一：要安装的文件类型

参数二：要安装的文件名字

参数DESTINATION：安装路径

参数LIBRARY DESTINATION：静态库安装路径

参数ARCHIVE DESTINATION：动态库安装路径

### 3.3.2 安装文件类型与关键字对应关系
|关键字  | 文件类型 |   
|-----|-----|
| TARGETS | 库文件、头文件 |   
| FILES | 一般文件 |   
| PROGRAMS | 脚本文件 |
| DIRECTORY | 文本文件 |

