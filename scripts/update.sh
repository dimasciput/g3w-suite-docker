#!/bin/bash
su - postgres -c "createdb template_postgis -E UTF8 -T template0"