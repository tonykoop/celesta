(* Celesta parametric acoustic model.
   All physical values below are estimates only and are not fabrication authority. *)

ClearAll["Global`*"];

celestaMetadata = <|
   "instrument" -> "Celesta",
   "packet" -> "Round 8 Wolfram build-packet model",
   "modelName" -> "Parametric struck steel bar, hammer impulse, and resonator estimate model",
   "authority" -> "reference_only",
   "calibrationStatus" -> "uncalibrated estimates; pending measurement"
   |>;

barLengthEstimate = 0.18; (* estimate — pending measurement, not fabrication authority *)
barWidthEstimate = 0.025; (* estimate — pending measurement, not fabrication authority *)
barThicknessEstimate = 0.006; (* estimate — pending measurement, not fabrication authority *)
barDensityEstimate = 7850.; (* estimate — pending measurement, not fabrication authority *)
barYoungsModulusEstimate = 200.0*^9; (* estimate — pending measurement, not fabrication authority *)
supportCouplingFactorEstimate = 0.96; (* estimate — pending measurement, not fabrication authority *)
hammerMassEstimate = 0.012; (* estimate — pending measurement, not fabrication authority *)
hammerVelocityEstimate = 1.2; (* estimate — pending measurement, not fabrication authority *)
hammerContactEfficiencyEstimate = 0.35; (* estimate — pending measurement, not fabrication authority *)
resonatorVolumeEstimate = 0.0012; (* estimate — pending measurement, not fabrication authority *)
resonatorOpeningAreaEstimate = 0.00025; (* estimate — pending measurement, not fabrication authority *)
resonatorEffectiveNeckLengthEstimate = 0.018; (* estimate — pending measurement, not fabrication authority *)
speedOfSoundEstimate = 343.; (* estimate — pending measurement, not fabrication authority *)

barLengthMinimumEstimate = 0.08; (* estimate — pending measurement, not fabrication authority *)
barLengthMaximumEstimate = 0.36; (* estimate — pending measurement, not fabrication authority *)
barWidthMinimumEstimate = 0.012; (* estimate — pending measurement, not fabrication authority *)
barWidthMaximumEstimate = 0.05; (* estimate — pending measurement, not fabrication authority *)
barThicknessMinimumEstimate = 0.003; (* estimate — pending measurement, not fabrication authority *)
barThicknessMaximumEstimate = 0.015; (* estimate — pending measurement, not fabrication authority *)
barDensityMinimumEstimate = 6500.; (* estimate — pending measurement, not fabrication authority *)
barDensityMaximumEstimate = 9000.; (* estimate — pending measurement, not fabrication authority *)
barYoungsModulusMinimumEstimate = 120.0*^9; (* estimate — pending measurement, not fabrication authority *)
barYoungsModulusMaximumEstimate = 230.0*^9; (* estimate — pending measurement, not fabrication authority *)
hammerMassMinimumEstimate = 0.002; (* estimate — pending measurement, not fabrication authority *)
hammerMassMaximumEstimate = 0.04; (* estimate — pending measurement, not fabrication authority *)
hammerVelocityMinimumEstimate = 0.2; (* estimate — pending measurement, not fabrication authority *)
hammerVelocityMaximumEstimate = 3.0; (* estimate — pending measurement, not fabrication authority *)
resonatorVolumeMinimumEstimate = 0.0002; (* estimate — pending measurement, not fabrication authority *)
resonatorVolumeMaximumEstimate = 0.006; (* estimate — pending measurement, not fabrication authority *)
resonatorOpeningAreaMinimumEstimate = 0.00005; (* estimate — pending measurement, not fabrication authority *)
resonatorOpeningAreaMaximumEstimate = 0.0012; (* estimate — pending measurement, not fabrication authority *)
resonatorNeckLengthMinimumEstimate = 0.005; (* estimate — pending measurement, not fabrication authority *)
resonatorNeckLengthMaximumEstimate = 0.06; (* estimate — pending measurement, not fabrication authority *)

betaFreeFreeMode1Estimate = 4.730040744862704; (* estimate — pending measurement, not fabrication authority *)
betaFreeFreeMode2Estimate = 7.853204624095838; (* estimate — pending measurement, not fabrication authority *)
betaFreeFreeMode3Estimate = 10.995607838001671; (* estimate — pending measurement, not fabrication authority *)

barArea[width_, thickness_] := width*thickness;
barSecondMoment[width_, thickness_] := width*thickness^3/12;

freeFreeBarModeFrequencyHz[length_, width_, thickness_, density_,
   youngsModulus_, beta_, supportFactor_] :=
  Module[{area, secondMoment},
   area = barArea[width, thickness];
   secondMoment = barSecondMoment[width, thickness];
   supportFactor*(beta^2/(2*Pi*length^2))*
    Sqrt[(youngsModulus*secondMoment)/(density*area)]
   ];

hammerImpulseEnergyEstimate[mass_, velocity_, efficiency_] :=
  efficiency*(mass*velocity^2)/2;

helmholtzResonatorFrequencyHz[speed_, openingArea_, volume_, neckLength_] :=
  (speed/(2*Pi))*Sqrt[openingArea/(volume*neckLength)];

celestaModeTable[length_, width_, thickness_, density_, youngsModulus_,
   supportFactor_] :=
  Dataset[
   (<|"mode" -> #[[1]], "betaEstimate" -> #[[2]],
       "barFrequencyHzEstimate" -> #[[3]]|> &) /@ {
     {"first bending", betaFreeFreeMode1Estimate,
      freeFreeBarModeFrequencyHz[length, width, thickness, density,
       youngsModulus, betaFreeFreeMode1Estimate, supportFactor]},
     {"second bending", betaFreeFreeMode2Estimate,
      freeFreeBarModeFrequencyHz[length, width, thickness, density,
       youngsModulus, betaFreeFreeMode2Estimate, supportFactor]},
     {"third bending", betaFreeFreeMode3Estimate,
      freeFreeBarModeFrequencyHz[length, width, thickness, density,
       youngsModulus, betaFreeFreeMode3Estimate, supportFactor]}
     }
   ];

celestaNominalEstimate = <|
   "barModes" ->
    celestaModeTable[barLengthEstimate, barWidthEstimate,
     barThicknessEstimate, barDensityEstimate, barYoungsModulusEstimate,
     supportCouplingFactorEstimate],
   "hammerImpulseEnergyEstimate" ->
    hammerImpulseEnergyEstimate[hammerMassEstimate, hammerVelocityEstimate,
     hammerContactEfficiencyEstimate],
   "resonatorFrequencyHzEstimate" ->
    helmholtzResonatorFrequencyHz[speedOfSoundEstimate,
     resonatorOpeningAreaEstimate, resonatorVolumeEstimate,
     resonatorEffectiveNeckLengthEstimate]
   |>;

celestaExplorer =
  Manipulate[
   Column[{
     Style["Celesta struck-bar estimate model", 14, Bold],
     "All inputs are placeholders pending measurement; this model is reference_only.",
     celestaModeTable[lengthMeters, widthMeters, thicknessMeters,
      densityKgPerM3, youngsModulusPa, supportFactor],
     <|"hammerImpulseEnergyEstimate" ->
       hammerImpulseEnergyEstimate[hammerMassKg, hammerVelocityMetersPerSecond,
        hammerEfficiency],
      "resonatorFrequencyHzEstimate" ->
       helmholtzResonatorFrequencyHz[speedOfSoundEstimate, openingAreaM2,
        volumeM3, neckLengthMeters]|>,
     Plot[
      freeFreeBarModeFrequencyHz[length, widthMeters, thicknessMeters,
       densityKgPerM3, youngsModulusPa, betaFreeFreeMode1Estimate,
       supportFactor],
      {length, barLengthMinimumEstimate, barLengthMaximumEstimate},
      AxesLabel -> {"bar length estimate (m)",
        "first bending Hz estimate"},
      PlotRange -> All]
     }],
   {{lengthMeters, barLengthEstimate, "bar length estimate (m)"},
    barLengthMinimumEstimate, barLengthMaximumEstimate},
   {{widthMeters, barWidthEstimate, "bar width estimate (m)"},
    barWidthMinimumEstimate, barWidthMaximumEstimate},
   {{thicknessMeters, barThicknessEstimate, "bar thickness estimate (m)"},
    barThicknessMinimumEstimate, barThicknessMaximumEstimate},
   {{densityKgPerM3, barDensityEstimate,
     "bar density estimate (kg/m^3)"}, barDensityMinimumEstimate,
    barDensityMaximumEstimate},
   {{youngsModulusPa, barYoungsModulusEstimate,
     "Young modulus estimate (Pa)"}, barYoungsModulusMinimumEstimate,
    barYoungsModulusMaximumEstimate},
   {{supportFactor, supportCouplingFactorEstimate,
     "support coupling factor estimate"}, 0.70, 1.05},
   {{hammerMassKg, hammerMassEstimate, "hammer mass estimate (kg)"},
    hammerMassMinimumEstimate, hammerMassMaximumEstimate},
   {{hammerVelocityMetersPerSecond, hammerVelocityEstimate,
     "hammer velocity estimate (m/s)"}, hammerVelocityMinimumEstimate,
    hammerVelocityMaximumEstimate},
   {{hammerEfficiency, hammerContactEfficiencyEstimate,
     "hammer contact efficiency estimate"}, 0.05, 0.85},
   {{volumeM3, resonatorVolumeEstimate, "resonator volume estimate (m^3)"},
    resonatorVolumeMinimumEstimate, resonatorVolumeMaximumEstimate},
   {{openingAreaM2, resonatorOpeningAreaEstimate,
     "resonator opening area estimate (m^2)"},
    resonatorOpeningAreaMinimumEstimate, resonatorOpeningAreaMaximumEstimate},
   {{neckLengthMeters, resonatorEffectiveNeckLengthEstimate,
     "resonator effective neck length estimate (m)"},
    resonatorNeckLengthMinimumEstimate, resonatorNeckLengthMaximumEstimate},
   SaveDefinitions -> True
   ];

celestaModel = <|
   "metadata" -> celestaMetadata,
   "nominalEstimate" -> celestaNominalEstimate,
   "explorer" -> celestaExplorer
   |>;

celestaModel
