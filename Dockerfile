FROM ubuntu:16.04

RUN apt-get update -y
RUN apt-get install -y git gcc g++ cmake intltool xsltproc libgtk-3-dev libxml2-utils libxml2-dev liblensfun-dev librsvg2-dev libsqlite3-dev libcurl4-gnutls-dev libjpeg-dev libtiff5-dev liblcms2-dev libjson-glib-dev libexiv2-dev libpugixml-dev python3-pkg-resources libgphoto2-dev libsoup2.4-dev libopenexr-dev libwebp-dev libflickcurl-dev libopenjpeg-dev libsecret-1-dev libgraphicsmagick1-dev libcolord-dev libcolord-gtk-dev libcups2-dev libsdl1.2-dev libsdl-image1.2-dev libgl1-mesa-dev libosmgpsmap-1.0-dev libopenjp2-7-dev python3-jsonschema libopenjp2-7-dev default-jdk gnome-doc-utils libsaxon-java fop imagemagick docbook-xml docbook-xsl

WORKDIR /build
RUN git clone https://github.com/darktable-org/darktable.git
WORKDIR ./darktable
ARG version=2.3.0
RUN git checkout release-$version
RUN git submodule update --init --recursive

RUN ./build.sh --prefix /opt/darktable --build-type Release
RUN cmake --build "/build/darktable/build" --target install -- -j8

WORKDIR ./build
RUN make darktable-usermanual

CMD /opt/darktable/bin/darktable
