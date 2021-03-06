# Install script for directory: /Users/ginrou799/Development/iphone/BlendingCamera/opencv/modules

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/install")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "Release")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/androidcamera/.androidcamera/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/calib3d/.calib3d/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/contrib/.contrib/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/core/.core/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/features2d/.features2d/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/flann/.flann/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/gpu/.gpu/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/highgui/.highgui/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/imgproc/.imgproc/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/java/.java/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/legacy/.legacy/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/ml/.ml/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/nonfree/.nonfree/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/objdetect/.objdetect/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/ocl/.ocl/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/photo/.photo/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/python/.python/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/stitching/.stitching/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/ts/.ts/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/video/.video/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/videostab/.videostab/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/world/.world/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/core/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/imgproc/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/flann/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/highgui/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/features2d/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/calib3d/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/ml/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/video/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/objdetect/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/contrib/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/legacy/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/nonfree/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/photo/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/stitching/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/videostab/cmake_install.cmake")
  INCLUDE("/Users/ginrou799/Development/iphone/BlendingCamera/ios/build/iPhoneOS/modules/world/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

