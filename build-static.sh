#!/bin/bash

set -ex

rm -f ghc-events-analyze
rm -rf ./fonts/

docker build . -t musl-ghc
docker run -v $PWD:/outp -t musl-ghc sh -c 'cp dist-newstyle/build/x86_64-linux/ghc-8.4.3/ghc-events-analyze-0.2.5/x/ghc-events-analyze/build/ghc-events-analyze/ghc-events-analyze /outp/ && chmod o+rwx /outp/ghc-events-analyze' 
docker run -v $PWD:/outp -t musl-ghc sh -c 'mkdir -p /outp/fonts/share && cp -rvp /root/.cabal/store/ghc-8.4.3/SVGFonts-1.7.0.1-1227c5220f52d1568f166ac8ade7dcf302e864a57f99776fb9f58cad1ed6eef6/share /outp/fonts/share && chmod -R o+rwx /outp/fonts'

cp ghc-events-analyze ghc-events-analyze-orig
rm ghc-events-analyze
sed -e 's,/root/.cabal/store/ghc-8.4.3/SVGFonts-1.7.0.1-1227c5220f52d1568f166ac8ade7dcf302e864a57f99776fb9f58cad1ed6eef6,.////////////////////////////////////////////////////////////////////////////////////////////////////////fonts,g' ./ghc-events-analyze-orig >ghc-events-analyze
chmod +x ghc-events-analyze
tar Jcvf ghc-events-anayze.tar.xz ghc-events-analyze fonts
