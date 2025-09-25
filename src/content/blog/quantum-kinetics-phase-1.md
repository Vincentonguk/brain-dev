---
title: "Quantum Kinetics — Phase 1"
description: "Sensor plan, signal acquisition, and safety guardrails."
pubDate: "2025-09-25"
tags: ["sensors","prototype","ethics"]
---

## Goal
Build a **kinetic-sensor prototype** to validate signal acquisition and session establishment for BrainDev.

## Hardware (v0)
- IMU/accelerometer + microcontroller (Arduino/ESP32)  
- Sampling ≥ 200 Hz; timestamped; buffered  
- USB/Serial bridge for PC ingestion

## Pipeline
1. Device handshake → session token seed  
2. Raw stream → filtering (band-pass + notch)  
3. Feature extraction (RMS, spectral bands, peaks)  
4. Session key derivation (presence + liveness)  
5. Persist encrypted samples for offline analysis

## Safety
- Local-only by default; opt-in cloud sync  
- Consent screen + session logs  
- Data minimization & revocation

© 2025 Vinicios Ongaratto — Intellectual Property.
