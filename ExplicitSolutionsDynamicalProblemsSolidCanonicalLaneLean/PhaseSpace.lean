import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean

structure PhaseSpace where
  pointType : Type u
  topology : TopologicalSpace pointType
  differentiableStructure : Prop
  symplecticForm : Option (pointType → pointType → ℝ)
  hamiltonianVectorFieldDefined : Prop

def PhaseSpaceClosed (P : PhaseSpace) : Prop :=
  P.differentiableStructure ∧ (P.symplecticForm.isSome → P.hamiltonianVectorFieldDefined)

end ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean
end HautevilleHouse
