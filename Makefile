
init:
	./docker/init.sh

build:
	./docker/build.sh

test:
	./docker/test_local.sh

gas:
	./docker/gas_report.sh

test_rpc:
	./docker/test.sh

all:
	echo "init"
	echo "build"
	echo "test"
	echo "gas"
	echo "test_rpc"


