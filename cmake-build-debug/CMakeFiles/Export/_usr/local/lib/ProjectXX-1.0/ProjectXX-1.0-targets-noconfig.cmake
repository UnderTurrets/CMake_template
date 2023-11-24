#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ProjectXX::ProjectXX" for configuration ""
set_property(TARGET ProjectXX::ProjectXX APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(ProjectXX::ProjectXX PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "CXX"
  IMPORTED_LOCATION_NOCONFIG "/usr/local/lib/ProjectXX-1.0/libProjectXX.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS ProjectXX::ProjectXX )
list(APPEND _IMPORT_CHECK_FILES_FOR_ProjectXX::ProjectXX "/usr/local/lib/ProjectXX-1.0/libProjectXX.a" )

# Import target "ProjectXX::ProjectXX_exe" for configuration ""
set_property(TARGET ProjectXX::ProjectXX_exe APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(ProjectXX::ProjectXX_exe PROPERTIES
  IMPORTED_LOCATION_NOCONFIG "/usr/local/bin/ProjectXX-1.0/ProjectXX_exe"
  )

list(APPEND _IMPORT_CHECK_TARGETS ProjectXX::ProjectXX_exe )
list(APPEND _IMPORT_CHECK_FILES_FOR_ProjectXX::ProjectXX_exe "/usr/local/bin/ProjectXX-1.0/ProjectXX_exe" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
