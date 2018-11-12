# CMakeDetermine(LANG)Compiler.cmake -> this should find the compiler for LANG and configure CMake(LANG)Compiler.cmake.in

# TODO use?
set(CMAKE_Haskell_COMPILER_ENV_VAR "HC")

if (NOT CMAKE_Haskell_COMPILER)
  if ($ENV{${CMAKE_Haskell_COMPILER_ENV_VAR}} MATCHES ".+")
    get_filename_component (CMAKE_Haskell_COMPILER_LIST $ENV{${CMAKE_Haskell_COMPILER_ENV_VAR}} PROGRAM PROGRAM_ARGS CMAKE_Haskell_FLAGS)
    if (NOT EXISTS ${CMAKE_Haskell_COMPILER_LIST})
      message (FATAL_ERROR "Unknown Haskell compiler $ENV{${CMAKE_Haskell_COMPILER_ENV_VAR}}")
    endif ()
  else ()
    set(CMAKE_Haskell_COMPILER_LIST ghc hugs)
  endif ($ENV{${CMAKE_Haskell_COMPILER_ENV_VAR}} MATCHES ".+")

  find_program (CMAKE_Haskell_COMPILER NAMES ${CMAKE_Haskell_COMPILER_LIST})

  set(CMAKE_Haskell_COMPILER CACHE FILEPATH "Haskell Compiler")
endif (NOT CMAKE_Haskell_COMPILER)

# Build yourself a CMakeHaskellCompiler.cmake
configure_file (${CMAKE_CURRENT_LIST_DIR}/CMakeHaskellCompiler.cmake.in
  ${CMAKE_PLATFORM_INFO_DIR}/CMakeHaskellCompiler.cmake
)

