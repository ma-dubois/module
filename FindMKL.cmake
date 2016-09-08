set(MKLPATHS $ENV{MKLROOT} $ENV{MKLROOT}/../ $ENV{MKLROOT}/../../ $ENV{MKL_PATH} $ENV{MKL_PATH}/../ $ENV{MKL_PATH}/../../ $ENV{CPATH} $ENV{C_INCLUDE_PATH} $ENV{CPLUS_INCLUDE_PATH} $ENV{OBJC_INCLUDE_PATH} $ENV{LIBRARY_PATH} $ENV{LD_LIBRARY_PATH})

file(TO_CMAKE_PATH "${MKLPATHS}" MKLPATHS)

set(MKLPATHS ${MKLPATHS} ${CMAKE_SOURCE_DIR}/_EXTERNAL/MKL)

set(MKLSUFFIXESLIB
	/intel64
	/intel32
	/lib
	/lib/intel64
)

set(MKLSUFFIXESINCLUDE
	/include
)

find_path(	MKL_INCLUDE_DIR mkl.h 
		PATHS ${MKLPATHS}
		PATH_SUFFIXES ${MKLSUFFIXESINCLUDE}
)




set(MKL_LIBRARY_1 "mkl_intel_lp64")
set(MKL_LIBRARY_2 "mkl_core")
set(MKL_LIBRARY_3 "mkl_gnu_thread")
set(MKL_LIBRARY_4 "pthread")
set(MKL_LIBRARY_5 "m")
set(MKL_LIBRARY_6 "dl")





#set(MKL_LIBRARY_1 "gfortran")
#set(MKL_LIBRARY_2 "pthread")
#set(MKL_LIBRARY_3 "m")

##set(MKL_LIBRARY_4 "/software6/compilers/intel/composer_xe_2013_sp1.0.080/compiler/lib/intel64/libiomp5.so")

#find_library(	MKL_LIBRARY_4 NAMES libmkl_gnu_thread.so libmkl_gnu_thread.dylib
#		PATHS ${MKLPATHS}
#		PATH_SUFFIXES ${MKLSUFFIXESLIB} 
#)


#find_library(	MKL_LIBRARY_5 NAMES libmkl_intel_lp64.so libmkl_intel_lp64.dylib
#		PATHS ${MKLPATHS}
#		PATH_SUFFIXES ${MKLSUFFIXESLIB} 
#)


#find_library(	MKL_LIBRARY_6 NAMES libmkl_core.so libmkl_core.dylib
#		PATHS ${MKLPATHS}
#		PATH_SUFFIXES ${MKLSUFFIXESLIB}
#)

#find_library(	MKL_LIBRARY_7 NAMES libmkl_intel_thread.so libmkl_intel_thread.dylib
#		PATHS ${MKLPATHS}
#		PATH_SUFFIXES ${MKLSUFFIXESLIB}
#)

set(MKL_LIBRARIES	${MKL_LIBRARY_1} ${MKL_LIBRARY_2} ${MKL_LIBRARY_3} ${MKL_LIBRARY_4} ${MKL_LIBRARY_5} ${MKL_LIBRARY_6})
set(MKL_INCLUDE_DIR	${MKL_INCLUDE_DIR})

find_package_handle_standard_args(MKL	DEFAULT_MSG	MKL_LIBRARIES	MKL_INCLUDE_DIR)

mark_as_advanced(MKL_INCLUDE_DIR	MKL_LIBRARIES)
