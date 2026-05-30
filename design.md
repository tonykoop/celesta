<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Celesta Design Study

## Design Thesis

The celesta is a keyboard instrument, but the sound source is a set of struck
steel bars over resonators. The design problem sits between piano action,
glockenspiel-like bar behavior, resonator coupling, and damping. A serious
packet must treat those interfaces as setup variables instead of pretending the
keyboard alone defines the instrument.

## Mechanism Overview

A key moves an action that throws a felt hammer toward a steel bar. The hammer
must strike and rebound cleanly so it excites the bar without muting it. The bar
is suspended at support points that preserve vibration while keeping the bar
stable under repeated impact. Below the bar, a resonator box reinforces the
sound. A damper controls sustain and release when the key is lifted.

This L1 packet does not choose final bar geometry, pitch range, resonator
volume, hammer mass, felt hardness, key count, or action ratio. Those values
need measured or reviewed authority before a build packet can advance.

## Subsystems

### Keyboard And Action

- The keyboard should provide repeatable hammer motion without excessive noise
  or lost motion.
- Candidate actions can borrow from piano-style principles, but the final
  linkage must be scaled to the bar, hammer, and damper behavior.
- Key return, escapement or rebound behavior, hammer checking, and regulation
  are unresolved.
- Action geometry is pending measurement and should not be copied from a
  drawing without review.

### Felt Hammers

- Hammer felt hardness, contact shape, rebound behavior, and wear are primary
  tone variables.
- The hammer should excite the bar without staying in contact long enough to
  choke the sound.
- Strike position is a future setup parameter, not a released location in this
  L1 packet.
- A first prototype should compare hammer coverings and rebound behavior before
  scaling to a full keyboard.

### Steel Bars

- The steel bars are the primary sound generators.
- Bar material, graduation, undercutting or profiling, suspension points, and
  tuning workflow require measurement.
- Bar tuning is intentionally not specified here.
- Future design work should separate raw bar blank preparation from final
  tuning and voicing.

### Resonator Boxes

- Each resonator must be matched to the bar behavior through measurement or
  reviewed acoustic modeling.
- Box material, volume, opening, placement, and coupling are unresolved.
- Resonators must be accessible enough for inspection and adjustment during
  prototype work.
- No resonator dimensions or tuning values are claimed here.

### Dampers

- Dampers need enough control to stop notes cleanly without dulling attack.
- Damper material, placement, lift timing, and key-release behavior are open.
- The damper system must work with hammer rebound and bar sustain, not fight
  them.
- Release noise should be treated as a validation item.

### Frame And Service Access

- The frame must hold the keyboard, bars, resonators, dampers, and action in
  alignment while allowing regulation and tuning access.
- Service access matters because bars, hammers, dampers, and resonators all
  need adjustment during prototype work.
- Transport stability, dust protection, and cover design are future questions.

## Parametric Intent

Future work should name parameters before assigning values:

- `estimate_key_count_pending_measurement`
- `estimate_bar_count_pending_measurement`
- `estimate_bar_material_pending_measurement`
- `estimate_bar_support_point_pending_measurement`
- `estimate_hammer_mass_pending_measurement`
- `estimate_hammer_felt_hardness_pending_measurement`
- `estimate_resonator_volume_pending_measurement`
- `estimate_damper_lift_pending_measurement`
- `estimate_action_ratio_pending_measurement`

These names are placeholders only. They are not dimensions, tuning values, or
performance targets.

## First Measurement Gates

- Hammer test: verify clean strike and rebound against a single trial bar.
- Bar test: measure sustain, decay, and tuning response before designing a full
  graduated set.
- Suspension test: confirm that supports hold the bar without choking it.
- Resonator test: compare bar sound with and without a trial resonator.
- Damper test: verify clean stop without excessive release noise.
- Action test: confirm repeatable key feel and hammer travel on a small
  mechanism before scaling.
- Service test: confirm bars, hammers, dampers, and resonators are reachable for
  regulation.

## L1 Boundary

This design study is a concept map. It does not define a scale, tuning system,
bar geometry, resonator geometry, action drawing, CAD model, DXF, or fabrication
release.

