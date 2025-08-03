# WyzeSense2MQTT Addon

This Home Assistant addon runs the `raetha/wyzesense2mqtt` Docker image to bridge WyzeSense devices to MQTT.

## Features

- Uses official `raetha/wyzesense2mqtt:devel` Docker image
- Supports configuring MQTT connection via addon options
- Exposes `/dev/hidraw0` USB device to container
- Supports MQTT discovery for Home Assistant

## Configuration Options

| Option             | Description                          | Default          |
|--------------------|------------------------------------|------------------|
| mqtt_host          | MQTT broker hostname or IP          | core-mosquitto   |
| mqtt_port          | MQTT broker port                    | 1883             |
| mqtt_username      | MQTT username                      | (empty)          |
| mqtt_password      | MQTT password                      | (empty)          |
| mqtt_client_id     | MQTT client ID                    | wyzesense2mqtt   |
| mqtt_clean_session | Clean session flag (true/false)    | false            |
| mqtt_keepalive     | MQTT keepalive seconds              | 60               |
| mqtt_qos           | MQTT QoS level (0, 1, 2)           | 2                |
| mqtt_retain        | MQTT retain flag (true/false)      | true             |
| self_topic_root    | MQTT topic root                    | wyzesense2mqtt   |
| hass_topic_root    | MQTT Home Assistant topic root    | homeassistant    |
| hass_discovery     | Enable Home Assistant discovery    | true             |
| publish_sensor_name| Publish sensor names                | true             |
| usb_dongle        | USB dongle device (e.g., auto)      | auto             |

## Installation

Add this repository URL in Supervisor Add-on Store → Repositories, then install the addon.

---

## 3. Verify your `config.json`

Make sure your `config.json` matches the one you shared earlier (looks good).

---

## 4. How to add your GitHub repo in Home Assistant

- Go to **Supervisor → Add-on Store → Repositories**
- Paste `https://github.com/jfarmer08/home-assistant-addons`
- Click **Add**
- Wait a minute, your `wyzesense2mqtt` addon should appear in the Add-on Store.

---

## 5. Troubleshooting

- If your addon doesn’t appear, try restarting Home Assistant Supervisor.
- Double-check your folder structure and file names (case sensitive).
- Check Supervisor logs for errors.

---

If you want, I can help you:

- Validate your repo structure and files
- Write a full sample `README.md` you can copy/paste
- Provide step-by-step install instructions
- Troubleshoot errors you encounter

Just let me know!
