PORT?=/dev/ttyACM0
SKETCH?=imeon_bridge_104_rw.ino

prepare:
	arduino-cli core update-index
	arduino-cli core install esp32:esp32
	arduino-cli lib install SimpleSyslog
	arduino-cli lib install ModbusMaster
	arduino-cli config init ||:
	arduino-cli config set library.enable_unsafe_install true
	arduino-cli lib install --git-url https://github.com/emelianov/modbus-esp8266.git
	ln -s $(sketch) ImeonModbusRtuTcpBridge.ino

build:
	arduino-cli compile --fqbn esp32:esp32:esp32c3

flash:
	arduino-cli upload --fqbn esp32:esp32:esp32c3 --port $(PORT)

