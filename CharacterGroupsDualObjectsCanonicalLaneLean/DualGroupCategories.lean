import HautevilleHouse.CharacterGroupsDualObjectsCanonicalLaneLean.PontryaginBridgeLemmas

namespace HautevilleHouse
namespace CharacterGroupsDualObjectsCanonicalLaneLean

structure DualCategory where
  categoryObjects : Type
  categoryMorphisms : categoryObjects → categoryObjects → Type
  composition : ∀ (A B C : categoryObjects), categoryMorphisms B C → categoryMorphisms A B → categoryMorphisms A C
  identityMorphism : ∀ (A : categoryObjects), categoryMorphisms A A
  dualFunctor : categoryObjects → categoryObjects
  naturalTransformation : Prop
  dualEquivalence : Prop

structure DualCategoryEvidence (C : DualCategory) where
  naturalTransformationClosed : C.naturalTransformation
  dualEquivalenceClosed : C.dualEquivalence

def DualCategoryClosed (C : DualCategory) : Prop :=
  C.naturalTransformation ∧ C.dualEquivalence

theorem dual_category_closed_from_evidence
    (C : DualCategory) (E : DualCategoryEvidence C) : DualCategoryClosed C := by
  exact And.intro E.naturalTransformationClosed E.dualEquivalenceClosed

end CharacterGroupsDualObjectsCanonicalLaneLean
end HautevilleHouse