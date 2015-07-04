##External variables
PROJECT=my_string
TARGET_EXTENSION=a
PROJECT_FLAGS=
BASE_DIR=..

#Internal Variables
DOT=
ifneq "${TARGET_EXTENSION}" ""
	DOT=.
endif

all:

include ${BASE_DIR}/project.mak

all: ${OUTPUT_DIR} ${OUTPUT_DIR}/lib${PROJECT}${DOT}${TARGET_EXTENSION}
