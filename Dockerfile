FROM agentejo/cockpit

COPY config.yaml config/config.yaml
COPY ./addons/Lokalize ./addons/Lokalize/.
COPY ./addons/CockpitQL ./addons/CockpitQL/.
