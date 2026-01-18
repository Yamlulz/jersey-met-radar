Jersey Met radar animator (demo)

Purpose
- Demonstrates an improved animated radar experience from a limited public image sequence.
- Designed so an operator can swap the input dataset and disable publishing.

What it does
- radar-live: downloads Radar01..Radar10 and Radarzoom01..Radarzoom10, builds two MP4 loops.
- radar-archive-24h: snapshots frames into a rolling archive and builds 24-hour MP4 loops.

Configuration
- Copy config.example.yaml to config.yaml and edit config.yaml.
- publish.enabled controls whether uploads occur. Default is disabled.

Requirements
- Python 3
- ffmpeg
- Python packages in requirements.txt

Run
- python3 scripts/met_animator.py radar-live --config config.yaml --force
- python3 scripts/met_animator.py radar-archive-24h --config config.yaml --force
