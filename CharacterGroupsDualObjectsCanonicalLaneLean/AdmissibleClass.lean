import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterGroupsDualObjectsCanonicalLaneLean

structure AdmissibleClass where
  object : CharacterGroupAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CharacterGroupWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CharacterGroupsDualObjectsCanonicalLaneLean
end HautevilleHouse