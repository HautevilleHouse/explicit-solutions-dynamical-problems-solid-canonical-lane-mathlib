import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean

structure SolitonPDEPackage where
  fieldSpace : Type u
  pde : (fieldSpace → ℝ) → (fieldSpace → ℝ)
  solitonSolution : fieldSpace → ℝ
  travelingWaveAnsatz : Prop
  exactProfile : Prop
  stability : Prop
  conservationLaws : Prop

structure SolitonPDEEvidence (S : SolitonPDEPackage) where
  travelingWaveAnsatzClosed : S.travelingWaveAnsatz
  exactProfileClosed : S.exactProfile
  stabilityClosed : S.stability
  conservationLawsClosed : S.conservationLaws

def SolitonPDEClosed (S : SolitonPDEPackage) : Prop :=
  S.travelingWaveAnsatz ∧ S.exactProfile ∧ S.stability ∧ S.conservationLaws

theorem soliton_pde_closed_from_evidence (S : SolitonPDEPackage)
    (Ev : SolitonPDEEvidence S) : SolitonPDEClosed S := by
  exact And.intro Ev.travelingWaveAnsatzClosed
    (And.intro Ev.exactProfileClosed
      (And.intro Ev.stabilityClosed Ev.conservationLawsClosed))

end ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean
end HautevilleHouse