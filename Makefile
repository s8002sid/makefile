PROJECT=main
TARGET_EXTENSION=
PROJECT_FLAGS=
BASE_DIR=.
PROJECT_FLAGS=
.PHONY: all

DEP_PROJECT=vector my_string
all:

include project.mak

all: ${OUTPUT_DIR} ${DEP_PROJECT} ${OUTPUT_DIR}/${PROJECT}${EXTENSION}
