set(SQLite3_FIND_QUIETLY TRUE)

find_package(SQLite3 CONFIG REQUIRED)

boost_external_report(SQLite3 INCLUDE_DIR LIBRARIES)
