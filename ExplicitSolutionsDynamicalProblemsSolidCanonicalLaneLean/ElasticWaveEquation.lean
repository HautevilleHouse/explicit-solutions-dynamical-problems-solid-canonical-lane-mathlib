import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean

structure ElasticWavePackage where
  shearModulus : ℝ
  poissonRatio : ℝ
  massDensity : ℝ
  waveSpeedEffective : ℝ
  waveSpeedEffectiveTerm : waveSpeedEffective = Real.sqrt (shearModulus / massDensity)

def ElasticWaveClosed (E : ElasticWavePackage) : Prop :=
  E.waveSpeedEffective > 0

theorem elastic_wave_closed (E : ElasticWavePackage) : ElasticWaveClosed E := by
  have hpos : E.shearModulus > 0 := by
    unfold ElasticWavePackage at E
    exact E.waveSpeedEffectiveTerm
  have hdens : E.massDensity > 0 := by
    unfold ElasticWavePackage at E
    exact E.waveSpeedEffectiveTerm
  have h : E.waveSpeedEffective > 0 := by
    nlinarith
  exact h

end ExplicitSolutionsDynamicalProblemsSolidCanonicalLaneLean
end HautevilleHouse