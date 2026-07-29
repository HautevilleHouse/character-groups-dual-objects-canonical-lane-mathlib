import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Algebra.CompactOpen

namespace HautevilleHouse
namespace CharacterGroupsDualObjectsCanonicalLaneLean

structure CompactOpenTopologyPackage (G : Type u) [TopologicalSpace G] where
  dualGroup : Set (G → circle)
  compactOpenTopology : TopologicalSpace (G → circle)
  continuousDualGroup : TopologicalSpace (dualGroup : Set (G → circle))
  equicontinuity : Prop
  arensRoyalty : Prop

def CompactOpenTopologyClosed {G : Type u} [TopologicalSpace G]
    (P : CompactOpenTopologyPackage G) : Prop :=
  P.equicontinuity ∧ P.arensRoyalty

end CharacterGroupsDualObjectsCanonicalLaneLean
end HautevilleHouse
