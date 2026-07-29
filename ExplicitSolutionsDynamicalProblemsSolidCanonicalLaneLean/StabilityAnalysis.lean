import ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean.ExplicitSolvability

/-!
# Stability Analysis Package
-/

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean

structure StabilityAnalysisPackage where
  lyapunovDirectMethod : Prop
  eigenvalueAnalysis : Prop
  perturbationBound : Prop
  asymptoticDecay : Prop

def StabilityAnalysisClosed (S : StabilityAnalysisPackage) : Prop :=
  S.lyapunovDirectMethod ∧ S.eigenvalueAnalysis ∧ S.perturbationBound ∧ S.asymptoticDecay

structure StabilityAnalysisEvidence (S : StabilityAnalysisPackage) where
  lyapunovDirectMethodClosed : S.lyapunovDirectMethod
  eigenvalueAnalysisClosed : S.eigenvalueAnalysis
  perturbationBoundClosed : S.perturbationBound
  asymptoticDecayClosed : S.asymptoticDecay

theorem stability_analysis_closed_from_evidence
    (S : StabilityAnalysisPackage) (Ev : StabilityAnalysisEvidence S) :
    StabilityAnalysisClosed S := by
  exact And.intro Ev.lyapunovDirectMethodClosed
    (And.intro Ev.eigenvalueAnalysisClosed
      (And.intro Ev.perturbationBoundClosed Ev.asymptoticDecayClosed))

end ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean
end HautevilleHouse