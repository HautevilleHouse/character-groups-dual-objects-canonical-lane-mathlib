import canonicalLaneMathlib.AdmissibleClass
import CharacterGroupsDualObjectsCanonicalLaneLean.CharacterGroupObjects

namespace HautevilleHouse
namespace CharacterGroupsDualObjectsCanonicalLaneLean

structure HeisenbergGroupPackage (A : Type) (G : CharacterGroup A) where
  underlyingSet : Type
  multiplication : underlyingSet → underlyingSet → underlyingSet
  groupAxioms : Group underlyingSet
  center : underlyingSet → Prop
  centralExtension : DualObject A G
  cocycle : A → A → underlyingSet
  cocycleCondition : ∀ a b c : A, cocycle a b + cocycle (a + b) c = cocycle a (b + c) + cocycle b c

structure HeisenbergGroupEvidence (A : Type) (G : CharacterGroup A) (H : HeisenbergGroupPackage A G) where
  groupAxiomsClosed : H.groupAxioms
  cocycleConditionClosed : H.cocycleCondition

def HeisenbergGroupClosed (A : Type) (G : CharacterGroup A) (H : HeisenbergGroupPackage A G) : Prop :=
  H.groupAxioms ∧ H.cocycleCondition

theorem heisenberg_group_closed_from_evidence
  (A : Type) (G : CharacterGroup A) (H : HeisenbergGroupPackage A G) (E : HeisenbergGroupEvidence A G H) :
  HeisenbergGroupClosed A G H := by
  exact And.intro E.groupAxiomsClosed E.cocycleConditionClosed

end CharacterGroupsDualObjectsCanonicalLaneLean
end HautevilleHouse