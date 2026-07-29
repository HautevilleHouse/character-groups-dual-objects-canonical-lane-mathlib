import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterGroupsDualObjectsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A.object with
  | CharacterGroupDualObject charGroup dualSpace _ _ =>
    ∀ (x : charGroup.carrier), x ≠ charGroup.identity → ∃ (f : dualSpace), A.object.pairing x f ≠ 0

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  match A with
  | ⟨CharacterGroupDualObject.charGroup _ _ _ _ A.nondegenerate _, _⟩ =>
    fun x hx => A.nondegenerate x hx

end CharacterGroupsDualObjectsCanonicalLaneLean
end HautevilleHouse