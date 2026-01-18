# Jersey Met Radar Animator

## Overview

This project automates the capture, processing, archiving, and animation of publicly available Jersey Met Office radar images.

It produces:
- Near-real-time animated radar loops
- Rolling 24-hour historical radar animations
- Deterministic, cron-safe outputs suitable for unattended operation

The system is designed as a structured data and process pipeline rather than a single script.

---

## Problem Statement

Public weather radar data is typically provided as a small number of static images with limited retention and no usable animation history. This makes it difficult to understand weather evolution, analyse storms retrospectively, or communicate conditions clearly.

This project treats radar imagery as a time-series dataset and applies disciplined automation to create reliable, repeatable visual outputs.

---

## Key Features

- Separate pipelines for live radar and 24-hour archive builds
- Change detection to avoid unnecessary rendering
- Rolling archive with configurable retention window
- FFmpeg-based interpolation for smooth animation
- Optional SCP publishing
- YAML-driven configuration
- Safe local operation with publishing disabled

---

## Architecture

Radar Images (HTTP)
→ Frame Download
→ Change Detection
→ Frame Storage
→ Optional Archive
→ Frame Normalisation
→ FFmpeg Animation
→ MP4 Output
→ Optional Publish

---

## Requirements

System:
- Linux (native or WSL)
- Python 3.10+
- FFmpeg available on PATH

Python packages:
- requests
- PyYAML

---

## Installation

Clone the repository:

git clone https://github.com/Yamlulz/jersey-met-radar.git
cd jersey-met-radar

Create and activate a virtual environment:

python3 -m venv .venv
source .venv/bin/activate

Install dependencies:

pip install -r requirements.txt

Install FFmpeg if required:

sudo apt update
sudo apt install -y ffmpeg

---

## Configuration

Copy the example configuration:

cp config.example.yaml config.yaml

Edit config.yaml to define:
- Base data source URL
- Radar frame prefixes and counts
- Output paths
- FPS and interpolation behaviour
- Archive retention window
- Optional publishing targets

Publishing is disabled by default.

---

## Usage

Live radar pipeline:

python3 scripts/met_animator.py --config config.yaml radar-live

Force rebuild:

python3 scripts/met_animator.py --config config.yaml --force radar-live

24-hour archive pipeline:

python3 scripts/met_animator.py --config config.yaml radar-archive-24h

Force rebuild:

python3 scripts/met_animator.py --config config.yaml --force radar-archive-24h

---

## Cron Example

*/2 * * * * cd /path/to/jersey-met-radar && source .venv/bin/activate && python3 scripts/met_animator.py --config config.yaml radar-live
*/5 * * * * cd /path/to/jersey-met-radar && source .venv/bin/activate && python3 scripts/met_animator.py --config config.yaml radar-archive-24h

---

## Logs

Each pipeline writes structured logs describing:
- What ran
- What changed
- Why a rebuild occurred or was skipped

---

## Example Media

Example MP4 outputs captured during Storm Goretti (Jersey) are included to demonstrate both live evolution and historical replay.

---

## Intended Purpose

This project demonstrates:
- Process-led automation
- Data pipeline thinking
- Deterministic scheduling
- Operational robustness

The same patterns apply directly to compliance, CMDB, regulatory reporting, and monitoring workflows.

---

## License

MIT License
