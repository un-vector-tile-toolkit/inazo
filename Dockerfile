FROM unvt/rasv:latest

WORKDIR /root
RUN git clone https://github.com/optgeo/geojsons-euroglobalmap &&\
  git clone https://github.com/hfu/openmaptiles-fonts &&\
  git clone https://github.com/mapbox/mapbox-gl-js &&\
  cd mapbox-gl-js &&\
  npm install &&\
  npm run build-prod-min &&\
  npm run build-css &&\
  cd .. &&\
  git clone https://github.com/un-vector-tile-toolkit/inazo-produce &&\
  cd inazo-produce &&\
  yarn &&\
  cd .. &&\
  git clone https://github.com/un-vector-tile-toolkit/inazo-host &&\
  cd inazo-host &&\
  yarn &&\
  cd ..

