FROM unvt/rasv:latest

WORKDIR /root

RUN git clone https://github.com/optgeo/geojsons-euroglobalmap &&\
  git clone https://github.com/hfu/openmaptiles-fonts &&\
  git clone https://github.com/mapbox/mapbox-gl-js &&\
  git clone https://github.com/un-vector-tile-toolkit/inazo-produce &&\
  git clone https://github.com/un-vector-tile-toolkit/inazo-host

RUN apt-get update &&\
  apt-get install -y xserver-xorg-dev libxi-dev libxext-dev build-essential &&\
  # build all
  cd mapbox-gl-js &&\
  npm install &&\
  npm run build-prod-min &&\
  npm run build-css &&\
  cd .. &&\
  cd inazo-produce &&\
  yarn &&\
  cd .. &&\
  cd inazo-host &&\
  yarn &&\
  cd .. &&\
  # remove install packages
  apt-get -y remove xserver-xorg-dev libxi-dev libxext-dev build-essential &&\
  # remove additonal installed dev packages
  apt-get -y autoremove &&\
  rm -rf /var/lib/apt/lists/*
