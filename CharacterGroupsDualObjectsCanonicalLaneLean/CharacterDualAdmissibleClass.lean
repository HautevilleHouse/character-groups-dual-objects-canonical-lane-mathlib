import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterGroupsDualObjectsCanonicalLaneLean

structure DualCharacterGroup where
  groupType : Type
  groupOperation : groupType → groupType → groupType
  identityElement : groupType
  inverseElement : groupType → groupType
  isAbelian : Prop
  topologicalDual : Type
  dualityPairing : groupType → topologicalDual → Prop
  pontryaginDuality : Prop
  dualityWitness : pontryaginDuality

structure AdmissibleDualCharacterObject where
  group : DualCharacterGroup
  localCompactness : Prop
  selfDuality : Prop
  conclusion : selfDuality

structure AdmissibleClass where
  object : AdmissibleDualCharacterObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CharacterGroupsDualObjectsCanonicalLaneLean
end HautevilleHouse