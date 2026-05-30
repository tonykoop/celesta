<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Celesta

Status: L1 concept packet

This repository is a V5 L1 concept packet for a celesta: a keyboard idiophone
where piano-style keys drive felt hammers into graduated steel bars suspended
above resonator boxes, with dampers controlling sustain and release.

This packet is not a build-ready plan. It contains no released dimensions, no
tuning table, no bar lengths, no resonator sizes, no hammer weights, no action
geometry, no DXF coordinates, no CAD geometry, and no fabrication instructions.
All physical claims are concept-only or pending measurement.

## Packet Map

- `design.md` - mechanism study, subsystem interfaces, and measurement gates.
- `bom.csv` - estimated part classes and unresolved procurement decisions.
- `decision-record.md` - decisions, assumptions, and open questions.
- `visual-output-register.csv` - V5 authority register; every row is
  `concept_only`.
- `cad/mcp-session-log.md` - QMD Step 0 and tool provenance.

## Mechanism Summary

- A keyboard action transfers finger motion into felt-hammer strikes.
- Each hammer strikes a tuned steel bar rather than a string.
- Each bar is suspended so its vibration is not choked by the support points.
- A wooden box resonator beneath each bar reinforces the tone.
- Dampers control sustain and stop notes after release.
- Bar tuning, resonator matching, hammer hardness, action travel, and damping
  all need measured prototype work before any construction release.

## Readiness Boundary

L1 means this repo captures concept intent, mechanism boundaries, and risk
structure only. Promotion to L2 requires reviewed parameter names, a measurement
plan, and a clear separation between future bar authority, resonator authority,
action authority, and any visual or CAD artifacts.

