FROM lanterndata/lantern:latest

RUN apt-get update && apt-get install -y wget make

RUN wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4_amd64.deb && \
    dpkg -i libssl1.1_1.1.0g-2ubuntu4_amd64.deb

RUN wget https://github.com/lanterndata/lantern_extras/releases/download/0.0.3/lantern-extras-0.0.3.tar && \
    tar xvf lantern-extras-0.0.3.tar

RUN wget https://github.com/microsoft/onnxruntime/releases/download/v1.16.1/onnxruntime-linux-x64-1.16.1.tgz && \
    tar xvf onnxruntime-linux-x64-1.16.1.tgz

RUN cp -r onnxruntime-linux-x64-1.16.1 /usr/local/lib/onnxruntime

ENV ORT_STRATEGY=system
ENV ORT_DYLIB_PATH=/usr/local/lib/onnxruntime/lib/libonnxruntime.so

RUN cd lantern-extras-0.0.3 && make install
