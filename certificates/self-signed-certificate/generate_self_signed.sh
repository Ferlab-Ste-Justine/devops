#Inspired by: https://github.com/kelseyhightower/kubernetes-the-hard-way/blob/master/docs/04-certificate-authority.md

if [ ! -f ca.pem ]; then
    docker run --rm \
               -v $(pwd):/opt \
               magnitus/cfssl:latest \
               /bin/bash -c "cfssl gencert -initca ca-csr.json | cfssljson -bare ca";

else
    echo "CA certificate already exists. It will not be re-generated. Please delete it manually if you wish to do so.";
fi

if [ -f server.pem ]; then
    rm server-key.pem && rm server.pem && rm server.csr;
    echo "Previous certificate deleted";
fi

docker run --rm \
            -v $(pwd):/opt \
            magnitus/cfssl:latest \
            /bin/bash -c "\
            cfssl gencert \
            -ca=ca.pem \
            -ca-key=ca-key.pem \
            -config=ca-config.json \
            -profile=clin \
            server-csr.json | cfssljson -bare server";

cp server-key.pem ../privkey.pem;
cp server.pem ../fullchain.pem;
