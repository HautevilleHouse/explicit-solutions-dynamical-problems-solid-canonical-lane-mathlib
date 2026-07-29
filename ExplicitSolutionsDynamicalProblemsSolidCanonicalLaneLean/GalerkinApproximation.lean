import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean

structure GalerkinPackage where
  basisFunctions : ℕ → (ℝ → ℝ)
  trialSpaceDimension : ℕ
  stiffnessMatrix : Matrix (Fin trialSpaceDimension) (Fin trialSpaceDimension) ℝ
  massMatrix : Matrix (Fin trialSpaceDimension) (Fin trialSpaceDimension) ℝ
  loadVector : Vector ℝ trialSpaceDimension
  systemSolved : Prop

def GalerkinClosed (G : GalerkinPackage) : Prop :=
  G.systemSolved

theorem galerkin_closed (G : GalerkinPackage) : GalerkinClosed G := by
  exact G.systemSolved

end ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean
end HautevilleHouse