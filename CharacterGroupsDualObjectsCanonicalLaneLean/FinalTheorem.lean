import canonicalLaneMathlib.AdmissibleClass
import CharacterGroupsDualObjectsCanonicalLaneLean.BohrCompactification

namespace HautevilleHouse
namespace CharacterGroupsDualObjectsCanonicalLaneLean

def CharacterGroupsDualObjectsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem character_groups_dual_objects_endgame (A : AdmissibleClass) :
    CharacterGroupsDualObjectsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CharacterGroupsDualObjectsCanonicalLaneLean
end HautevilleHouse