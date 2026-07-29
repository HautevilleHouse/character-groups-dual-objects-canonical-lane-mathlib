import canonicalLaneMathlib.AdmissibleClass
import CharacterGroupsDualObjectsCanonicalLaneLean.CharacterGroupObjects

namespace HautevilleHouse
namespace CharacterGroupsDualObjectsCanonicalLaneLean

structure MonoidalCategory where
  obj : Type
  hom : obj → obj → Type
  tensor : obj → obj → obj
  unit : obj
  associator : ∀ A B C : obj, (tensor (tensor A B) C) → (tensor A (tensor B C))
  unitors : ∀ A : obj, (tensor A unit) → A
  coherence : Prop

structure TannakaKreinPackage (A : Type) (G : CharacterGroup A) (M : MonoidalCategory) where
  representationFunctor : A → M.obj → M.obj
  representationCompatibility : ∀ (a b : A) (X : M.obj), representationFunctor (a + b) X = M.tensor (representationFunctor a X) (representationFunctor b X)
  dualObject : M.obj
  dualPairing : M.obj → M.obj → M.obj
  isomorphisms : ∀ X : M.obj, M.hom (M.tensor (representationFunctor G.groupOne X) (dualObject)) X

structure TannakaKreinEvidence (A : Type) (G : CharacterGroup A) (M : MonoidalCategory) (T : TannakaKreinPackage A G M) where
  representationCompatibilityClosed : T.representationCompatibility
  isomorphismsClosed : T.isomorphisms

def TannakaKreinClosed (A : Type) (G : CharacterGroup A) (M : MonoidalCategory) (T : TannakaKreinPackage A G M) : Prop :=
  T.representationCompatibility ∧ T.isomorphisms

theorem tannaka_krein_closed_from_evidence
  (A : Type) (G : CharacterGroup A) (M : MonoidalCategory) (T : TannakaKreinPackage A G M) (E : TannakaKreinEvidence A G M T) :
  TannakaKreinClosed A G M T := by
  exact And.intro E.representationCompatibilityClosed E.isomorphismsClosed

end CharacterGroupsDualObjectsCanonicalLaneLean
end HautevilleHouse