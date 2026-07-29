import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterGroupsDualObjectsCanonicalLaneLean

structure CharacterGroupAdmittedObject where
  group : Type
  dualGroup : Type
  pairing : group → dualGroup → Prop
  dualityTheorems : Prop
  conclusion : dualityTheorems

def CharacterGroupWitnessClosed (O : CharacterGroupAdmittedObject) : Prop :=
  O.dualityTheorems

end CharacterGroupsDualObjectsCanonicalLaneLean
end HautevilleHouse