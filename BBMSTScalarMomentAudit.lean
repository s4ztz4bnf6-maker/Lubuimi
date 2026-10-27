import BBMSTScalarMoment

/-!
Explicit build root for the scalar moment interface. CI must compile this
module, which imports the actual theorem module and asks Lean to print the
transitive axioms of the key weighted result.
-/

#check BBMSTScalarMoment.removedFraction_bounds
#check BBMSTScalarMoment.weighted_removedFraction_sum_min
#print axioms BBMSTScalarMoment.removedFraction_bounds
#print axioms BBMSTScalarMoment.weighted_removedFraction_sum_min
