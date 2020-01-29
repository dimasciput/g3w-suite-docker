FROM g3wsuite/g3w-suite
MAINTAINER Walter Lorenzetti<lorenzetti@gis3w.it>

ADD local_settings.py g3w-admin/base/settings/local_settings.py
ADD entrypoint.sh /usr/src/g3w-suite/entrypoint.sh
ADD base.py /usr/src/g3w-suite/g3w-admin/base/settings/base.py
RUN  chmod +x /usr/src/g3w-suite/entrypoint.sh


