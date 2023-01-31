cmake_minimum_required(VERSION 3.16)

SET(LIB_LIST projectname.h
             authority.h
             filename/filename.h
             filename/filename.cpp    )
             
ADD_LIBRARY(projectname_static STATIC ${LIB_LIST} )
SET_TARGET_PROPERTIES(projectname_static PROPERTIES 
                      OUTPUT_NAME "projectname"
                      CLEAN_DIRECT_OUPUT 1)
                      
ADD_LIBRARY(projectname_shared SHARED ${LIB_LIST} )
SET_TARGET_PROPERTIES(projectname_shared PROPERTIES 
                      OUTPUT_NAME "projectname"
                      CLEAN_DIRECT_OUPUT 1)
                      
INSTALL(FILES projectname.h DESTINATION include/projectname/)
INSTALL(FILES authority.h DESTINATION include/projectname/)
#INSTALL(FILES filename/filename.h DESTINATION include/projectname/)
#INSTALL(FILES filename/filename.cpp DESTINATION include/projectname/)


INSTALL(TARGETS projectname_static projectname_shared 
        LIBRARY DESTINATION lib/projectname/
        ARCHIVE DESTINATION lib/projectname/ )                      
