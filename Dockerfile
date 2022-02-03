FROM python:3.8

WORKDIR /app

RUN apt update; apt install --yes vim
RUN pip install eth-brownie

RUN brownie networks add Waterfall waterfall-test host=https://rpc.waterfall.network/rpc chainid=333777333

COPY web3.brownie.patch /usr/local/lib/python3.8/site-packages/brownie/network/web3.patch
RUN cd /usr/local/lib/python3.8/site-packages/brownie/network ; patch -u web3.py -i web3.patch ; cd -

COPY acc.json acc.json
