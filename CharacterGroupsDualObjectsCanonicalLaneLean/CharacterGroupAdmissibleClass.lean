import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterGroupsDualObjectsCanonicalLaneLean

structure CharacterGroupAdmittedObject where
  group : Type u
  dualGroup : Type v
  characterMap : group → dualGroup
  topologicalCompatibility : Prop
  PontryaginDuality : Prop
  conclusion : PontryaginDuality

def CharacterGroupWitnessClosed (O : CharacterGroupAdmittedObject) : Prop :=
  O.PontryaginDuality

structure AdmissibleClass where
  object : CharacterGroupAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CharacterGroupWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CharacterGroupsDualObjectsCanonicalLaneLean
end HautevilleHouse
