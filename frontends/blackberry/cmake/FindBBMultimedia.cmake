# - Try to find BBMultimedia
# Once done this will define
#
#  BBMULTIMEDIA_FOUND - system has BBMultimedia
#  BBMULTIMEDIA_INCLUDE_DIRS - the BBMultimedia include directory
#  BBMULTIMEDIA_LIBRARIES - Link these to use BBMultimedia
#
#  Copyright (c) 2013 Laszlo Papp <lpapp@kde.org>
#
#  Redistribution and use is allowed according to the terms of the New
#  BSD license.
#  For details see the accompanying COPYING-CMAKE-SCRIPTS file.
#

if (BBMultimedia_FIND_REQUIRED)
    set(_bbMultimediaReq "REQUIRED")
endif (BBMultimedia_FIND_REQUIRED)

find_package(BBSystem ${_bbMultimediaReq})

find_path(BBMULTIMEDIA_INCLUDE_DIR Global.hpp
  HINTS
  ENV BBMULTIMEDIADIR
  PATH_SUFFIXES include include/bb include/bb/multimedia
  PATHS
  ~/Library/Frameworks
  /Library/Frameworks
  /opt/local
  /opt
  ${QNX_TARGET}/usr
)

find_library(BBMULTIMEDIA_LIBRARY
  NAMES BBMultimedia bbmultimedia
  HINTS
  ENV BBMULTIMEDIADIR
  PATH_SUFFIXES lib64 lib libs64 libs libs/Win32 libs/Win64
  PATHS
  ~/Library/Frameworks
  /Library/Frameworks
  /opt/local
  /opt
  ${QNX_TARGET}/armv7/usr
  ${QNX_TARGET}/armle-v7/usr
)


# handle the QUIETLY and REQUIRED arguments and set BBMULTIMEDIA_FOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(BBMultimedia DEFAULT_MSG BBMULTIMEDIA_LIBRARY BBMULTIMEDIA_INCLUDE_DIR)

mark_as_advanced(BBMULTIMEDIA_LIBRARY BBMULTIMEDIA_INCLUDE_DIR)
