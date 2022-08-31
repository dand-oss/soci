
# find boost
#Set(Boost_DEBUG ON)
if(NOT BOOST_ROOT)
  set(BOOST_ROOT $ENV{BOOST_ROOT} CACHE PATH "Boost Root Directory")
endif(NOT BOOST_ROOT)
set(Boost_NO_SYSTEM_PATHS ON)
if(USE_STATIC_BOOST)
    # static boost on windows add "lib" prefix
    # thus can coexist with dll version
    set(Boost_USE_STATIC_LIBS ON)
else()
    set(Boost_USE_STATIC_LIBS OFF)
    add_definitions("-DBOOST_ALL_DYN_LINK")
endif()
set(Boost_USE_MULTITHREADED ON)
# turn on __declspec(dllimport) modifiers
# Find boost in "module" mode, not CONFIG mode - not BoostConfig.cmake
find_package(Boost 1.80.0 EXACT REQUIRED COMPONENTS
    date_time
    )


set(Boost_RELEASE_VERSION
  "${Boost_MAJOR_VERSION}.${Boost_MINOR_VERSION}.${Boost_SUBMINOR_VERSION}")

boost_external_report(Boost RELEASE_VERSION INCLUDE_DIR LIBRARIES)
