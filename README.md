<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Celesta

Status: L2 V5 build-packet candidate

This repository is a V5 L2 build-packet candidate for a celesta: a keyboard idiophone
where piano-style keys drive felt hammers into graduated steel bars suspended
above resonator boxes, with dampers controlling sustain and release.

This packet is not a build-ready plan. It contains no released dimensions, no
tuning table, no bar lengths, no resonator sizes, no hammer weights, no action
geometry, no DXF coordinates, no CAD geometry, and no fabrication instructions.
All physical claims are concept-only or pending measurement.

## Packet Map

- `design.md` - mechanism study, subsystem interfaces, and measurement gates.
- `bom.csv` - estimated part classes and unresolved procurement decisions.
- `cut-list.csv` - planned coupon and fixture classes with all dimensions
  blocked pending measurement.
- `decision-record.md` - decisions, assumptions, and open questions.
- `visual-output-register.csv` - V5 authority register with concept-only and
  pending-measurement rows only.
- `cad/mcp-session-log.md` - QMD Step 0 and tool provenance.

## Mechanism Summary

- A keyboard action transfers finger motion into felt-hammer strikes.
- Each hammer strikes a tuned steel bar rather than a string.
- Each bar is suspended so its vibration is not choked by the support points.
- A wooden box resonator beneath each bar reinforces the tone.
- Dampers control sustain and stop notes after release.
- Bar tuning, resonator matching, hammer hardness, action travel, and damping
  all need measured prototype work before any construction release.

## L2 Review Boundary

L2 means this repo names the packet surfaces and measurement gates needed before
a celesta prototype can be specified. Promotion to L3 requires measured bar
coupon data, reviewed hammer/action mule behavior, resonator comparison data,
damper release evidence, and CAD or drawing authority for every fabricated
part.
