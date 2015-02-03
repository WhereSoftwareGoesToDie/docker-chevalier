# Sourced from anchor/chevalier:.travis.yml, edited for a docker ennvironment

apt-get install -y autoconf libtool automake build-essential libglib2.0-dev \
	libprotobuf-c0-dev protobuf-c-compiler protobuf-compiler

mkdir -p deps/
cd deps

# Do you want bright red errors for wget progress? Because `-q` is how you don't get bright red errors for progress
wget http://download.zeromq.org/zeromq-4.0.4.tar.gz -q
tar -xf zeromq-4.0.4.tar.gz
cd zeromq-4.0.4
./configure 
make
make install
su -c "echo '/usr/local/lib' > /etc/ld.so.conf.d/local.conf"
/sbin/ldconfig
cd ..

go get code.google.com/p/goprotobuf/{proto,protoc-gen-go}
