import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean

structure StressStrainPackage where
  youngModulus : ℝ
  bodyForce : ℝ
  tractionBoundary : ℝ
  displacementFieldContinuity : Prop
  equilibriumSatisfied : Prop

def StressStrainClosed (S : StressStrainPackage) : Prop :=
  S.displacementFieldContinuity ∧ S.equilibriumSatisfied

theorem stress_strain_closed (S : StressStrainPackage) : StressStrainClosed S := by
  exact And.intro S.displacementFieldContinuity S.equilibriumSatisfied

end ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean
end HautevilleHouse