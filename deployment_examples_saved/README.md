Run Example:

To start Grouepr UI from a previously built image and tail logs:
./runme-ui.sh && podman logs -f grouper_ui


To stop and remove container (in most cases you always want this):
podman stop grouper_ui && podman rm grouper_ui

