cmake_minimum_required(VERSION 2.8.9)

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

# Find includes in corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# Instruct CMake to run moc automatically when needed.
set(CMAKE_AUTOMOC ON)

find_package(BBMultimedia REQUIRED)
find_package(BBCascades REQUIRED)

include_directories(
    ${QT_INCLUDES}
    ${CMAKE_CURRENT_BINARY_DIR} 
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${BBMULTIMEDIA_INCLUDE_DIR}
    ${BBCASCADES_INCLUDE_DIR}
)

set(MrdangaPlayer_SRCS
    main.cpp
)

# QT4_ADD_RESOURCES(MrdangaPlayer_RCC_SRCS
#     mrdangaplayer.qrc
# )

add_executable(mrdangaplayer ${MrdangaPlayer_SRCS} ${MrdangaPlayer_RCC_SRCS})

target_link_libraries(
    mrdangaplayer

    ${QT_QTCORE_LIBRARY}
    ${BBMULTIMEDIA_LIBRARY}
    ${BBCASCADES_LIBRARY}
)
