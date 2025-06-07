#! /bin/bash

check_jmeter() {
	if command -v javac &> /dev/null; then
		echo 1
	else
		echo 0
	fi
}

check_java() {
	if command -v jmeter &> /dev/null; then
		echo 1
	else
		echo 0
	fi
}

check_mvn() {
	if command -v mvn &> /dev/null; then
		echo 1
	else
		echo 0
	fi
}


main() {

	check_java=$(check_java)
	check_jmeter=$(jmeter)
	check_maven=$(check_mvn)
	
	if [ "${check_java}" == "0" ]; then
		exit 1
	fi
	
	echo "JAVA OK"
	
	if [ "${check_jmeter}" == "0" ]; then
		exit 1
	fi
	
	echo "JMETER OK"
	
	if [ "${check_maven}" == "0" ]; then
		exit 1
	fi
	
	echo "MAVEN OK"

}


main





