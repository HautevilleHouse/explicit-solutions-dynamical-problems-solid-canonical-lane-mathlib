import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean

structure LieGroupReductionPackage where
  configSpace : Type u
  lieGroup : Type v
  action : lieGroup → configSpace → configSpace
  invariantFunctions : List (configSpace → ℝ)
  reducedSpace : Type w
  symplecticStructure : Type x
  explicitReduction : Prop
  reductionMapExplicit : Prop
  reducedDynamicsExplicit : Prop

structure LieGroupReductionEvidence (L : LieGroupReductionPackage) where
  explicitReductionClosed : L.explicitReduction
  reductionMapExplicitClosed : L.reductionMapExplicit
  reducedDynamicsExplicitClosed : L.reducedDynamicsExplicit

def LieGroupReductionClosed (L : LieGroupReductionPackage) : Prop :=
  L.explicitReduction ∧ L.reductionMapExplicit ∧ L.reducedDynamicsExplicit

theorem lie_group_reduction_closed_from_evidence (L : LieGroupReductionPackage)
    (Ev : LieGroupReductionEvidence L) : LieGroupReductionClosed L := by
  exact And.intro Ev.explicitReductionClosed
    (And.intro Ev.reductionMapExplicitClosed Ev.reducedDynamicsExplicitClosed)

end ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean
end HautevilleHouse