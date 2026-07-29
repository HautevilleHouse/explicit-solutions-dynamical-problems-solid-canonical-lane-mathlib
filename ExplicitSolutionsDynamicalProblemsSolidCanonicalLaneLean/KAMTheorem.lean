import canonicalLaneMathlib.AdmissibleClass
import ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean.PhaseSpace
import ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean.IntegrableSystem

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean

structure KAMTheoremPackage {P : PhaseSpace} {I : IntegrableSystem P} where
  invariantTorusPersistence : Prop
  diophantineConditionSatisfied : Prop
  smallPerturbationBound : Prop
  measureOfToriPositive : Prop

def KAMTheoremClosed {P : PhaseSpace} {I : IntegrableSystem P} (K : KAMTheoremPackage P I) : Prop :=
  K.invariantTorusPersistence ∧ K.diophantineConditionSatisfied ∧ K.smallPerturbationBound ∧ K.measureOfToriPositive

theorem kam_theorem_closed_from_evidence {P : PhaseSpace} {I : IntegrableSystem P} (K : KAMTheoremPackage P I) (persistence : K.invariantTorusPersistence) (diophantine : K.diophantineConditionSatisfied) (perturbation : K.smallPerturbationBound) (measure : K.measureOfToriPositive) : KAMTheoremClosed K := by
  exact And.intro persistence (And.intro diophantine (And.intro perturbation measure))

end ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean
end HautevilleHouse
