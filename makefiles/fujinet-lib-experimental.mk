FUJINET_LIB_EXP_VERSION := 1.0.0

FUJINET_LIB_EXP = $(CACHE_DIR)/fujinet-lib-experimental
FUJINET_LIB_EXP_VERSION_DIR = $(FUJINET_LIB_EXP)/$(FUJINET_LIB_EXP_VERSION)-$(CURRENT_TARGET)
FUJINET_LIB_EXP_PATH = $(FUJINET_LIB_EXP_VERSION_DIR)/fujinet-$(CURRENT_TARGET)-$(FUJINET_LIB_EXP_VERSION).lib

FUJINET_LIB_EXP_REPO_URL = https://github.com/FozzTexx/fujinet-lib-experimental.git

.get_fujinet_lib_exp:
	@if [ ! -d $(FUJINET_LIB_EXP_VERSION_DIR) ]; then \
		git clone $(FUJINET_LIB_EXP_REPO_URL) $(FUJINET_LIB_EXP_VERSION_DIR); \
		echo "Building project in $(FUJINET_LIB_EXP_VERSION_DIR)..."; \
		cd $(FUJINET_LIB_EXP_VERSION_DIR) && make $(CURRENT_TARGET); \
		cp $(FUJINET_LIB_EXP_VERSION_DIR)/r2r/$(CURRENT_TARGET)/fujinet.$(CURRENT_TARGET).lib $(FUJINET_LIB_EXP_PATH); \
		echo $(FUJINET_LIB_EXP_VERSION) > src/version.txt; \
	else \
		echo "A directory already exists with version $(FUJINET_LIB_EXP_VERSION) - please remove it first"; \
	fi

#FUJINET_LIB_EXP_PATH_DOWNLOAD_URL = https://github.com/FujiNetWIFI/fujinet-lib/releases/download/v$(FUJINET_LIB_EXP_VERSION)/fujinet-lib-$(CURRENT_TARGET)-$(FUJINET_LIB_EXP_VERSION).zip
#FUJINET_LIB_EXP_PATH_DOWNLOAD_FILE = $(FUJINET_LIB_EXP)/fujinet-lib-$(CURRENT_TARGET)-$(FUJINET_LIB_EXP_VERSION).zip

# .get_fujinet_lib:
# 	@if [ ! -f "$(FUJINET_LIB_EXP_PATH_DOWNLOAD_FILE)" ]; then \
# 		if [ -d "$(FUJINET_LIB_EXP_VERSION_DIR)" ]; then \
# 		  echo "A directory already exists with version $(FUJINET_LIB_EXP_VERSION) - please remove it first"; \
# 			exit 1; \
# 		fi; \
# 		HTTPSTATUS=$$(curl -Is $(FUJINET_LIB_EXP_PATH_DOWNLOAD_URL) | head -n 1 | awk '{print $$2}'); \
# 		if [ "$${HTTPSTATUS}" == "404" ]; then \
# 			echo "ERROR: Unable to find file $(FUJINET_LIB_EXP_PATH_DOWNLOAD_URL)"; \
# 			exit 1; \
# 		fi; \
# 		echo "Downloading fujinet-lib for $(CURRENT_TARGET) version $(FUJINET_LIB_EXP_VERSION) from $(FUJINET_LIB_EXP_PATH_DOWNLOAD_URL)"; \
# 		mkdir -p $(FUJINET_LIB_EXP); \
# 		curl -sL $(FUJINET_LIB_EXP_PATH_DOWNLOAD_URL) -o $(FUJINET_LIB_EXP_PATH_DOWNLOAD_FILE); \
# 		echo "Unzipping to $(FUJINET_LIB_EXP)"; \
# 		unzip -o $(FUJINET_LIB_EXP_PATH_DOWNLOAD_FILE) -d $(FUJINET_LIB_EXP_VERSION_DIR); \
# 		if [ "$(CURRENT_TARGET)" == "apple2gs" ]; then \
# 		  iix chtyp -t lib $(FUJINET_LIB_EXP_VERSION_DIR)/fujinet-apple2gs-$(FUJINET_LIB_EXP_VERSION).lib; \
# 		fi; \
# 		echo "Unzip complete."; \
# 	fi

ifeq ($(CC),iix compile)
CFLAGS += $(INCC_ARG)$(FUJINET_LIB_EXP_VERSION_DIR)
ASFLAGS += $(INCS_ARG)$(FUJINET_LIB_EXP_VERSION_DIR)
else
CFLAGS += $(INCC_ARG) $(FUJINET_LIB_EXP_VERSION_DIR)
ASFLAGS += $(INCS_ARG) $(FUJINET_LIB_EXP_VERSION_DIR)
endif

LIBS += $(FUJINET_LIB_EXP_PATH)
ALL_TASKS += .get_fujinet_lib