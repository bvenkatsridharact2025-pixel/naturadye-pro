# naturadye-pro
Software module for NaturaDye Pro — recipe generation, batch scaling, and dye quality scoring for natural dye standardization. FastAPI + React.
NaturaDye Pro is a software system for standardizing natural dye preparation
and quality control at cooperative dyeing facilities. It replaces
trial-and-error dyeing with structured recipes, batch scaling, and
sensor-based quality scoring.

Features:
- Smart Recipe Generator — auto-generates dye recipes (material ratio,
  mordant type/quantity, temperature, extraction time) based on dye source,
  fabric type, and desired shade
- Recipe Scaling — scales any recipe from a small test batch up to
  production volumes (500g / 5kg / 50kg)
- Batch Quality Scoring — evaluates pigment strength, pH, temperature, and
  turbidity against calibrated targets, returning a quality score and
  specific corrective recommendations
- Designed to pair with a portable hardware analyzer (ESP32 + color,
  turbidity, pH, and temperature sensors) for real-time quality checks —
  the API is built to accept sensor readings from either manual entry or
  the hardware device directly

Tech stack: FastAPI + SQLite (backend), React + Vite (frontend)
