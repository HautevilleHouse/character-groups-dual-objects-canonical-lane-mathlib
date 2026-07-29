import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterGroupsDualObjectsCanonicalLaneLean

structure L1GroupAlgebra (G : CharacterGroup) where
  carrier : Type u
  multiplication : carrier → carrier → carrier
  involution : carrier → carrier
  norm : carrier → ℝ
  complete : MetricSpace carrier
  convolution : carrier → carrier → carrier
  convolutionAssociative : ∀ f g h : carrier, convolution (convolution f g) h = convolution f (convolution g h)
  fourierTransform : carrier → (G.carrier → ℂ)
  isometry : Isometry (fun f : carrier => fourierTransform f)

structure PlancherelTheorem (G : CompactAbelianGroup) where
  fourierTransformOnDenseSubset : L1GroupAlgebra G.carrier → Submodule ℂ (G.carrier → ℂ)
  isometricExtension : Isometry (fourierTransformOnDenseSubset.val : G.carrier → ℂ)
  unitaryExtension : UnitaryOperator (G.carrier → ℂ) (G.carrier → ℂ)

end CharacterGroupsDualObjectsCanonicalLaneLean
end HautevilleHouse