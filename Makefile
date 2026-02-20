JAVA   = java
JAVAC  = javac
OUT    = build
LIB    = lib

.PHONY: all run-server run-client build-server build-client build clean

all: build

install:
	@echo "External JARs required in $(LIB)/:"
	@echo "  - json-simple-1.1.1.jar  (https://github.com/fangyidong/json-simple)"
	@echo "  - jsoup-1.11.3.jar       (https://jsoup.org/)"
	@echo ""
	@echo "Download them and place in $(LIB)/ to compile from source."
	@mkdir -p $(LIB)

build-server: install
	@mkdir -p $(OUT)
	$(JAVAC) -cp "$(LIB)/*" -d $(OUT) LatoServer/*.java

build-client: install
	@mkdir -p $(OUT)
	$(JAVAC) -cp "$(LIB)/*" -d $(OUT) LatoClient/*.java

build: build-server build-client

run-server:
	$(JAVA) -jar eseguibili/server.jar

run-client:
	$(JAVA) -jar eseguibili/client.jar

clean:
	rm -rf $(OUT)
