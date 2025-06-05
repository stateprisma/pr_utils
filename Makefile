ALIRE := alr
TEST_DIR := tests


.PHONY: build

clean:
	rm -r alire config lib obj tests/{alire,config,bin,obj}

build:
	alr build

test: build
	cd $(TEST_DIR) && alr run

