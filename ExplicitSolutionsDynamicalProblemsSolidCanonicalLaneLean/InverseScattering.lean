import canonicalLaneMathlib.AdmissibleClass
import ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean.PhaseSpace
import ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean.LaxPair

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean

structure InverseScatteringPackage {P : PhaseSpace} {L : LaxPair P} where
  scatteringDataDefinition : Prop
  timeEvolutionScatteringData : Prop
  reconstructPotential : Prop
  solitonSolutionsExtracted : Prop

def InverseScatteringClosed {P : PhaseSpace} {L : LaxPair P} (I : InverseScatteringPackage P L) : Prop :=
  I.scatteringDataDefinition ∧ I.timeEvolutionScatteringData ∧ I.reconstructPotential ∧ I.solitonSolutionsExtracted

theorem inverse_scattering_closed_from_evidence {P : PhaseSpace} {L : LaxPair P} (I : InverseScatteringPackage P L) (scattering : I.scatteringDataDefinition) (evolution : I.timeEvolutionScatteringData) (reconstruct : I.reconstructPotential) (soliton : I.solitonSolutionsExtracted) : InverseScatteringClosed I := by
  exact And.intro scattering (And.intro evolution (And.intro reconstruct soliton))

end ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean
end HautevilleHouse
