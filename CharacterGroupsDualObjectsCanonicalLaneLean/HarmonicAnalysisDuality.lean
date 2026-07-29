import HautevilleHouse.CharacterGroupsDualObjectsCanonicalLaneLean.DualGroupCategories

namespace HautevilleHouse
namespace CharacterGroupsDualObjectsCanonicalLaneLean

structure FourierTransformPackage (G : DualCharacterGroup) where
  characterSpace : Type
  fourierTransform : (G.groupType → ℂ) → (G.topologicalDual → ℂ)
  inversionFormula : Prop
  plancherelTheorem : Prop
  poissonSummation : Prop

structure FourierTransformEvidence {G : DualCharacterGroup}
    (F : FourierTransformPackage G) where
  inversionFormulaClosed : F.inversionFormula
  plancherelTheoremClosed : F.plancherelTheorem
  poissonSummationClosed : F.poissonSummation

def FourierTransformClosed {G : DualCharacterGroup}
    (F : FourierTransformPackage G) : Prop :=
  F.inversionFormula ∧ F.plancherelTheorem ∧ F.poissonSummation

theorem fourier_transform_closed_from_evidence
    {G : DualCharacterGroup} (F : FourierTransformPackage G)
    (E : FourierTransformEvidence F) : FourierTransformClosed F := by
  exact And.intro E.inversionFormulaClosed
    (And.intro E.plancherelTheoremClosed E.poissonSummationClosed)

end CharacterGroupsDualObjectsCanonicalLaneLean
end HautevilleHouse