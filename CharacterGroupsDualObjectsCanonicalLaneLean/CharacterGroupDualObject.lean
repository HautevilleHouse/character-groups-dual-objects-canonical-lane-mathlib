import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterGroupsDualObjectsCanonicalLaneLean

structure CharacterGroup where
  carrier : Type u
  groupOp : carrier → carrier → carrier
  identity : carrier
  inverse : carrier → carrier
  groupLaws : Groupoid carrier groupOp identity inverse

def dualObject (G : CharacterGroup) : Type u := G.carrier → ℂ

structure CharacterGroupDualObject where
  characterGroup : CharacterGroup
  dualSpace : Type u
  pairing : characterGroup.carrier → dualSpace → ℂ
  nondegenerate : ∀ (x : characterGroup.carrier), x ≠ characterGroup.identity → ∃ (f : dualSpace), pairing x f ≠ 0
  separatePoints : ∀ (f : dualSpace), f ≠ 0 → ∃ (x : characterGroup.carrier), pairing x f ≠ 0

end CharacterGroupsDualObjectsCanonicalLaneLean
end HautevilleHouse