import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterGroupsDualObjectsCanonicalLaneLean

structure CharacterGroup (A : Type) where
  group : Type
  groupMul : group → group → group
  groupInv : group → group
  groupOne : group
  mulAssoc : ∀ a b c : group, groupMul (groupMul a b) c = groupMul a (groupMul b c)
  oneMul : ∀ a : group, groupMul groupOne a = a
  mulOne : ∀ a : group, groupMul a groupOne = a
  mulLeftInv : ∀ a : group, groupMul (groupInv a) a = groupOne
  characterAction : A → group → group
  characterActionCompatibility : ∀ (φ : A → group) (a b : A), (characterAction (a + b)) = groupMul (characterAction a) (characterAction b)

structure DualObject (A : Type) (G : CharacterGroup A) where
  carrier : Type
  dualPairing : A → A → carrier
  pairingNondegenerate : ∀ a : A, (∀ b : A, dualPairing a b = dualPairing b a) → a = 0
  pairingLinear : ∀ a b c : A, dualPairing (a + b) c = dualPairing a c + dualPairing b c
  pairingCocycle : ∀ a b c : A, dualPairing a (b + c) = dualPairing a b + dualPairing a c

def CharacterGroupClosed {A : Type} (G : CharacterGroup A) : Prop := True

def DualObjectClosed {A : Type} {G : CharacterGroup A} (D : DualObject A G) : Prop := True

end CharacterGroupsDualObjectsCanonicalLaneLean
end HautevilleHouse