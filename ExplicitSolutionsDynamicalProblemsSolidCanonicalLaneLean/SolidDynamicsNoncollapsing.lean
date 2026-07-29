import ExplicitSolutionsDynamicalProblemsSolid.PhaseSpace

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolid

structure NoncollapsingPackage {G : PhaseSpacePackage}
    {F : EvolutionEquationPackage G} {S : ShortTimeExistencePackage F}
    (Epkg : LyapunovEntropyPackage S) where
  scaleInvariantVolumeBound : Prop
  curvatureScaleControl : Prop
  blowupLimitNoncollapsed : Prop

structure NoncollapsingEvidence {G : PhaseSpacePackage}
    {F : EvolutionEquationPackage G} {S : ShortTimeExistencePackage F}
    {Epkg : LyapunovEntropyPackage S} (N : NoncollapsingPackage Epkg) where
  scaleInvariantVolumeBoundClosed : N.scaleInvariantVolumeBound
  curvatureScaleControlClosed : N.curvatureScaleControl
  blowupLimitNoncollapsedClosed : N.blowupLimitNoncollapsed

def NoncollapsingClosed {G : PhaseSpacePackage}
    {F : EvolutionEquationPackage G} {S : ShortTimeExistencePackage F}
    {Epkg : LyapunovEntropyPackage S} (N : NoncollapsingPackage Epkg) : Prop :=
  N.scaleInvariantVolumeBound ∧ N.curvatureScaleControl ∧ N.blowupLimitNoncollapsed

theorem noncollapsing_closed_from_evidence
    {G : PhaseSpacePackage} {F : EvolutionEquationPackage G}
    {S : ShortTimeExistencePackage F} {Epkg : LyapunovEntropyPackage S}
    (N : NoncollapsingPackage Epkg) (E : NoncollapsingEvidence N) :
    NoncollapsingClosed N := by
  exact And.intro E.scaleInvariantVolumeBoundClosed
    (And.intro E.curvatureScaleControlClosed E.blowupLimitNoncollapsedClosed)

end ExplicitSolutionsDynamicalProblemsSolid
end HautevilleHouse
