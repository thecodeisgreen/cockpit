FROM agentejo/cockpit:0.11.0

WORKDIR /var/www/html

COPY config.yaml config/config.yaml
COPY config.php config/config.php

COPY ./addons/Lokalize ./addons/Lokalize/.
COPY ./addons/CockpitQL ./addons/CockpitQL/.
