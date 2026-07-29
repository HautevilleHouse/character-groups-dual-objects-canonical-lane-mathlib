import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CharacterGroupsDualObjectsCanonicalLaneLean.PontryaginDuality

namespace HautevilleHouse
namespace CharacterGroupsDualObjectsCanonicalLaneLean

open scoped Real

structure AbelianCharacterGroup extends CharacterGroup where
  abelian : CommGroup carrier

theorem abelian_dual_abelian (G : AbelianCharacterGroup) : CommGroup (dualCharacterGroup G).carrier := by
  refine { mul_comm := λ χ ψ => ?_, ..(dualCharacterGroup G).groupStructure }
  ext x; simp [mul_comm]

def FourierTransform (G : AbelianCharacterGroup) [MeasureSpace G] [SecondCountableTopology G] : (G.carrier → ℂ) → ((dualCharacterGroup G).carrier → ℂ) := λ f χ => ∫ g : G.carrier, f g * conj (χ.1 g) ∂ volume

theorem FourierInversion (G : CompactAbelianCharacterGroup) (f : G.carrier → ℂ) : FourierTransform (FourierTransform f) (λ g => (χ ↦ χ.1 g)) = f := by
  ext x
  calc
    (FourierTransform (FourierTransform f) (λ g => (χ ↦ χ.1 g))) x
        = ∫ y : G.carrier, (FourierTransform f) y * conj ((λ g => (χ ↦ χ.1 g)) y x) ∂ volume := rfl
    _ = ∫ y : G.carrier, (∫ z : G.carrier, f z * conj (y.1 z) ∂ volume) * conj ((λ g : G.carrier => (χ : (dualCharacterGroup G).carrier ↦ χ.1 g) x) y) ∂ volume := rfl
    _ = ∫ y : G.carrier, (∫ z : G.carrier, f z * conj (y.1 z) ∂ volume) * conj (y.1 x) ∂ volume := by simp
    _ = ∫ y : G.carrier, ∫ z : G.carrier, (f z * conj (y.1 z)) * conj (y.1 x) ∂ volume ∂ volume := by
      refine integral_congr (λ y => ?_)
      simp_rw [smul_eq_mul, mul_comm, mul_assoc]
    _ = ∫ y : G.carrier, ∫ z : G.carrier, f z * (conj (y.1 z) * conj (y.1 x)) ∂ volume ∂ volume := by
      refine integral_congr (λ y => ?_)
      ext z
      ring
    _ = ∫ y : G.carrier, ∫ z : G.carrier, f z * conj ((y.1 z) * (y.1 x)) ∂ volume ∂ volume := by
      refine integral_congr (λ y => ?_)
      ext z
      simp [map_mul, mul_comm]
    _ = ∫ y : G.carrier, ∫ z : G.carrier, f z * conj (y.1 (z * x)) ∂ volume ∂ volume := by
      refine integral_congr (λ y => ?_)
      ext z
      simp [map_mul]
    _ = ∫ y : G.carrier, ∫ z : G.carrier, f (z * x⁻¹) * conj (y.1 z) ∂ volume ∂ volume := by
      refine integral_congr (λ y => ?_)
      refine (integral_comp_mul_right (λ z => f z * conj (y.1 z)) (x := x)).symm ▸ ?_
      calc
        ∫ z : G.carrier, f (z * x⁻¹⁻¹) * conj (y.1 (z * x⁻¹)) ∂ volume = ∫ z : G.carrier, f (z * x) * conj (y.1 (z * x)) ∂ volume := by simp
        _ = ∫ z : G.carrier, f z * conj (y.1 z) ∂ volume := by
          refine (integral_comp_mul_right (λ z => f z * conj (y.1 z)) (x := x⁻¹)).symm ▸ ?_
          simp
    _ = (∫ y : G.carrier, 1 ∂ volume) * f x := by
      have h : (∫ y : G.carrier, ∫ z : G.carrier, f (z * x⁻¹) * conj (y.1 z) ∂ volume ∂ volume) = f x * (∫ y : G.carrier, 1 ∂ volume) := by
        calc
          (∫ y : G.carrier, ∫ z : G.carrier, f (z * x⁻¹) * conj (y.1 z) ∂ volume ∂ volume) = (∫ z : G.carrier, f (z * x⁻¹) * (∫ y : G.carrier, conj (y.1 z) ∂ volume) ∂ volume) := by
            refine integral_integral_swap (λ y z => f (z * x⁻¹) * conj (y.1 z)) ?_
            exact IsFiniteMeasure.integrableOn (by
              have : IsCompact (Set.univ : Set G.carrier) := by
                apply isCompact_iff_compactSpace.mpr
                exact inferInstance
              exact this.integrableOn)
        _ = ∫ z : G.carrier, f (z * x⁻¹) * (if z = 0 then (∫ y : G.carrier, 1 ∂ volume) else 0) ∂ volume := by
          refine integral_congr (λ z => ?_)
          have hz : (∫ y : G.carrier, conj (y.1 z) ∂ volume) = if z = 0 then (∫ y : G.carrier, 1 ∂ volume) else 0 := by
            apply orthogonality_of_characters
          simp [hz]
        _ = ∫ z : G.carrier, f (z * x⁻¹) * (if z = 0 then (∫ y : G.carrier, 1 ∂ volume) else 0) ∂ volume := rfl
        _ = (∫ y : G.carrier, 1 ∂ volume) * f x := by
          calc
            ∫ z : G.carrier, f (z * x⁻¹) * (if z = 0 then (∫ y : G.carrier, 1 ∂ volume) else 0) ∂ volume = f (0 * x⁻¹) * (∫ y : G.carrier, 1 ∂ volume) := by
              refine integral_eq_integral_delta (λ z => f (z * x⁻¹)) (0 : G.carrier) ?_
              simp
            _ = f x * (∫ y : G.carrier, 1 ∂ volume) := by
              simp
      calc
        (∫ y : G.carrier, ∫ z : G.carrier, f (z * x⁻¹) * conj (y.1 z) ∂ volume ∂ volume) = f x * (∫ y : G.carrier, 1 ∂ volume) := h
        _ = (∫ y : G.carrier, 1 ∂ volume) * f x := mul_comm _ _
    _ = f x := by
      have : (∫ y : G.carrier, 1 ∂ volume) = 1 := by
        apply integral_one
        exact isProbabilityMeasure_volume
      simp [this]

end CharacterGroupsDualObjectsCanonicalLaneLean
end HautevilleHouse