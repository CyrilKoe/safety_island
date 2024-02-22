PULP_APP = omptarget_runtime
PULP_APP_FC_SRCS = sw_mailbox.c main.c

PULP_RUNTIME_GCC_TOOLCHAIN := /usr/pack/riscv-1.0-kgf/pulp-gcc-2.6.0

#ifneq ($(HERO_INSTALL), "")
#PULP_CC := $(HERO_INSTALL)/bin/clang
#PULP_AR := $(HERO_INSTALL)/bin/llvm-ar
#PULP_OBJDUMP := $(HERO_INSTALL)/bin/llvm-objdump
#PULP_ARCH_CFLAGS := -march=rv32ima -mabi=ilp32
#endif

include $(PULP_SDK_HOME)/install/rules/pulp_rt.mk

archive_app: $(PULP_APP_OBJS_omptarget_runtime)
	$(PULP_AR) rcs build/lib$(PULP_APP).a $(PULP_APP_OBJS_omptarget_runtime)
