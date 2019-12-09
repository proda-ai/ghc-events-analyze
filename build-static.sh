#!/bin/bash

docker build . -t musl-ghc
docker run -v $PWD:/outp -t musl-ghc cp dist-newstyle/build/x86_64-linux/ghc-8.4.3/ghc-events-analyze-0.2.5/x/ghc-events-analyze/build/ghc-events-analyze/ghc-events-analyze /outp/
