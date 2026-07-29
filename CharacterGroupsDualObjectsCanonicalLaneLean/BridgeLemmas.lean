import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterGroupsDualObjectsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CharacterGroupWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CharacterGroupsDualObjectsCanonicalLaneLean
end HautevilleHouse
