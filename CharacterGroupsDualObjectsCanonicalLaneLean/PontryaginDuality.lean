import canonicalLaneMathlib.AdmissibleClass
import CharacterGroupsDualObjectsCanonicalLaneLean.CharacterGroupObjects

namespace HautevilleHouse
namespace CharacterGroupsDualObjectsCanonicalLaneLean

structure PontryaginDualityPackage (A : Type) (G : CharacterGroup A) (D : DualObject A G) where
  topologicalGroup : Type
  topologicalGroupTopology : TopologicalSpace topologicalGroup
  characterGroupIsTopological : Prop
  dualIsTopological : Prop
  pontryaginMap : A → topologicalGroup → topologicalGroup
  pontryaginMapContinuous : Continuous (λ x : A × topologicalGroup => pontryaginMap x.1 x.2)
  bijection : ∀ (x : topologicalGroup), ∃ (a : A), ∀ (b : A), D.dualPairing a b = D.dualPairing b (a)
  dualOfDual : D.carrier → A
  bijectionInverse : ∀ (a : A), dualOfDual (pontryaginMap a) = a

structure PontryaginDualityEvidence (A : Type) (G : CharacterGroup A) (D : DualObject A G) (P : PontryaginDualityPackage A G D) where
  topologicalGroupClosed : P.topologicalGroup
  pontryaginMapContinuousClosed : P.pontryaginMapContinuous
  bijectionClosed : P.bijection

def PontryaginDualityClosed (A : Type) (G : CharacterGroup A) (D : DualObject A G) (P : PontryaginDualityPackage A G D) : Prop :=
  P.topologicalGroup ∧ P.pontryaginMapContinuous ∧ P.bijection

theorem pontryagin_duality_closed_from_evidence
  (A : Type) (G : CharacterGroup A) (D : DualObject A G) (P : PontryaginDualityPackage A G D) (E : PontryaginDualityEvidence A G D P) :
  PontryaginDualityClosed A G D P := by
  exact And.intro E.topologicalGroupClosed (And.intro E.pontryaginMapContinuousClosed E.bijectionClosed)

end CharacterGroupsDualObjectsCanonicalLaneLean
end HautevilleHouse