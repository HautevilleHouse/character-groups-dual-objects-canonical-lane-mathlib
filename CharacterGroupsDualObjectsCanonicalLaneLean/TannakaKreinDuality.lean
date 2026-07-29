import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Algebra.Category.ModuleCat.Basic

namespace HautevilleHouse
namespace CharacterGroupsDualObjectsCanonicalLaneLean

structure TannakaKreinDualityPackage (G : Type u) [Monoid G] where
  representationCategory : Type v
  fiberFunctor : representationCategory → ModuleCat ℝ
  naturalEndomorphisms : Prop
  reconstructionIsomorphism : G ≃* (End fiberFunctor)

def TannakaKreinDualityClosed {G : Type u} [Monoid G]
    (T : TannakaKreinDualityPackage G) : Prop :=
  T.reconstructionIsomorphism ≠ ∅

end CharacterGroupsDualObjectsCanonicalLaneLean
end HautevilleHouse
