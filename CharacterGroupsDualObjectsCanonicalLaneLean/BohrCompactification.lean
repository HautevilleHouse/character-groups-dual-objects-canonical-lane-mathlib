import canonicalLaneMathlib.AdmissibleClass
import CharacterGroupsDualObjectsCanonicalLaneLean.PontryaginDuality

namespace HautevilleHouse
namespace CharacterGroupsDualObjectsCanonicalLaneLean

structure BohrCompactificationPackage (A : Type) (G : CharacterGroup A) (D : DualObject A G) (P : PontryaginDualityPackage A G D) where
  almostPeriodicFunctions : Type
  compactHausdorffGroup : Type
  groupStructure : Group compactHausdorffGroup
  compactTopology : TopologicalSpace compactHausdorffGroup
  denseEmbedding : compactHausdorffGroup → P.topologicalGroup
  universalProperty : ∀ (H : Type) [Group H] [TopologicalSpace H] [CompactSpace H] [T2Space H] [TopologicalGroup H] (φ : A → H) (cont : Continuous φ) (hom : ∀ a b : A, φ (a + b) = φ a * φ b), ∃! ψ : compactHausdorffGroup → H, Continuous ψ ∧ ∀ a : A, ψ (denseEmbedding a) = φ a

structure BohrCompactificationEvidence (A : Type) (G : CharacterGroup A) (D : DualObject A G) (P : PontryaginDualityPackage A G D) (B : BohrCompactificationPackage A G D P) where
  denseEmbeddingClosed : B.denseEmbedding
  universalPropertyClosed : B.universalProperty

def BohrCompactificationClosed (A : Type) (G : CharacterGroup A) (D : DualObject A G) (P : PontryaginDualityPackage A G D) (B : BohrCompactificationPackage A G D P) : Prop :=
  B.denseEmbedding ∧ B.universalProperty

theorem bohr_compactification_closed_from_evidence
  (A : Type) (G : CharacterGroup A) (D : DualObject A G) (P : PontryaginDualityPackage A G D) (B : BohrCompactificationPackage A G D P) (E : BohrCompactificationEvidence A G D P B) :
  BohrCompactificationClosed A G D P B := by
  exact And.intro E.denseEmbeddingClosed E.universalPropertyClosed

end CharacterGroupsDualObjectsCanonicalLaneLean
end HautevilleHouse