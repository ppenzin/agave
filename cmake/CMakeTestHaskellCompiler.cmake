# CMakeTest(LANG)Compiler.cmake -> test the compiler and set:
#     SET(CMAKE_(LANG)_COMPILER_WORKS 1 CACHE INTERNAL "")

include (CMakeTestCompilerCommon)

if (NOT CMAKE_Haskell_COMPILER_WORKS)
  PrintTestCompilerStatus ("Haskell" "")
  file (WRITE ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeTmp/testHaskellCompiler.hs "main = return ()")
  try_compile (CMAKE_Haskell_COMPILER_WORKS ${CMAKE_BINARY_DIR}
    ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeTmp/testHaskellCompiler.hs
    OUTPUT_VARIABLE __CMAKE_Haskell_COMPILER_OUTPUT
  )
endif (NOT CMAKE_Haskell_COMPILER_WORKS)

if (NOT CMAKE_Haskell_COMPILER_WORKS)
  PrintTestCompilerStatus ("Haskell" " -- error")
  file (APPEND ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeError.log
    "Test Haskell compilation failed with:"
    "\n${__CMAKE_Haskell_COMPILER_OUTPUT}\n\n")
  message (FATAL_ERROR "Haskell compiler \"${CMAKE_Haskell_COMPILER}\" "
    "faled to compile a simple test program.")
else ()
  PrintTestCompilerStatus ("Haskell" " -- works")
  file (APPEND ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeOutput.log
    "Test Haskell compilation succeeded")
endif (NOT CMAKE_Haskell_COMPILER_WORKS)
