
##External variables
#PROJECT=<project name>
#TARGET_EXTENSION
#PROJECT_FLAGS=<any extra flags>
#OBJDIR=<objdir>
#OUTPUT_DIR=<outputdir>
#EXPORTMAP_FILE

CFLAGS=-std=c++11

##Derived Variables
DIRs+= ${OBJDIR}
CFLAGS+= ${PROJECT_FLAGS}
GPP=g++
SRCs=$(wildcard *.cpp)
OBJs=$(patsubst %.cpp,${OBJDIR}/%.o,${SRCs})
DEPs=$(patsubst %.cpp,${OBJDIR}/%.d,${SRCs})
EXPORTMAP_FILE=exportmap
OBJDIR=${BASE_DIR}/objs
OUTPUT_DIR=${BASE_DIR}/output
DIRs+= ${OBJDIR} ${OUTPUT_DIR}
ARFLAGS=rcv
AR=ar
LDFLAGS=

REQ_SOs=

##Check Conditions
ifeq "${TARGET_EXTENSION}" "so"
CFLAGS += -fPIC
LDFLAGS+=-shared -Wl,-soname,lib${PROJECT}.so
endif

ifeq "${MAKECMDGOALS}" "debug"
	CFLAGS+= -g
endif

ifneq "${EXPORTMAP_FILE}" ""
#CFLAGS += -Wl,--version-script=${EXPORTMAP_FILE} 
endif

ifneq "${DEP_PROJECT}" ""
	CFLAGS+= $(patsubst %,-I%,${DEP_PROJECT})
	LDFLAGS += -L./${OUTPUT_DIR}
	LDFLAGS += $(patsubst %,-l%,${DEP_PROJECT})
endif

##Generic make conditions
${OUTPUT_DIR}/${PROJECT}: ${OBJs}
	${GPP} ${CFLAGS} -o $@ ${OBJs} ${LDFLAGS}
	@echo "******** Done Creating $@ ********"

${OUTPUT_DIR}/lib${PROJECT}.a: ${OBJs}
	${AR} ${ARFLAGS} ${LDFLAGS} -o $@ $^

${OUTPUT_DIR}/lib%.so: ${OBJs}
	${GPP} ${CFLAGS} ${LDFLAGS} -o $@ $^

${OBJDIR}/%.o: %.cpp
	${GPP} ${CFLAGS} -c -o $@ $^

${OBJDIR}/%.d: %.cpp ${OBJDIR}
	@${GPP} ${CFLAGS} -MM $< > $@

${DEP_PROJECT}: 
	@echo "******** Entering Project $@ ********"
	make -C "./$@" ${MAKECMDGOALS} MAKECMD="${MAKECMD}" INT_BASEDIR=${PWD}
	@echo "******** Leaving Project $@ ********"
${DIRs}: 
	mkdir -p $@

.PHONY: clean ${DEP_PROJECT}
clean:
	rm -rf ${OBJs} ${DEPs} ${OUTPUT_DIR}/${PROJECT}${TARGET_EXTENSION} ${OBJDIR} ${OUTPUT_DIR}/*.so ${OUTPUT_DIR}

##Including dependency file
ifneq "${MAKECMDGOALS}" "clean"
-include ${DEPs}
endif
