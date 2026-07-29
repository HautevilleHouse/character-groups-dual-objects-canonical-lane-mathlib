import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterGroupsDualObjectsCanonicalLaneLean

structure CharacterGroup where
  carrier : Type u
  groupStructure : Group carrier

def dualCharacterGroup (G : CharacterGroup) : CharacterGroup where
  carrier := { χ : G.carrier → Circle | χ (1 : G.carrier) = 1 ∧ ∀ a b : G.carrier, χ (a * b) = χ a * χ b }
  groupStructure := by
    refine { mul := λ f g x => f x * g x, one := λ _ => 1, inv := λ f x => (f x)⁻¹, mul_assoc := ?_, one_mul := ?_, mul_one := ?_, mul_left_inv := ?_ }
    · intro f g h; ext x; simp
    · intro f; ext x; simp
    · intro f; ext x; simp
    · intro f; ext x; simp

def bidualEmbedding (G : CharacterGroup) : G.carrier → (dualCharacterGroup (dualCharacterGroup G)).carrier := by
  intro g
  refine ⟨λ χ => χ.1 g, ?_⟩
  simp

theorem bidualEmbedding_injective (G : CharacterGroup) : Function.Injective (bidualEmbedding G) := by
  intro g h eq
  have h_sep : ∀ (g h : G.carrier), (∀ χ : (dualCharacterGroup G).carrier, χ.1 g = χ.1 h) → g = h := by
    intro g h h_char
    exact AdmissibleClass.separatesPoints G g h h_char
  have h_char_eq : ∀ χ : (dualCharacterGroup G).carrier, χ.1 g = χ.1 h := by
    intro χ
    have h_val : (bidualEmbedding G g).1 = (bidualEmbedding G h).1 := by
      simpa using congrArg Subtype.val eq
    have h_fun := congr_fun h_val χ
    simpa [bidualEmbedding] using h_fun
  exact h_sep g h h_char_eq

end CharacterGroupsDualObjectsCanonicalLaneLean
end HautevilleHouse